////////////////////////////////////////////////////////////////
///////////////implementation description///////////////////////
/////1. each thread group generate a 64X128. by multiply block A(64XK) and block B (KX128).
/////2. each thread group's input block A addressed by thread gourp idy,  block B addressed by thread gourp idx.
/////3. re-construct 8 waves into 2 dimensional  2 groups of 4 waves group(0) for fetch , group(1) for mac
/////3. each thread group has 8 waves. 4 waves are used for fetching 64x128x32 elements and other 4 waves are used for math
/////4. math waves use barrier to sync with fetch waves
/////5. each wave generate a 64X32,  by multiply block A(64XK) and block B (KX32)
/////6. in each loop, each wave multiply block A(64X32) and block B (32X32),  wave mem data load as belowing:
///           Matrix A (K)                       Matrix B (N)
///           ---------32              --------4-------8------12-------16---------32---------- 64------------128----------
///           0   w0Ab0                -       |       |       |       |          |            |              |             |            |
///           4   w0Ab1                -       |       |       |       |          |            |              |             |            |
///           8   w0Ab2                -       |       |       |       |          |            |              |             |            |
///          12   w0Ab3                -       |       |       |       |          |            |              |             |            |
///      (M) 16   w1Ab0           (K)  - w0Bb0 | w0Bb1 | w0Bb2 | w0Bb3 | w0Bb[4-7]| w1Bb[0-7]  |  w2Bb[0-7]   | w3Bb[0-7]   |            |
///           -                        -       |       |       |       |          |            |              |             |            |
///          ...                       -       |       |       |       |          |            |              |             |            |
///          32   w2Ab0                -       |       |       |       |          |            |              |             |            |
///          ...                      32       |       |       |       |          |            |              |             |            |
///          48   w3Ab0
///          ..
///          60   w3Ab3
//////////////////////////////////////////////////////////////////
//////sreg def/////////////

var sgprKernArgAddress = 0
var sgprWorkGroup0 = 2
var sgprWorkGroup1 = 3
var sgprWorkGroup2 = 4
var sgprNumWorkGroups0=5
var sgprNumWorkGroups1=6
var sgprSrdA=8
var sgprSrdB=12
var sgprSrdC=16
var sgprSrdD=20
var sgprTensor2dSizeA= 24
var sgprTensor2dSizeB= 26
var sgprTensor2dSizeC= 28
var sgprSaveExecMask= 30
var sgprAddressD= 32
var sgprAddressC= 34
var sgprStridesD= 36
var sgprStridesC= 38
var sgprAlpha= 40
var sgprBeta= 41
var sgprSizesFree = 42
var sgprSizesSum  = 45
var sgprLoopCounters= 46
var sgprOrigLoopCounter= 47
var sgprStridesA= 48
var sgprStridesB= 50
var sgprAddressA= 52
var sgprAddressB= 54
var sgprShadowLimitA= 56
var sgprShadowLimitB= 58
var sgprOrigStaggerUIter= 60
var sgprStaggerUIter= 61
var sgprWrapUA= 62
var sgprWrapUB= 64
var sgprNumFullBlocks= 66
var sgprWgmRemainder1= 67
var sgprMagicNumberWgmRemainder1= 68
var sgprGlobalReadIncsA= 69
var sgprGlobalReadIncsB= 70
var sgprScalarGlobalReadOffsetA=71
var sgprScalarGlobalReadOffsetB=74
var sgprLocalWriteAddrA=76
var sgprLocalWriteAddrB=78
var hw_id = 80
var sgprFetchSubGrpId=82
var sgprSimdTileX=88
var sgprSimdTileY=89


/////compute fetch def////////////////
var vgprG2LA=0  // 16
var vgprG2LB=16 // 32
var vgprLocalWriteAddrA=48  // 2
var vgprLocalWriteAddrB=50  // 2
var vgprGlobalReadOfvarA=52 // 8
var vgprGlobalReadOfvarB=60 // 16

/////compute vreg def////////////////

var vgprValuC=0
var vgprAcc=0
var vgprValuA_X0_I0=32
var vgprValuB_X0_I0=48
var vgprLocalReadAddrA=80
var vgprLocalReadAddrB=82
var vgprLocalWriteAddrC=84
var vgprLocalReadAddrC=85
var vgprSerial=100
var vgprGlobalWriteOfvarC=104
var vgprTmp=106

////constant def/////////////
var varlds_pad             = 8
var varlds_Asize_per_wr    = 256+varlds_pad             // each load inst load one 32X4 block.    need contiunous 32X4X2=256    bytes in LDS
var varlds_Asize_per_wave  = varlds_Asize_per_wr * 8    // each wave load 4 32X4 block one time.  need contiunous 32X4X4X2=1024 bytes in LDS
var varlds_Asize_per_wg    = varlds_Asize_per_wave * 4  // WG load 16 32X4 block(64X32) Matrix A to lds for pingpong.
var M_row_per_WG           = 64                         // each WG process 64 row
var varlds_Bsize_per_wr    = 256+varlds_pad             // each load inst load one 32X4  block.    need contiunous 32X4X2=256     bytes in LDS
var varlds_Bsize_per_wave  = varlds_Bsize_per_wr * 16   // each wave load seperate 32X64 block.    need contiunous 32X4X8X2=2048 bytes in LDS
var varlds_Bsize_per_wg    = varlds_Bsize_per_wave * 4  // WG load 64 32X4 block(32X256) Matrix B to lds for pingpong.
var varA_lds_base_addr     = 0
var varB_lds_base_addr     = varA_lds_base_addr + varlds_Asize_per_wg * 2  //in bytes

var varlds_output_m          = 32                     // * bpe
var varlds_output_m_stride   = varlds_output_m
var varlds_output_per_wave   = varlds_output_m_stride * 64


function v_regs(base, offset)
    var v_idx
    v_idx = base + offset
    return v[v_idx]
end

function s_regs(base, offset)
    var s_idx
    s_idx = base + offset
    return s[s_idx]
end

/**********************************************************/
/* 2GB limit - set offsets to -1 to exceed this and clamp */
/**********************************************************/
var BufferLimit=0x80000000

/************************************************/
/* Bits 127:96 of SRD.  Set DataFormat = 32 bit */
/************************************************/
var Srd127_96=0x0020000

var roundMaskVal=0xffff0000

shader main
  type(CS)

  user_sgpr_count(14)
  tgid_x_en(1)                                                  // s_tgid_x
  tgid_y_en(1)                                                  // s_tgid_y
  tgid_z_en(1)                                                  // s_tgid_z
  tidig_comp_cnt(2)


  /* Load Kernel Args */
  s_load_dwordx4 s[sgprAddressA:sgprAddressB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x28 //
  s_load_dwordx4 s[sgprStridesA+0:sgprStridesB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x50 //
  s_load_dwordx4 s[sgprTensor2dSizeA+0:sgprTensor2dSizeB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8 //
  s_load_dword s[sgprSizesSum+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c //

  //s_load_dword s[sgprTensor2dSizeA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8 //
  //s_load_dword s[sgprTensor2dSizeA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0xc //
  //s_load_dword s[sgprTensor2dSizeB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x10 //
  //s_load_dword s[sgprTensor2dSizeB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x14 //
  //s_load_dword s[sgprAddressA], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x28 //
  //s_load_dword s[sgprAddressA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x2c //
  //s_load_dword s[sgprAddressB], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x30 //
  //s_load_dword s[sgprAddressB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x34 //
  //s_load_dword s[sgprStridesA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x50 //
  //s_load_dword s[sgprStridesA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x54 //
  //s_load_dword s[sgprStridesB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x58 //
  //s_load_dword s[sgprStridesB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x5c //
  //s_load_dword s[sgprSizesSum+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c //


  s_mov_b32            m0,0xCC00                                       // LDS camp at 12288 bytes

  //vgprSerial  holds threadIdx
  //vgprSerial+1  holds WaveFrontId (0-63)
  //vgprSerial+2  holds threadIdy  (simd= 0,1,2,3)
  //vgprSerial+3  holds threadIdZ  (wave0 =0 wave1 = 1)

  //HW_ID_REG
  //bit[0-3] //waveId
  //bit[5-4] //simdId
  //bit[11-8] //CuId

  v_mov_b32             v[vgprSerial], v0                //thread serial Id
  v_and_b32             v[vgprSerial+1], 0x3f, v0                //threadId-x

  v_lshrrev_b32        v2,  6,  v[vgprSerial]

  //Fetchid -- wave that fetches 16 rows in 64;; uses simdId
  s_getreg_b32          s[hw_id], hwreg(HW_REG_HW_ID)
  v_and_b32             v4, 0x30, s[hw_id]
  v_lshrrev_b32         v[vgprSerial+2], 4, v4                    //simdId
  v_readfirstlane_b32   s[sgprFetchSubGrpId], v[vgprSerial+2]
  v_and_b32             v[vgprSerial+3], 0xf, s[hw_id]                //waveId
  v_readfirstlane_b32   s[hw_id+1], v[vgprSerial+3]
  s_and_b32             s[sgprSimdTileX], s[sgprFetchSubGrpId], 0x1
  s_lshr_b32            s[sgprSimdTileY], s[sgprFetchSubGrpId], 0x1

  s_cmp_eq_u32     s[hw_id+1], 1
  s_cbranch_scc0   wave0_entry_start

  s_waitcnt lgkmcnt(0)                               // wait for 144 bytes of kern args

//WorkgroupId agnostic address calculation
//s[workGroup0] provides MT0 tile number  that this workgroup working
//s[workGroup1] provides MT1 tile number that this workgroup working
// use tle number to generate start address of the tile that this workgroup allocated too


  //Global read addresses: address A resource descriptor set-up
  //sgpr[0-1] - base address
  //sgpr[2]   - limit
  //sgpr[3]   - attributes

  //calculate base address for  A
  //1. multiply MT0 size with TileNumber passed in s[sgprWorkGroup0]
  //2. multiply [1] result with stride[0] store result into 64-bit
  //3. the above two steps gives starting address of tile that this workgroup working


  s_mov_b32        s[sgprSrdA+0], s[sgprAddressA+0]            // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdA+1], s[sgprAddressA+1]            // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdA+2], BufferLimit
  s_mov_b32        s[sgprSrdA+3], Srd127_96                    // set bits 127_96 in SRD

  s_mul_i32        s84,       s[sgprStridesA+0], 32            // workGroup[0]*MT
  s_mul_i32        s84,       s[sgprWorkGroup0], s84           // workGroup[0]*MT
  s_lshl_b32       s85,       s[sgprSimdTileX], 4              // s85 = simdIdY * x16 rows per wave
  s_mul_i32        s83,       s85, s[sgprStridesA+0]           // wave start offset
  s_add_i32        s84,       s84, s83
  s_lshl_b32       s85,       s[sgprSimdTileY], 6
  s_add_i32        s84,       s84, s85

  //tile offset assignment a : global read address
  //LVCA= 16
  //glvw = 1
  v_lshrrev_b32    v0,    3, v[vgprSerial+1]               // v[vgprSerial+1] / 8
  v_mul_lo_u32     v4,    s[sgprStridesA+0],  v0           // mul d1 lower
  v_and_b32        v1,    7, v[vgprSerial+1]
  v_lshlrev_b32    v1,    3,  v1                           // GLVW=1 (load_Dword) for GLVW=2(dwordx2) =2 GLVW=4 = 3 (dowrdx4) for BF16
  v_add_co_u32     v[vgprGlobalReadOfvarA+0], vcc, v4, v1  //accumulate d1 lower
  v_add_u32        v[vgprGlobalReadOfvarA+0], s84, v[vgprGlobalReadOfvarA+0]
  v_lshlrev_b32    v[vgprGlobalReadOfvarA+0], 0x1, v[vgprGlobalReadOfvarA+0]  // offset *= bytes/element (x2)  // convert into bytes offset

  // why subtract lds_Asize_per_wr - A_lds_size_wr is used as inst_offset in buffer_load_dword lds:1
  s_lshl_b32       s[sgprScalarGlobalReadOffsetA+0],  s[sgprStridesA+0],    4   // X16 = X8(8 lines) X2(conver to bytes).  each buffer load process 4 lines.
  for var i = 1; i < 2; i++
    v_add_u32         v_regs(vgprGlobalReadOfvarA,i), s[sgprScalarGlobalReadOffsetA+0],  v_regs(vgprGlobalReadOfvarA,i-1)
  end

  /* local write addresses: first offset a */
  v_lshrrev_b32    v0,    3,  v[vgprSerial+1]              // v[vgprSerial+1] / 8
  v_mul_lo_u32     v4,    64, v0                           // mul d1 lower
  v_and_b32        v1,    7, v[vgprSerial+1]
  v_lshlrev_b32    v1,    3,  v1                           // GLVW=1 (load_Dword) for GLVW=2(dwordx2) =2 GLVW=4 = 3 (dowrdx4) for BF16
  v_add_u32        v[vgprLocalWriteAddrA],  v4,  v1
  v_lshlrev_b32    v[vgprLocalWriteAddrA+0], 1, v[vgprLocalWriteAddrA+0]

  v_lshrrev_b32    v2,    1,  v0                           // padding per 256 bytes, padding per 2 lines
  v_mul_lo_u32     v2, varlds_pad, v2
  v_add_u32        v[vgprLocalWriteAddrA+0], v2, v[vgprLocalWriteAddrA+0]

  s_mov_b32        s[sgprLocalWriteAddrA+0], varlds_Asize_per_wave
  s_mul_i32        s[sgprLocalWriteAddrA+0], s[sgprFetchSubGrpId],     s[sgprLocalWriteAddrA+0] //lds start address of each wave in bytes
  v_add_u32        v[vgprLocalWriteAddrA+0], s[sgprLocalWriteAddrA+0], v[vgprLocalWriteAddrA+0]
  v_add_u32        v[vgprLocalWriteAddrA+1], varlds_Asize_per_wg,      v[vgprLocalWriteAddrA+0]

  /******************************************/
  /* global read addresses: addresses b     */
  /******************************************/
  s_mov_b32        s[sgprSrdB+0], s[sgprAddressB+0]             // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdB+1], s[sgprAddressB+1]             // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdB+2], BufferLimit
  s_mov_b32        s[sgprSrdB+3], Srd127_96                     // set bits 127_96 in SRD

  s_mul_i32        s84,       s[sgprStridesB+0], 64             //workGroup[0]*MT
  s_mul_i32        s84,       s[sgprWorkGroup1], s84            //workGroup[0]*MT
  s_lshl_b32       s85,       s[sgprSimdTileX], 5               // s85 = simdIdY * x32 rows per wave
  s_mul_i32        s83,       s85, s[sgprStridesA+0]            //wave start offset
  s_add_i32        s84,       s84, s83
  s_lshl_b32       s85,       s[sgprSimdTileY], 6
  s_add_i32        s84,       s84, s85

  // tile offset assignment b : global read address
  /* LVCA= 16 */
  // glvw = 1
  v_lshrrev_b32    v0,     3,  v[vgprSerial+1]             // v[vgprSerial+1] / 8
  v_mul_lo_u32     v4,     s[sgprStridesB+0], v0           // mul d1 lower
  v_and_b32        v1,     7, v[vgprSerial+1]
  v_lshlrev_b32    v1,     3,  v1
  v_add_co_u32     v[vgprGlobalReadOfvarB+0], vcc, v4,  v1                    // accumulate d1 lower
  v_add_u32        v[vgprGlobalReadOfvarB+0], s84, v[vgprGlobalReadOfvarB+0]  // accumulate d1 lower
  v_lshlrev_b32    v[vgprGlobalReadOfvarB+0], 0x1, v[vgprGlobalReadOfvarB+0]  // offset *= bytes/element

  s_lshl_b32       s[sgprScalarGlobalReadOffsetB+0], s[sgprStridesB+0],    4  // X16 = X8(8 lines) X2(conver to bytes).  each buffer load process 4 lines.
  // X16 = X4(4 lines) X2(conver to bytes).  each buffer load process 4 lines.
  for var i = 1; i < 4; i++
    v_add_u32      v_regs(vgprGlobalReadOfvarB,i), s[sgprScalarGlobalReadOffsetB+0],  v_regs(vgprGlobalReadOfvarB,i-1)
  end

  /******************************************/
  /* local write addresses: first offset b  */
  /******************************************/
  v_lshrrev_b32    v0,    3,  v[vgprSerial+1]              // v[vgprSerial+1] / 8
  v_mul_lo_u32     v4,    64, v0                           // mul d1 lower
  v_and_b32        v1,    7, v[vgprSerial+1]
  v_lshlrev_b32    v1,    3,  v1                           // GLVW=1 (load_Dword) for GLVW=2(dwordx2) =2 GLVW=4 = 3 (dowrdx4) for BF16
  v_add_u32        v[vgprLocalWriteAddrB],  v4,  v1
  v_lshlrev_b32    v[vgprLocalWriteAddrB+0], 1, v[vgprLocalWriteAddrB+0]

  // pad
  v_lshrrev_b32    v2,    1,  v0                           // padding per 256 bytes, padding per 2 lines
  v_mul_lo_u32     v2, varlds_pad, v2
  v_add_u32        v[vgprLocalWriteAddrB+0], v2, v[vgprLocalWriteAddrB+0]

  // wave offset
  s_mov_b32        s[sgprLocalWriteAddrB+0], varlds_Bsize_per_wave
  s_mul_i32        s[sgprLocalWriteAddrB+0], s[sgprFetchSubGrpId],     s[sgprLocalWriteAddrB+0] //lds start address of each wave in bytes
  s_add_i32        s[sgprLocalWriteAddrB+0], s[sgprLocalWriteAddrB+0], varB_lds_base_addr

  // buffer offset
  v_add_u32        v[vgprLocalWriteAddrB+0], s[sgprLocalWriteAddrB+0], v[vgprLocalWriteAddrB+0]
  v_add_u32        v[vgprLocalWriteAddrB+1], varlds_Bsize_per_wg,      v[vgprLocalWriteAddrB+0]


  //////////////preload to LDS///////////
  //Fetch latency is about ~1000 of cycles
  //v_mfma_f32_32x32x4bf16 => latency is 64 cycles
  // we need deep software pipelining to hide read latency = MAC latency
  // unroll Depth = 32
  // global prefetch next 2 unroll loop iteration
  // wait for first 32 iteration data to arrive
  // prefetch from  LDS A, B
  // unroll loop start
  // 16 * 64 miMAC cycles
  // LDS prefetch next 8 micro-iteration

  // prefetch: Global to Local D2LDS
  // fetch 64x32 elements => each load fetch  4x32 elements / Wave
  // TODO : Convert x4 fetch

  s_barrier

  //Fetch A 16x32 elements/wave
  buffer_load_dwordx4 v[vgprG2LA+0* 8+ 0:vgprG2LA+0* 8+ 3],  v[vgprGlobalReadOfvarA+ 0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+0* 8+ 4:vgprG2LA+0* 8+ 7],  v[vgprGlobalReadOfvarA+ 1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0


  // prefetch: Global to Local D2LDS
  // fetch 64x32 elements => each load fetch  4x32 elements / Wave
  // TODO : Convert x4 fetch
  buffer_load_dwordx4 v[vgprG2LB+0*16+ 0:vgprG2LB+0*16+ 3],  v[vgprGlobalReadOfvarB+ 0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1  offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+ 4:vgprG2LB+0*16+ 7],  v[vgprGlobalReadOfvarB+ 1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1  offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+ 8:vgprG2LB+0*16+11],  v[vgprGlobalReadOfvarB+ 2],  s[sgprSrdB:sgprSrdB+3], 0 offen:1  offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+12:vgprG2LB+0*16+15],  v[vgprGlobalReadOfvarB+ 3],  s[sgprSrdB:sgprSrdB+3], 0 offen:1  offset:0


  //increment 32 elements to fetch next k=32 elements of tile 64x32
  v_add_u32         v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32         v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32         v[vgprGlobalReadOfvarB+ 0], 256, v[vgprGlobalReadOfvarB+ 0]
  v_add_u32         v[vgprGlobalReadOfvarB+ 1], 256, v[vgprGlobalReadOfvarB+ 1]
  v_add_u32         v[vgprGlobalReadOfvarB+ 2], 256, v[vgprGlobalReadOfvarB+ 2]
  v_add_u32         v[vgprGlobalReadOfvarB+ 3], 256, v[vgprGlobalReadOfvarB+ 3]

  //Fetch 2nd unroll loop iteration (2nd 32 k indices)
  buffer_load_dwordx4 v[vgprG2LA+1*8+ 0:vgprG2LA+1*8+ 3],  v[vgprGlobalReadOfvarA+ 0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+1*8+ 4:vgprG2LA+1*8+ 7],  v[vgprGlobalReadOfvarA+ 1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  buffer_load_dwordx4 v[vgprG2LB+1*16+ 0:vgprG2LB+1*16+ 3],  v[vgprGlobalReadOfvarB+ 0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+ 4:vgprG2LB+1*16+ 7],  v[vgprGlobalReadOfvarB+ 1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+ 8:vgprG2LB+1*16+11],  v[vgprGlobalReadOfvarB+ 2],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+12:vgprG2LB+1*16+15],  v[vgprGlobalReadOfvarB+ 3],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0


  //increment 32 elements to fetch next k=32 elements of tile 64x32
  v_add_u32        v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32        v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32        v[vgprGlobalReadOfvarB+ 0], 256, v[vgprGlobalReadOfvarB+ 0]
  v_add_u32        v[vgprGlobalReadOfvarB+ 1], 256, v[vgprGlobalReadOfvarB+ 1]
  v_add_u32        v[vgprGlobalReadOfvarB+ 2], 256, v[vgprGlobalReadOfvarB+ 2]
  v_add_u32        v[vgprGlobalReadOfvarB+ 3], 256, v[vgprGlobalReadOfvarB+ 3]

  s_waitcnt vmcnt(10)
  ds_write_b128      v[vgprLocalWriteAddrA+0],  v[vgprG2LA+0* 8+ 0:vgprG2LA+0* 8+ 3] offset:varlds_Asize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrA+0],  v[vgprG2LA+0* 8+ 4:vgprG2LA+0* 8+ 7] offset:varlds_Asize_per_wr * 4
  s_waitcnt lgkmcnt(0)
  s_barrier

  s_waitcnt vmcnt(6)
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+ 0:vgprG2LB+0*16+ 3] offset:varlds_Bsize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+ 4:vgprG2LB+0*16+ 7] offset:varlds_Bsize_per_wr * 4
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+ 8:vgprG2LB+0*16+11] offset:varlds_Bsize_per_wr * 8
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+12:vgprG2LB+0*16+15] offset:varlds_Bsize_per_wr *12
  s_waitcnt lgkmcnt(0)
  s_barrier

  s_lshr_b32       s[sgprLoopCounters+0], s[sgprSizesSum+0], 7 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 128
  s_sub_u32        s[sgprLoopCounters+0], 0x0, s[sgprLoopCounters+0]
  s_cmp_eq_u32     s[sgprLoopCounters+0], 0x0            // numIter0I == 0
  s_cbranch_scc1   label_0006                           // Dont enter Loop

/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/
label_0005:

  s_barrier

  //Fetch A for Unroll iteration# (u+2) for 32 k indices
  buffer_load_dwordx4 v[vgprG2LA+0* 8+ 0:vgprG2LA+0* 8+ 3],  v[vgprGlobalReadOfvarA+ 0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+0* 8+ 4:vgprG2LA+0* 8+ 7],  v[vgprGlobalReadOfvarA+ 1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  //Fetch B for Unroll iteration# (u+2) for 32 k indices
  buffer_load_dwordx4 v[vgprG2LB+0*16+ 0:vgprG2LB+0*16+ 3],  v[vgprGlobalReadOfvarB+ 0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+ 4:vgprG2LB+0*16+ 7],  v[vgprGlobalReadOfvarB+ 1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+ 8:vgprG2LB+0*16+11],  v[vgprGlobalReadOfvarB+ 2],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+12:vgprG2LB+0*16+15],  v[vgprGlobalReadOfvarB+ 3],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0


  s_waitcnt vmcnt(10)
  ds_write_b128      v[vgprLocalWriteAddrA+1],  v[vgprG2LA+1*8+ 0:vgprG2LA+1*8+ 3] offset:varlds_Asize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrA+1],  v[vgprG2LA+1*8+ 4:vgprG2LA+1*8+ 7] offset:varlds_Asize_per_wr * 4
  s_waitcnt lgkmcnt(0)

  s_setprio 1
  s_barrier
  //increment 32 elements to fetch next k=32 elements of tile 64x32
  v_add_u32     v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32     v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32     v[vgprGlobalReadOfvarB+ 0], 256, v[vgprGlobalReadOfvarB+ 0]
  v_add_u32     v[vgprGlobalReadOfvarB+ 1], 256, v[vgprGlobalReadOfvarB+ 1]
  v_add_u32     v[vgprGlobalReadOfvarB+ 2], 256, v[vgprGlobalReadOfvarB+ 2]
  v_add_u32     v[vgprGlobalReadOfvarB+ 3], 256, v[vgprGlobalReadOfvarB+ 3]
  s_setprio 0

  s_waitcnt vmcnt(6)
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+ 0:vgprG2LB+1*16+ 3] offset:varlds_Bsize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+ 4:vgprG2LB+1*16+ 7] offset:varlds_Bsize_per_wr * 4
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+ 8:vgprG2LB+1*16+11] offset:varlds_Bsize_per_wr * 8
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+12:vgprG2LB+1*16+15] offset:varlds_Bsize_per_wr *12
  s_waitcnt lgkmcnt(0)

  s_setprio 1
  s_barrier
  s_setprio 0

  s_add_u32     s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1        //inc CounterL

  //*************************
  // Unroll Looop 1
  //**************************
  s_barrier

  //Fetch A for Unroll iteration# (u+3) for 32 k indices
  buffer_load_dwordx4 v[vgprG2LA+1*8+ 0:vgprG2LA+1*8+ 3],  v[vgprGlobalReadOfvarA+ 0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+1*8+ 4:vgprG2LA+1*8+ 7],  v[vgprGlobalReadOfvarA+ 1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  //Fetch B for Unroll iteration# (u+2) for 32 k indices
  buffer_load_dwordx4 v[vgprG2LB+1*16+ 0:vgprG2LB+1*16+ 3],  v[vgprGlobalReadOfvarB+ 0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+ 4:vgprG2LB+1*16+ 7],  v[vgprGlobalReadOfvarB+ 1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+ 8:vgprG2LB+1*16+11],  v[vgprGlobalReadOfvarB+ 2],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+12:vgprG2LB+1*16+15],  v[vgprGlobalReadOfvarB+ 3],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0

  s_waitcnt vmcnt(10)
  ds_write_b128      v[vgprLocalWriteAddrA+0],  v[vgprG2LA+0*8+ 0:vgprG2LA+0*8+ 3] offset:varlds_Asize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrA+0],  v[vgprG2LA+0*8+ 4:vgprG2LA+0*8+ 7] offset:varlds_Asize_per_wr * 4
  s_waitcnt lgkmcnt(0)

  s_setprio 1    //raise the wave priority for simd co-execution
  s_barrier
  //increment 32 elements to fetch next k=32 elements of tile 64x32
  v_add_u32     v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32     v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32     v[vgprGlobalReadOfvarB+ 0], 256, v[vgprGlobalReadOfvarB+ 0]
  v_add_u32     v[vgprGlobalReadOfvarB+ 1], 256, v[vgprGlobalReadOfvarB+ 1]
  v_add_u32     v[vgprGlobalReadOfvarB+ 2], 256, v[vgprGlobalReadOfvarB+ 2]
  v_add_u32     v[vgprGlobalReadOfvarB+ 3], 256, v[vgprGlobalReadOfvarB+ 3]
  s_setprio 0

  s_waitcnt vmcnt(6)
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+ 0:vgprG2LB+0*16+ 3] offset:varlds_Bsize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+ 4:vgprG2LB+0*16+ 7] offset:varlds_Bsize_per_wr * 4
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+ 8:vgprG2LB+0*16+11] offset:varlds_Bsize_per_wr * 8
  ds_write_b128      v[vgprLocalWriteAddrB+0],  v[vgprG2LB+0*16+12:vgprG2LB+0*16+15] offset:varlds_Bsize_per_wr *12
  s_waitcnt lgkmcnt(0)

  s_setprio 1
  s_barrier
  s_setprio 0

  s_add_u32     s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1        //inc CounterL

  s_cmp_eq_i32  s[sgprLoopCounters+0], -0x2                    // CounterL=0x2
  s_cbranch_scc0  label_0005

label_0006:
  s_waitcnt vmcnt(4)
  ds_write_b128      v[vgprLocalWriteAddrA+1],  v[vgprG2LA+1*8+ 0:vgprG2LA+1*8+ 3] offset:varlds_Asize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrA+1],  v[vgprG2LA+1*8+ 4:vgprG2LA+1*8+ 7] offset:varlds_Asize_per_wr * 4
  s_waitcnt lgkmcnt(0)
  s_barrier

  s_waitcnt vmcnt(0)
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+ 0:vgprG2LB+1*16+ 3] offset:varlds_Bsize_per_wr * 0
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+ 4:vgprG2LB+1*16+ 7] offset:varlds_Bsize_per_wr * 4
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+ 8:vgprG2LB+1*16+11] offset:varlds_Bsize_per_wr * 8
  ds_write_b128      v[vgprLocalWriteAddrB+1],  v[vgprG2LB+1*16+12:vgprG2LB+1*16+15] offset:varlds_Bsize_per_wr *12
  s_waitcnt lgkmcnt(0)
  s_barrier

s_endpgm


//**********************************************************************************//
// Entry to compute wave:                                                           //
// In 2 wave solution global fetch and compute are handled  by separate waves in WG //
// load wave and compute wave are synchronized using s_barrier                      //
// TODO: need better synchronization mechanism than s_barrier                       //
//**********************************************************************************//


// each compute wave produces 64x32 output space
// each MFMA_32x32x4x1 instruction (split-k ) produces 32x32 output space
// to solve 64x32 output, we need 2 MFMA_32x32x4x1 instruction, each solving 32 rows
// for DepthU=32, we need 8 MFMA instrucitons per 32x32 and 16 for 64x32
// its self-evident in unroll loop, first MFMA solves 32x32 for k=4 , second mfma solves 32x32 for k=4
// we repeat this 8 times for unrollDept=32


// matrix A elements are stored  contiguously in K dimension (row address ordering ) and next row starts
// using lda value (stride A). matrix B elements are stored contiguously in N dimension and next rwo (K) starts
// using ldb value (stride B).

// local fetches for A cherry picks k elements for 64 rows by adding 8 to offsset for each instruction
// offset address has 8*varlds_Asize_per_wr factor , reason for factor is each SIMD fetched 32x4 (KxM) elements
// in each buffer load and stored in LDS, to access second 32 rows (fetched by SIMD2&simd3), we need to mulitply 8
// (each SIMD  did 4 buffer_load) times 256 bytes (each load fetch 256 bytes)

// local fetch for B are straight forward as K elements for each columns stored contiguously and ds_Read instruction offset
// incremented by 8 bytes.

wave0_entry_start:

  //  accvgpr init
  //  4*32=128CYCLES
  // hide all mem loatency with ACC VGPR initialization
  for var i =0; i < 32; i++
      v_accvgpr_write v_regs(0,i), 0, 0
  end

  //s_load_dword s[sgprAddressD], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x18 //
  //s_load_dword s[sgprAddressD+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x1c //
  //s_load_dword s[sgprAddressC], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x20 //
  //s_load_dword s[sgprAddressC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x24 //
  //s_load_dword s[sgprTensor2dSizeC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x4 //
  s_load_dwordx2 s[sgprTensor2dSizeC+0:sgprTensor2dSizeC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0 //
  s_load_dwordx4 s[sgprAlpha:sgprSizesFree+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x38 //
  s_load_dwordx4 s[sgprStridesD+0:sgprStridesC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40 //
  s_load_dwordx4 s[sgprAddressD:sgprAddressC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x18 //
  //s_load_dwordx4 s[sgprAlpha:sgprSizesFree+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x38 //
  //s_load_dwordx2 s[sgprTensor2dSizeC+0:sgprTensor2dSizeC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0 //
  //s_load_dword s[sgprSizesFree+2], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x68 //
  //s_load_dword s[sgprOrigStaggerUIter], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x70 //
  //s_load_dword s[sgprNumWorkGroups0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x74 //
  //s_load_dword s[sgprNumWorkGroups1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x78 //
  //s_load_dword s[sgprNumFullBlocks], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x84 //
  //s_load_dword s[sgprWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x88 //
  //s_load_dword s[sgprMagicNumberWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8c //
  //s_load_dword s[sgprStridesD+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40 //
  //s_load_dword s[sgprStridesD+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x44 //
  //s_load_dword s[sgprStridesC+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x48 //
  //s_load_dword s[sgprStridesC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x4c //
  //s_load_dword s[sgprSizesFree+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x60 //
  //s_load_dword s[sgprSizesFree+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 //

  /******************************************/
  /* Local Read Addresses                   */
  /******************************************/

  // 32 lanes for holding M elements
  v_and_b32        v1, v[vgprSerial+1], 0x1f
  v_mul_lo_u32     v[vgprLocalReadAddrA+0], 64, v1
  v_lshrrev_b32    v2, 1, v1                         // padding per 256 bytes, padding per 2 lines
  v_mul_lo_u32     v2, varlds_pad, v2

  // local read addresses: final offsets a
  v_lshrrev_b32    v1, 5, v[vgprSerial+1]
  v_lshlrev_b32    v1, 1, v1
  v_add_u32        v[vgprLocalReadAddrA+0], v1, v[vgprLocalReadAddrA+0]
  v_lshlrev_b32    v[vgprLocalReadAddrA+0],  1, v[vgprLocalReadAddrA+0]  //convert to bytes

  // wave offset
  s_mul_i32        s85, s[sgprSimdTileX], 64
  v_add_u32        v[vgprLocalReadAddrA+0], s85, v[vgprLocalReadAddrA+0]
  s_mul_i32        s85, s[sgprSimdTileY], varlds_Asize_per_wave * 2
  v_add_u32        v[vgprLocalReadAddrA+0], s85, v[vgprLocalReadAddrA+0]

  // add padding back
  v_add_u32        v[vgprLocalReadAddrA+0], v2, v[vgprLocalReadAddrA+0]

  // second buffer
  v_add_u32        v[vgprLocalReadAddrA+0], varA_lds_base_addr,  v[vgprLocalReadAddrA+0]
  v_add_u32        v[vgprLocalReadAddrA+1], varlds_Asize_per_wg, v[vgprLocalReadAddrA+0]

  s_barrier

  /******************************************/
  /* Local Read Addresses Offset B          */
  /******************************************/

  //32 lanes for holding N elements
  v_and_b32        v1, v[vgprSerial+1], 0x1f
  v_mul_lo_u32     v[vgprLocalReadAddrB+0], 64, v1
  v_lshrrev_b32    v2, 1, v1
  v_mul_lo_u32     v2, varlds_pad, v2             // padding per 256 bytes, padding per 4 lines

  // local read addresses: final offsets b
  v_lshrrev_b32    v1, 5, v[vgprSerial+1]
  v_lshlrev_b32    v1, 1, v1
  v_add_u32        v[vgprLocalReadAddrB+0], v1, v[vgprLocalReadAddrB+0]
  v_lshlrev_b32    v[vgprLocalReadAddrB+0],  1, v[vgprLocalReadAddrB+0]  //convert to bytes

  // wave offset
  s_mul_i32        s85, s[sgprSimdTileX], 64
  v_add_u32        v[vgprLocalReadAddrB+0], s85, v[vgprLocalReadAddrB+0]
  s_mul_i32        s85, s[sgprSimdTileY], varlds_Bsize_per_wave * 2
  v_add_u32        v[vgprLocalReadAddrB+0], s85, v[vgprLocalReadAddrB+0]

  // add padding back
  v_add_u32        v[vgprLocalReadAddrB+0], v2, v[vgprLocalReadAddrB+0]

  // second buffer
  v_add_u32        v[vgprLocalReadAddrB+0], varB_lds_base_addr,  v[vgprLocalReadAddrB+0]
  v_add_u32        v[vgprLocalReadAddrB+1], varlds_Bsize_per_wg, v[vgprLocalReadAddrB+0]

  s_waitcnt lgkmcnt(0)


  /*****************************************************************/
  /* Global Address C calculation */
  /*****************************************************************/

  s_mov_b32       s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
  s_mov_b32       s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (lower)
  s_mov_b32       s[sgprSrdC+2], 0x80000000             // limit at 2*31
  s_mov_b32       s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in SRD

  s_mov_b32       s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
  s_mov_b32       s[sgprSrdD+1], s[sgprAddressD+1]        // set const_stride=4 for idxen
  s_mov_b32       s[sgprSrdD+2], 0x80000000             // limit at 2*31
  s_mov_b32       s[sgprSrdD+3], Srd127_96            // Set bits 127_96 in SRD

  s_mul_i32       s86, 0x40, s[sgprWorkGroup1]            // <- wg1*MT1
  s_mul_hi_u32    s85, s86,  s[sgprStridesC+0]
  s_mul_i32       s84, s86,  s[sgprStridesC+0]            // scale by stride
  s_lshl_b64      s[84:85],  s[84:85], 1            // scale by bpe
  s_add_u32       s[sgprSrdC+0], s[sgprSrdC+0], s84
  s_addc_u32      s[sgprSrdC+1], s[sgprSrdC+1], s85
  s_add_u32       s[sgprSrdD+0], s[sgprSrdD+0], s84
  s_addc_u32      s[sgprSrdD+1], s[sgprSrdD+1], s85

  s_mul_hi_u32    s85, s[sgprWorkGroup2], s[sgprStridesC+1]     //Scale s[sgprWorkGroup2] by stride
  s_mul_i32       s84, s[sgprWorkGroup2], s[sgprStridesC+1]     //Scale s[sgprWorkGroup2] by stride
  s_lshl_b64      s[84:85],  s[84:85], 1                // scale by bpe
  s_add_u32       s[sgprSrdC+0], s[sgprSrdC+0], s84
  s_addc_u32      s[sgprSrdC+1], s[sgprSrdC+1], s85
  s_add_u32       s[sgprSrdD+0], s[sgprSrdD+0], s84
  s_addc_u32      s[sgprSrdD+1], s[sgprSrdD+1], s85

  //use threadIdz to re-map threadIdx using for calculating waveId start off set for MAC wves to store 'C'
  v_lshlrev_b32   v[vgprSerial], 6, v[vgprSerial+2]          // threadIdx = simdId<<6
  v_add_u32       v[vgprSerial], v[vgprSerial+1], v[vgprSerial] // threadIdx = threadIdx + 0-63

  v_and_b32       v4, 0x3f, v[vgprSerial]                       // vectorStaticDiv vgprTmp = vgprSerial % 64
  v_lshrrev_b32   v4, 2,    v4                                  // vectorStaticDiv vgprTmp = vgprSerial / 4
  v_mul_lo_u32    v5, v4,   s[sgprStridesC+0]            // rowstart VGPR
  v_and_b32       v4, 3,    v[vgprSerial]                       // vectorStaticDiv vgprTmp = vgprSerial % 4
  v_lshlrev_b32   v6, 3,    v4                       // glvw=8
  v_add_u32       v[vgprTmp], v5, v6

  s_mul_i32       s84, s[sgprStridesC+0], 16
  s_mul_i32       s84, s[sgprFetchSubGrpId], s84
  v_add_u32       v[vgprTmp], s84, v[vgprTmp]

  s_mul_i32       s84, 0x20, s[sgprWorkGroup0]            // s84 = wgp0*MT0
  v_add_lshl_u32  v[vgprGlobalWriteOfvarC], v[vgprTmp], s84, 0x1    // c base_addr = wave_start+row_start scaled by BPE

  //sync point to load waves
  s_barrier

  // Read A Elements from LDS into VREGS...
  // one time burst read of A elements due to latency delay bbetween A and  B for first fetch
  // if elements are in L2 hit , you still have some latency between A and B for first fetch
  //  hide the latency by issuing bursts of A (fiqure out how many from profiler / thread trace)
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+0],  v[vgprLocalReadAddrA+0]  offset:0
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+1],  v[vgprLocalReadAddrA+0]  offset:8
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+2],  v[vgprLocalReadAddrA+0]  offset:16
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+3],  v[vgprLocalReadAddrA+0]  offset:24
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+4],  v[vgprLocalReadAddrA+0]  offset:32
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+5],  v[vgprLocalReadAddrA+0]  offset:40
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+6],  v[vgprLocalReadAddrA+0]  offset:48
  ds_read_b32       v[vgprValuA_X0_I0+ 8*0+0*0+7],  v[vgprLocalReadAddrA+0]  offset:56

  s_barrier

  // Read B elements from LDS into VREGS
  // different strategy;; read as minimum as possible.  we need to get into unroll loop as soon as possible
  // Issue read for 8x32  B elements
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*0+0],  v[vgprLocalReadAddrB+0]  offset: 0
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*1+0],  v[vgprLocalReadAddrB+0]  offset: 0 + varlds_Bsize_per_wr * 16
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*0+1],  v[vgprLocalReadAddrB+0]  offset: 8
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*1+1],  v[vgprLocalReadAddrB+0]  offset: 8 + varlds_Bsize_per_wr * 16
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*0+2],  v[vgprLocalReadAddrB+0]  offset:16
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*1+2],  v[vgprLocalReadAddrB+0]  offset:16 + varlds_Bsize_per_wr * 16
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*0+3],  v[vgprLocalReadAddrB+0]  offset:24
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*1+3],  v[vgprLocalReadAddrB+0]  offset:24 + varlds_Bsize_per_wr * 16
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*0+4],  v[vgprLocalReadAddrB+0]  offset:32
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*1+4],  v[vgprLocalReadAddrB+0]  offset:32 + varlds_Bsize_per_wr * 16
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*0+5],  v[vgprLocalReadAddrB+0]  offset:40
  ds_read_b32       v[vgprValuB_X0_I0+16*0+8*1+5],  v[vgprLocalReadAddrB+0]  offset:40 + varlds_Bsize_per_wr * 16


  s_lshr_b32       s[sgprLoopCounters+0], s[sgprSizesSum+0], 7 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 128
  s_sub_u32        s[sgprLoopCounters+0], 0x0, s[sgprLoopCounters+0]
  s_cmp_eq_u32     s[sgprLoopCounters+0], 0x0            // numIter0I == 0
  s_cbranch_scc1   label_0004                           // Dont enter Loop

/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/
label_0001:

  //A matrix tile 64 rows
  //B matrix tile 128 columns
  //B matrix tile 128 columns split across 4 SIMD
  //A matrix tile split into 2 tiles
  // unroll loop  k/32 times * 2
  // each mfma caculates k=4 unroll iterations
  // 8 mfma for k=32  for each 32x32 ThreadTile.. (2 for 64 A rows)

  //unrolling double
  for var p =0; p < 2; p++
    var k = 1-p

    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*p+8*0+6),  v_regs(vgprLocalReadAddrB,p)  offset:48
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*p+8*1+6),  v_regs(vgprLocalReadAddrB,p)  offset:48 + varlds_Bsize_per_wr * 16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*p+8*0+7),  v_regs(vgprLocalReadAddrB,p)  offset:56
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*p+8*1+7),  v_regs(vgprLocalReadAddrB,p)  offset:56 + varlds_Bsize_per_wr * 16
    s_waitcnt lgkmcnt(0)

    s_barrier

    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+0],  v[vgprValuB_X0_I0+16*p+8*0+0],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+0],  v[vgprValuB_X0_I0+16*p+8*1+0],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+1],  v[vgprValuB_X0_I0+16*p+8*0+1],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+1],  v[vgprValuB_X0_I0+16*p+8*1+1],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+2],  v[vgprValuB_X0_I0+16*p+8*0+2],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+2],  v[vgprValuB_X0_I0+16*p+8*1+2],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+3],  v[vgprValuB_X0_I0+16*p+8*0+3],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+3],  v[vgprValuB_X0_I0+16*p+8*1+3],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+4],  v[vgprValuB_X0_I0+16*p+8*0+4],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+4],  v[vgprValuB_X0_I0+16*p+8*1+4],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+5],  v[vgprValuB_X0_I0+16*p+8*0+5],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+5],  v[vgprValuB_X0_I0+16*p+8*1+5],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+6],  v[vgprValuB_X0_I0+16*p+8*0+6],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+6],  v[vgprValuB_X0_I0+16*p+8*1+6],  v[vgprAcc+16]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*p+0*0+7],  v[vgprValuB_X0_I0+16*p+8*0+7],  v[vgprAcc+ 0]
    v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*p+0*0+7],  v[vgprValuB_X0_I0+16*p+8*1+7],  v[vgprAcc+16]

    s_setprio 0 //lower wave priority other wave to execute valu instructions

    s_barrier
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+0),  v_regs(vgprLocalReadAddrA,k)  offset:0
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+1),  v_regs(vgprLocalReadAddrA,k)  offset:8
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+2),  v_regs(vgprLocalReadAddrA,k)  offset:16
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+3),  v_regs(vgprLocalReadAddrA,k)  offset:24
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+4),  v_regs(vgprLocalReadAddrA,k)  offset:32
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+5),  v_regs(vgprLocalReadAddrA,k)  offset:40
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+6),  v_regs(vgprLocalReadAddrA,k)  offset:48
    ds_read_b32       v_regs(vgprValuA_X0_I0,  8*k+0*0+7),  v_regs(vgprLocalReadAddrA,k)  offset:56

    s_barrier
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*0+0),  v_regs(vgprLocalReadAddrB,k)  offset: 0
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*1+0),  v_regs(vgprLocalReadAddrB,k)  offset: 0 + varlds_Bsize_per_wr * 16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*0+1),  v_regs(vgprLocalReadAddrB,k)  offset: 8
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*1+1),  v_regs(vgprLocalReadAddrB,k)  offset: 8 + varlds_Bsize_per_wr * 16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*0+2),  v_regs(vgprLocalReadAddrB,k)  offset:16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*1+2),  v_regs(vgprLocalReadAddrB,k)  offset:16 + varlds_Bsize_per_wr * 16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*0+3),  v_regs(vgprLocalReadAddrB,k)  offset:24
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*1+3),  v_regs(vgprLocalReadAddrB,k)  offset:24 + varlds_Bsize_per_wr * 16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*0+4),  v_regs(vgprLocalReadAddrB,k)  offset:32
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*1+4),  v_regs(vgprLocalReadAddrB,k)  offset:32 + varlds_Bsize_per_wr * 16
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*0+5),  v_regs(vgprLocalReadAddrB,k)  offset:40
    ds_read_b32       v_regs(vgprValuB_X0_I0, 16*k+8*1+5),  v_regs(vgprLocalReadAddrB,k)  offset:40 + varlds_Bsize_per_wr * 16

    s_setprio 1
    s_add_u32     s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1        //inc CounterL

  end
  s_cmp_eq_i32  s[sgprLoopCounters+0], -0x2                    // CounterL=0x2
  s_cbranch_scc0  label_0001

label_0002:

  /*****************************************************************/
  /*  NoLoadLoop - Begin                                           */
  /*****************************************************************/
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*0+8*0+6),  v_regs(vgprLocalReadAddrB,0)  offset:48
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*0+8*1+6),  v_regs(vgprLocalReadAddrB,0)  offset:48 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*0+8*0+7),  v_regs(vgprLocalReadAddrB,0)  offset:56
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*0+8*1+7),  v_regs(vgprLocalReadAddrB,0)  offset:56 + varlds_Bsize_per_wr * 16
  s_waitcnt lgkmcnt(0)

  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+0],  v[vgprValuB_X0_I0+16*0+8*0+0],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+0],  v[vgprValuB_X0_I0+16*0+8*1+0],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+1],  v[vgprValuB_X0_I0+16*0+8*0+1],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+1],  v[vgprValuB_X0_I0+16*0+8*1+1],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+2],  v[vgprValuB_X0_I0+16*0+8*0+2],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+2],  v[vgprValuB_X0_I0+16*0+8*1+2],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+3],  v[vgprValuB_X0_I0+16*0+8*0+3],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+3],  v[vgprValuB_X0_I0+16*0+8*1+3],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+4],  v[vgprValuB_X0_I0+16*0+8*0+4],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+4],  v[vgprValuB_X0_I0+16*0+8*1+4],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+5],  v[vgprValuB_X0_I0+16*0+8*0+5],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+5],  v[vgprValuB_X0_I0+16*0+8*1+5],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+6],  v[vgprValuB_X0_I0+16*0+8*0+6],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+6],  v[vgprValuB_X0_I0+16*0+8*1+6],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+ 8*0+0*0+7],  v[vgprValuB_X0_I0+16*0+8*0+7],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+ 8*0+0*0+7],  v[vgprValuB_X0_I0+16*0+8*1+7],  v[vgprAcc+16]

  //****************************************
  // End of  32x32 (block 0 of 64x32)
  //****************************************

  //****************************************
  // Begin of  32x32 (block 1 of 64x32)
  //****************************************

  s_barrier

  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+0),  v_regs(vgprLocalReadAddrA,1)  offset: 0
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+1),  v_regs(vgprLocalReadAddrA,1)  offset: 8
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+2),  v_regs(vgprLocalReadAddrA,1)  offset:16
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+3),  v_regs(vgprLocalReadAddrA,1)  offset:24
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+4),  v_regs(vgprLocalReadAddrA,1)  offset:32
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+5),  v_regs(vgprLocalReadAddrA,1)  offset:40
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+6),  v_regs(vgprLocalReadAddrA,1)  offset:48
  ds_read_b32       v_regs(vgprValuA_X0_I0,  8*1+0*0+7),  v_regs(vgprLocalReadAddrA,1)  offset:56

  s_barrier

  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+0),  v_regs(vgprLocalReadAddrB,1)  offset: 0
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+0),  v_regs(vgprLocalReadAddrB,1)  offset: 0 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+1),  v_regs(vgprLocalReadAddrB,1)  offset: 8
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+1),  v_regs(vgprLocalReadAddrB,1)  offset: 8 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+2),  v_regs(vgprLocalReadAddrB,1)  offset:16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+2),  v_regs(vgprLocalReadAddrB,1)  offset:16 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+3),  v_regs(vgprLocalReadAddrB,1)  offset:24
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+3),  v_regs(vgprLocalReadAddrB,1)  offset:24 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+4),  v_regs(vgprLocalReadAddrB,1)  offset:32
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+4),  v_regs(vgprLocalReadAddrB,1)  offset:32 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+5),  v_regs(vgprLocalReadAddrB,1)  offset:40
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+5),  v_regs(vgprLocalReadAddrB,1)  offset:40 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+6),  v_regs(vgprLocalReadAddrB,1)  offset:48
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+6),  v_regs(vgprLocalReadAddrB,1)  offset:48 + varlds_Bsize_per_wr * 16
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*0+7),  v_regs(vgprLocalReadAddrB,1)  offset:56
  ds_read_b32       v_regs(vgprValuB_X0_I0, 16*1+8*1+7),  v_regs(vgprLocalReadAddrB,1)  offset:56 + varlds_Bsize_per_wr * 16

  //******************************************************************************//
  //alpha_change:
  //create branch here and check for alpha!=1
  // if alpha!=1 jump to new label
  // for new label; cp the below code and add alpha calculation

  //second unroll Loop
  s_waitcnt lgkmcnt(0)

  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+0],  v[vgprValuB_X0_I0+16*1+8*0+0],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+0],  v[vgprValuB_X0_I0+16*1+8*1+0],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+1],  v[vgprValuB_X0_I0+16*1+8*0+1],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+1],  v[vgprValuB_X0_I0+16*1+8*1+1],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+2],  v[vgprValuB_X0_I0+16*1+8*0+2],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+2],  v[vgprValuB_X0_I0+16*1+8*1+2],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+3],  v[vgprValuB_X0_I0+16*1+8*0+3],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+3],  v[vgprValuB_X0_I0+16*1+8*1+3],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+4],  v[vgprValuB_X0_I0+16*1+8*0+4],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+4],  v[vgprValuB_X0_I0+16*1+8*1+4],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+5],  v[vgprValuB_X0_I0+16*1+8*0+5],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+5],  v[vgprValuB_X0_I0+16*1+8*1+5],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+6],  v[vgprValuB_X0_I0+16*1+8*0+6],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+6],  v[vgprValuB_X0_I0+16*1+8*1+6],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+ 0],  v[vgprValuA_X0_I0+8*1+0*0+7],  v[vgprValuB_X0_I0+16*1+8*0+7],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16   v[vgprAcc+16],  v[vgprValuA_X0_I0+8*1+0*0+7],  v[vgprValuB_X0_I0+16*1+8*1+7],  v[vgprAcc+16]

  for var j = 0; j < 32; j++
      v_accvgpr_read v_regs(vgprValuC, j), v_regs(vgprAcc, j), 0
  end

  s_nop 7

  /******************************************/
  /* Local Write Addresses Offset D         */
  /******************************************/
  s_mov_b32     s83, varlds_output_m_stride
  s_mov_b32     s84, varlds_output_per_wave
  s_mul_i32     s84, s[sgprFetchSubGrpId], s84

  v_lshrrev_b32 v[vgprTmp], 5, v[vgprSerial+1]        // vgprSerial / 32
  v_lshlrev_b32 v[vgprTmp], 2, v[vgprTmp]             // (vgprSerial / 32) * 4
  v_and_b32     v[vgprTmp+1], 31, v[vgprSerial+1]     // vgprSerial % 32
  v_mul_lo_u32  v[vgprTmp+1], s83, v[vgprTmp+1]       // (vgprSerial % 32) * varlds_output_m_stride
  v_add_u32     v[vgprLocalWriteAddrC], v[vgprTmp], v[vgprTmp+1]
  v_add_u32     v[vgprLocalWriteAddrC], s84, v[vgprLocalWriteAddrC]
  v_lshlrev_b32 v[vgprLocalWriteAddrC], 2, v[vgprLocalWriteAddrC] // shift for bpe(4)

  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+ 0+ 0:vgprValuC+ 0+ 3] offset: 0
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+16+ 0:vgprValuC+16+ 3] offset: 0 + 32 * varlds_output_m_stride * 4
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+ 0+ 4:vgprValuC+ 0+ 7] offset:32
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+16+ 4:vgprValuC+16+ 7] offset:32 + 32 * varlds_output_m_stride * 4
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+ 0+ 8:vgprValuC+ 0+11] offset:64
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+16+ 8:vgprValuC+16+11] offset:64 + 32 * varlds_output_m_stride * 4
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+ 0+12:vgprValuC+ 0+15] offset:96
  ds_write_b128 v[vgprLocalWriteAddrC], v[vgprValuC+16+12:vgprValuC+16+15] offset:96 + 32 * varlds_output_m_stride * 4

  s_waitcnt lgkmcnt(0)

  s_barrier

  /******************************************/
  /* Local Read Addresses Offset D          */
  /******************************************/
  s_mov_b32     s83, varlds_output_m_stride
  s_mov_b32     s84, 16 * varlds_output_m_stride
  s_mul_i32     s84, s[sgprFetchSubGrpId], s84

  v_and_b32     v[vgprTmp], 3, v[vgprSerial+1]        // vgprSerial % 4
  v_lshlrev_b32 v[vgprTmp], 3, v[vgprTmp]             // (vgprSerial % 4) * 8
  v_lshrrev_b32 v[vgprTmp+1], 2, v[vgprSerial+1]      // vgprSerial / 4
  v_mul_lo_u32  v[vgprTmp+1], s83, v[vgprTmp+1]       // (vgprSerial / 4) * varlds_output_m_stride
  v_add_u32     v[vgprLocalReadAddrC], v[vgprTmp], v[vgprTmp+1]
  v_add_u32     v[vgprLocalReadAddrC], s84, v[vgprLocalReadAddrC]
  v_lshlrev_b32 v[vgprLocalReadAddrC], 2, v[vgprLocalReadAddrC] // shift for bpe(4)

  ds_read_b128  v[vgprValuC+0*8+0], v[vgprLocalReadAddrC+0]  offset: 0
  ds_read_b128  v[vgprValuC+0*8+4], v[vgprLocalReadAddrC+0]  offset:16
  ds_read_b128  v[vgprValuC+1*8+0], v[vgprLocalReadAddrC+0]  offset: 0 + 1 * varlds_output_per_wave * 4
  ds_read_b128  v[vgprValuC+1*8+4], v[vgprLocalReadAddrC+0]  offset:16 + 1 * varlds_output_per_wave * 4
  ds_read_b128  v[vgprValuC+2*8+0], v[vgprLocalReadAddrC+0]  offset: 0 + 2 * varlds_output_per_wave * 4
  ds_read_b128  v[vgprValuC+2*8+4], v[vgprLocalReadAddrC+0]  offset:16 + 2 * varlds_output_per_wave * 4
  ds_read_b128  v[vgprValuC+3*8+0], v[vgprLocalReadAddrC+0]  offset: 0 + 3 * varlds_output_per_wave * 4
  ds_read_b128  v[vgprValuC+3*8+4], v[vgprLocalReadAddrC+0]  offset:16 + 3 * varlds_output_per_wave * 4

  s_waitcnt lgkmcnt(0)

  /******************************************/
  /* Local Split U Accumulation             */
  /******************************************/

  v_add_f32     v[vgprValuC+0*8+0], v[vgprValuC+0*8+0], v[vgprValuC+1*8+0]
  v_add_f32     v[vgprValuC+0*8+0], v[vgprValuC+0*8+0], v[vgprValuC+2*8+0]
  v_add_f32     v[vgprValuC+0*8+0], v[vgprValuC+0*8+0], v[vgprValuC+3*8+0]

  v_add_f32     v[vgprValuC+0*8+1], v[vgprValuC+0*8+1], v[vgprValuC+1*8+1]
  v_add_f32     v[vgprValuC+0*8+1], v[vgprValuC+0*8+1], v[vgprValuC+2*8+1]
  v_add_f32     v[vgprValuC+0*8+1], v[vgprValuC+0*8+1], v[vgprValuC+3*8+1]

  v_add_f32     v[vgprValuC+0*8+2], v[vgprValuC+0*8+2], v[vgprValuC+1*8+2]
  v_add_f32     v[vgprValuC+0*8+2], v[vgprValuC+0*8+2], v[vgprValuC+2*8+2]
  v_add_f32     v[vgprValuC+0*8+2], v[vgprValuC+0*8+2], v[vgprValuC+3*8+2]

  v_add_f32     v[vgprValuC+0*8+3], v[vgprValuC+0*8+3], v[vgprValuC+1*8+3]
  v_add_f32     v[vgprValuC+0*8+3], v[vgprValuC+0*8+3], v[vgprValuC+2*8+3]
  v_add_f32     v[vgprValuC+0*8+3], v[vgprValuC+0*8+3], v[vgprValuC+3*8+3]

  v_add_f32     v[vgprValuC+0*8+4], v[vgprValuC+0*8+4], v[vgprValuC+1*8+4]
  v_add_f32     v[vgprValuC+0*8+4], v[vgprValuC+0*8+4], v[vgprValuC+2*8+4]
  v_add_f32     v[vgprValuC+0*8+4], v[vgprValuC+0*8+4], v[vgprValuC+3*8+4]

  v_add_f32     v[vgprValuC+0*8+5], v[vgprValuC+0*8+5], v[vgprValuC+1*8+5]
  v_add_f32     v[vgprValuC+0*8+5], v[vgprValuC+0*8+5], v[vgprValuC+2*8+5]
  v_add_f32     v[vgprValuC+0*8+5], v[vgprValuC+0*8+5], v[vgprValuC+3*8+5]

  v_add_f32     v[vgprValuC+0*8+6], v[vgprValuC+0*8+6], v[vgprValuC+1*8+6]
  v_add_f32     v[vgprValuC+0*8+6], v[vgprValuC+0*8+6], v[vgprValuC+2*8+6]
  v_add_f32     v[vgprValuC+0*8+6], v[vgprValuC+0*8+6], v[vgprValuC+3*8+6]

  v_add_f32     v[vgprValuC+0*8+7], v[vgprValuC+0*8+7], v[vgprValuC+1*8+7]
  v_add_f32     v[vgprValuC+0*8+7], v[vgprValuC+0*8+7], v[vgprValuC+2*8+7]
  v_add_f32     v[vgprValuC+0*8+7], v[vgprValuC+0*8+7], v[vgprValuC+3*8+7]

  /******************************************/
  /* Output Result to D Buffer              */
  /******************************************/

  s_mov_b32     s84, roundMaskVal
  v_xor_b32     v[vgprTmp+1], v[vgprTmp],v[vgprTmp]
  v_or_b32      v[vgprTmp+1], s84, v[vgprTmp+1]

  for var j = 0; j < 8; j+=2
    v_lshrrev_b32    v[vgprValuC+j], 16, v[vgprValuC+j]
    v_and_or_b32     v[vgprValuC+(j/2)], v[vgprValuC+j+1],v[vgprTmp+1], v[vgprValuC+j]
  end

  buffer_store_dwordx4 v[vgprValuC+0:vgprValuC+3], v[vgprGlobalWriteOfvarC],  s[sgprSrdD:sgprSrdD+3], 0 offset:0 offen:1 // store C

label_0004:
  s_waitcnt 0
  s_endpgm

end
