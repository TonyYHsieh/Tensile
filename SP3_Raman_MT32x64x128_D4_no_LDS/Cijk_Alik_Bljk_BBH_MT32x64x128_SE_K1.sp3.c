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
var vgprValuC=0
var vgprAcc=0
var vgprG2LA=0  // 16
var vgprG2LB=16 // 32
var vgprGlobalReadOfvarA=48 // 2
var vgprGlobalReadOfvarB=50 // 4
var vgprLocalWriteAddrC=54
var vgprLocalReadAddrC=55

/////compute vreg def////////////////

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
  s_load_dwordx2 s[sgprTensor2dSizeC+0:sgprTensor2dSizeC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0 //
  s_load_dwordx4 s[sgprTensor2dSizeA+0:sgprTensor2dSizeB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8 //
  s_load_dwordx4 s[sgprAddressD:sgprAddressC+1],             s[sgprKernArgAddress:sgprKernArgAddress+1], 0x18 //
  s_load_dwordx4 s[sgprAddressA:sgprAddressB+1],             s[sgprKernArgAddress:sgprKernArgAddress+1], 0x28 //
  s_load_dwordx4 s[sgprAlpha:sgprSizesFree+1],               s[sgprKernArgAddress:sgprKernArgAddress+1], 0x38 //
  s_load_dwordx4 s[sgprStridesD+0:sgprStridesC+1],           s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40 //
  s_load_dwordx4 s[sgprStridesA+0:sgprStridesB+1],           s[sgprKernArgAddress:sgprKernArgAddress+1], 0x50 //
  s_load_dword   s[sgprSizesSum+0],                          s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c //

  // s_load_dword s[sgprTensor2dSizeA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8 //
  // s_load_dword s[sgprTensor2dSizeA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0xc //
  // s_load_dword s[sgprTensor2dSizeB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x10 //
  // s_load_dword s[sgprTensor2dSizeB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x14 //
  // s_load_dword s[sgprAddressA], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x28 //
  // s_load_dword s[sgprAddressA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x2c //
  // s_load_dword s[sgprAddressB], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x30 //
  // s_load_dword s[sgprAddressB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x34 //
  // s_load_dword s[sgprStridesA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x50 //
  // s_load_dword s[sgprStridesA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x54 //
  // s_load_dword s[sgprStridesB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x58 //
  // s_load_dword s[sgprStridesB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x5c //
  // s_load_dword s[sgprSizesSum+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c //

  v_mov_b32             v[vgprSerial],   v0                      // thread serial Id
  v_and_b32             v[vgprSerial+1], 0x3f, v0                // threadId-xy
  v_lshrrev_b32         v[vgprSerial+2], 6,    v[vgprSerial]     // threadId-z
  v_readfirstlane_b32   s[sgprFetchSubGrpId],  v[vgprSerial+2]

  s_waitcnt lgkmcnt(0)                               // wait for 144 bytes of kern args

  /******************************************/
  /* Init Accumulation Register             */
  /******************************************/
  for var i =0; i < 32; i++
      v_accvgpr_write v_regs(0,i), 0, 0
  end


  // Global read addresses: address A resource descriptor set-up
  // sgpr[0-1] - base address
  // sgpr[2]   - limit
  // sgpr[3]   - attributes

  // calculate base address for  A
  // 1. multiply MT0 size with TileNumber passed in s[sgprWorkGroup0]
  // 2. multiply [1] result with stride[0] store result into 64-bit
  // 3. the above two steps gives starting address of tile that this workgroup working

  s_mov_b32        s[sgprSrdA+0], s[sgprAddressA+0]            // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdA+1], s[sgprAddressA+1]            // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdA+2], BufferLimit
  s_mov_b32        s[sgprSrdA+3], Srd127_96                    // set bits 127_96 in SRD

  s_mul_i32        s84,  s[sgprStridesA+0],     32             // workGroup[0]*MT
  s_mul_i32        s84,  s[sgprWorkGroup0],     s84            // workGroup[0]*MT
  s_lshl_b32       s85,  s[sgprFetchSubGrpId],  5
  s_add_i32        s84,  s84,                   s85

  //tile offset assignment a : global read address
  v_and_b32        v0,    31, v[vgprSerial+1]                  // v[vgprSerial+1] % 32
  v_mul_lo_u32     v4,    s[sgprStridesA+0],  v0               // mul d1 lower
  v_lshrrev_b32    v1,    5,  v[vgprSerial+1]                  // v[vgprSerial+1] / 32
  v_lshlrev_b32    v1,    3,  v1                               // v[vgprSerial+1] / 32 * 8
  v_add_co_u32     v[vgprGlobalReadOfvarA+0], vcc, v4, v1      // accumulate d1 lower
  v_add_u32        v[vgprGlobalReadOfvarA+0], s84, v[vgprGlobalReadOfvarA+0]
  v_lshlrev_b32    v[vgprGlobalReadOfvarA+0], 0x1, v[vgprGlobalReadOfvarA+0]  // offset *= bytes/element (x2)  // convert into bytes offset
  v_add_u32        v[vgprGlobalReadOfvarA+1], 32,  v[vgprGlobalReadOfvarA+0]

  /******************************************/
  /* global read addresses: addresses b     */
  /******************************************/
  s_mov_b32        s[sgprSrdB+0], s[sgprAddressB+0]             // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdB+1], s[sgprAddressB+1]             // SRD base = Address + tile_start
  s_mov_b32        s[sgprSrdB+2], BufferLimit
  s_mov_b32        s[sgprSrdB+3], Srd127_96                     // set bits 127_96 in SRD

  s_mul_i32        s84,  s[sgprStridesB+0],     64              // workGroup[0]*MT
  s_mul_i32        s84,  s[sgprWorkGroup1],     s84             // workGroup[0]*MT
  s_lshl_b32       s85,  s[sgprFetchSubGrpId],  5
  s_add_i32        s84,  s84,                   s85

  // tile offset assignment b : global read address
  /* LVCA= 16 */
  // glvw = 1
  v_and_b32        v0,     31,                v[vgprSerial+1]   // v[vgprSerial+1] % 32
  v_mul_lo_u32     v4,     s[sgprStridesB+0], v0                // mul d1 lower
  v_lshrrev_b32    v1,     5,                 v[vgprSerial+1]   // v[vgprSerial+1] / 32
  v_lshlrev_b32    v1,     3,                 v1                // v[vgprSerial+1] / 32 * 8
  v_add_co_u32     v[vgprGlobalReadOfvarB+0*2+0], vcc, v4,  v1                       // accumulate d1 lower
  v_add_u32        v[vgprGlobalReadOfvarB+0*2+0], s84, v[vgprGlobalReadOfvarB+0]     // accumulate d1 lower
  v_lshlrev_b32    v[vgprGlobalReadOfvarB+0*2+0], 0x1, v[vgprGlobalReadOfvarB+0]     // offset *= bytes/element
  v_add_u32        v[vgprGlobalReadOfvarB+0*2+1], 32,  v[vgprGlobalReadOfvarB+0*2+0]
  s_lshl_b32       s[sgprScalarGlobalReadOffsetB+0], s[sgprStridesB+0], 6            // x64 = x32(32 lines) x 2(bpe 2)
  v_add_u32        v[vgprGlobalReadOfvarB+1*2+0], s[sgprScalarGlobalReadOffsetB+0],  v[vgprGlobalReadOfvarB+0*2+0]
  v_add_u32        v[vgprGlobalReadOfvarB+1*2+1], s[sgprScalarGlobalReadOffsetB+0],  v[vgprGlobalReadOfvarB+0*2+1]

  /******************************************/
  /* pre-loop                               */
  /******************************************/

  buffer_load_dwordx4 v[vgprG2LA+0* 8+    0:vgprG2LA+0* 8+    3],  v[vgprGlobalReadOfvarA+    0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+0* 8+    4:vgprG2LA+0* 8+    7],  v[vgprGlobalReadOfvarA+    1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  buffer_load_dwordx4 v[vgprG2LB+0*16+0*8+0:vgprG2LB+0*16+0*8+3],  v[vgprGlobalReadOfvarB+0*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+0*8+4:vgprG2LB+0*16+0*8+7],  v[vgprGlobalReadOfvarB+0*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+1*8+0:vgprG2LB+0*16+1*8+3],  v[vgprGlobalReadOfvarB+1*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+1*8+4:vgprG2LB+0*16+1*8+7],  v[vgprGlobalReadOfvarB+1*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0

  v_add_u32         v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32         v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32         v[vgprGlobalReadOfvarB+0*2+0], 256, v[vgprGlobalReadOfvarB+0*2+0]
  v_add_u32         v[vgprGlobalReadOfvarB+0*2+1], 256, v[vgprGlobalReadOfvarB+0*2+1]
  v_add_u32         v[vgprGlobalReadOfvarB+1*2+0], 256, v[vgprGlobalReadOfvarB+1*2+0]
  v_add_u32         v[vgprGlobalReadOfvarB+1*2+1], 256, v[vgprGlobalReadOfvarB+1*2+1]

  //Fetch 2nd unroll loop iteration (2nd 32 k indices)

  buffer_load_dwordx4 v[vgprG2LA+1* 8+    0:vgprG2LA+1* 8+    3],  v[vgprGlobalReadOfvarA+    0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+1* 8+    4:vgprG2LA+1* 8+    7],  v[vgprGlobalReadOfvarA+    1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  buffer_load_dwordx4 v[vgprG2LB+1*16+0*8+0:vgprG2LB+1*16+0*8+3],  v[vgprGlobalReadOfvarB+0*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+0*8+4:vgprG2LB+1*16+0*8+7],  v[vgprGlobalReadOfvarB+0*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+1*8+0:vgprG2LB+1*16+1*8+3],  v[vgprGlobalReadOfvarB+1*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+1*8+4:vgprG2LB+1*16+1*8+7],  v[vgprGlobalReadOfvarB+1*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0

  v_add_u32         v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32         v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32         v[vgprGlobalReadOfvarB+0*2+0], 256, v[vgprGlobalReadOfvarB+0*2+0]
  v_add_u32         v[vgprGlobalReadOfvarB+0*2+1], 256, v[vgprGlobalReadOfvarB+0*2+1]
  v_add_u32         v[vgprGlobalReadOfvarB+1*2+0], 256, v[vgprGlobalReadOfvarB+1*2+0]
  v_add_u32         v[vgprGlobalReadOfvarB+1*2+1], 256, v[vgprGlobalReadOfvarB+1*2+1]

  s_lshr_b32       s[sgprLoopCounters+0], s[sgprSizesSum+0], 7 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 128
  s_sub_u32        s[sgprLoopCounters+0], 0x0, s[sgprLoopCounters+0]
  s_cmp_eq_u32     s[sgprLoopCounters+0], 0x0            // numIter0I == 0
  s_cbranch_scc1   label_0006                           // Dont enter Loop

/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/
label_0005:

  s_waitcnt vmcnt(6)

  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    0],  v[vgprG2LB+0*16+0*8+0],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    0],  v[vgprG2LB+0*16+1*8+0],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    1],  v[vgprG2LB+0*16+0*8+1],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    1],  v[vgprG2LB+0*16+1*8+1],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    2],  v[vgprG2LB+0*16+0*8+2],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    2],  v[vgprG2LB+0*16+1*8+2],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    3],  v[vgprG2LB+0*16+0*8+3],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    3],  v[vgprG2LB+0*16+1*8+3],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    4],  v[vgprG2LB+0*16+0*8+4],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    4],  v[vgprG2LB+0*16+1*8+4],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    5],  v[vgprG2LB+0*16+0*8+5],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    5],  v[vgprG2LB+0*16+1*8+5],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    6],  v[vgprG2LB+0*16+0*8+6],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    6],  v[vgprG2LB+0*16+1*8+6],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    7],  v[vgprG2LB+0*16+0*8+7],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    7],  v[vgprG2LB+0*16+1*8+7],  v[vgprAcc+16]

  buffer_load_dwordx4 v[vgprG2LA+0* 8+    0:vgprG2LA+0* 8+    3],  v[vgprGlobalReadOfvarA+    0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+0* 8+    4:vgprG2LA+0* 8+    7],  v[vgprGlobalReadOfvarA+    1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  buffer_load_dwordx4 v[vgprG2LB+0*16+0*8+0:vgprG2LB+0*16+0*8+3],  v[vgprGlobalReadOfvarB+0*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+0*8+4:vgprG2LB+0*16+0*8+7],  v[vgprGlobalReadOfvarB+0*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+1*8+0:vgprG2LB+0*16+1*8+3],  v[vgprGlobalReadOfvarB+1*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+0*16+1*8+4:vgprG2LB+0*16+1*8+7],  v[vgprGlobalReadOfvarB+1*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0

  v_add_u32           v[vgprGlobalReadOfvarA+    0], 256, v[vgprGlobalReadOfvarA+    0]
  v_add_u32           v[vgprGlobalReadOfvarA+    1], 256, v[vgprGlobalReadOfvarA+    1]

  v_add_u32           v[vgprGlobalReadOfvarB+0*2+0], 256, v[vgprGlobalReadOfvarB+0*2+0]
  v_add_u32           v[vgprGlobalReadOfvarB+0*2+1], 256, v[vgprGlobalReadOfvarB+0*2+1]
  v_add_u32           v[vgprGlobalReadOfvarB+1*2+0], 256, v[vgprGlobalReadOfvarB+1*2+0]
  v_add_u32           v[vgprGlobalReadOfvarB+1*2+1], 256, v[vgprGlobalReadOfvarB+1*2+1]

  s_waitcnt vmcnt(6)

  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    0],  v[vgprG2LB+1*16+0*8+0],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    0],  v[vgprG2LB+1*16+1*8+0],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    1],  v[vgprG2LB+1*16+0*8+1],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    1],  v[vgprG2LB+1*16+1*8+1],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    2],  v[vgprG2LB+1*16+0*8+2],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    2],  v[vgprG2LB+1*16+1*8+2],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    3],  v[vgprG2LB+1*16+0*8+3],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    3],  v[vgprG2LB+1*16+1*8+3],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    4],  v[vgprG2LB+1*16+0*8+4],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    4],  v[vgprG2LB+1*16+1*8+4],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    5],  v[vgprG2LB+1*16+0*8+5],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    5],  v[vgprG2LB+1*16+1*8+5],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    6],  v[vgprG2LB+1*16+0*8+6],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    6],  v[vgprG2LB+1*16+1*8+6],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    7],  v[vgprG2LB+1*16+0*8+7],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    7],  v[vgprG2LB+1*16+1*8+7],  v[vgprAcc+16]

  buffer_load_dwordx4 v[vgprG2LA+1* 8+    0:vgprG2LA+1* 8+    3],  v[vgprGlobalReadOfvarA+    0],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LA+1* 8+    4:vgprG2LA+1* 8+    7],  v[vgprGlobalReadOfvarA+    1],  s[sgprSrdA:sgprSrdA+3], 0 offen:1 offset:0

  buffer_load_dwordx4 v[vgprG2LB+1*16+0*8+0:vgprG2LB+1*16+0*8+3],  v[vgprGlobalReadOfvarB+0*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+0*8+4:vgprG2LB+1*16+0*8+7],  v[vgprGlobalReadOfvarB+0*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+1*8+0:vgprG2LB+1*16+1*8+3],  v[vgprGlobalReadOfvarB+1*2+0],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0
  buffer_load_dwordx4 v[vgprG2LB+1*16+1*8+4:vgprG2LB+1*16+1*8+7],  v[vgprGlobalReadOfvarB+1*2+1],  s[sgprSrdB:sgprSrdB+3], 0 offen:1 offset:0

  v_add_u32         v[vgprGlobalReadOfvarA+ 0], 256, v[vgprGlobalReadOfvarA+ 0]
  v_add_u32         v[vgprGlobalReadOfvarA+ 1], 256, v[vgprGlobalReadOfvarA+ 1]

  v_add_u32         v[vgprGlobalReadOfvarB+0*2+0], 256, v[vgprGlobalReadOfvarB+0*2+0]
  v_add_u32         v[vgprGlobalReadOfvarB+0*2+1], 256, v[vgprGlobalReadOfvarB+0*2+1]
  v_add_u32         v[vgprGlobalReadOfvarB+1*2+0], 256, v[vgprGlobalReadOfvarB+1*2+0]
  v_add_u32         v[vgprGlobalReadOfvarB+1*2+1], 256, v[vgprGlobalReadOfvarB+1*2+1]

  s_add_u32     s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x2        //inc CounterL
  s_cmp_eq_i32  s[sgprLoopCounters+0], -0x2                    // CounterL=0x2
  s_cbranch_scc0  label_0005

label_0006:

  s_waitcnt vmcnt(6)

  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    0],  v[vgprG2LB+0*16+0*8+0],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    0],  v[vgprG2LB+0*16+1*8+0],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    1],  v[vgprG2LB+0*16+0*8+1],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    1],  v[vgprG2LB+0*16+1*8+1],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    2],  v[vgprG2LB+0*16+0*8+2],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    2],  v[vgprG2LB+0*16+1*8+2],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    3],  v[vgprG2LB+0*16+0*8+3],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    3],  v[vgprG2LB+0*16+1*8+3],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    4],  v[vgprG2LB+0*16+0*8+4],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    4],  v[vgprG2LB+0*16+1*8+4],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    5],  v[vgprG2LB+0*16+0*8+5],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    5],  v[vgprG2LB+0*16+1*8+5],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    6],  v[vgprG2LB+0*16+0*8+6],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    6],  v[vgprG2LB+0*16+1*8+6],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+0* 8+    7],  v[vgprG2LB+0*16+0*8+7],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+0* 8+    7],  v[vgprG2LB+0*16+1*8+7],  v[vgprAcc+16]

  s_waitcnt vmcnt(0)

  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    0],  v[vgprG2LB+1*16+0*8+0],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    0],  v[vgprG2LB+1*16+1*8+0],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    1],  v[vgprG2LB+1*16+0*8+1],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    1],  v[vgprG2LB+1*16+1*8+1],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    2],  v[vgprG2LB+1*16+0*8+2],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    2],  v[vgprG2LB+1*16+1*8+2],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    3],  v[vgprG2LB+1*16+0*8+3],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    3],  v[vgprG2LB+1*16+1*8+3],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    4],  v[vgprG2LB+1*16+0*8+4],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    4],  v[vgprG2LB+1*16+1*8+4],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    5],  v[vgprG2LB+1*16+0*8+5],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    5],  v[vgprG2LB+1*16+1*8+5],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    6],  v[vgprG2LB+1*16+0*8+6],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    6],  v[vgprG2LB+1*16+1*8+6],  v[vgprAcc+16]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+ 0],  v[vgprG2LA+1* 8+    7],  v[vgprG2LB+1*16+0*8+7],  v[vgprAcc+ 0]
  v_mfma_f32_32x32x4bf16  v[vgprAcc+16],  v[vgprG2LA+1* 8+    7],  v[vgprG2LB+1*16+1*8+7],  v[vgprAcc+16]


  /******************************************/
  /*----------------- STORE ----------------*/
  /******************************************/

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
  v_lshrrev_b32   v4, 2,    v[vgprSerial+1]                         // vectorStaticDiv vgprTmp = vgprSerial / 4
  v_mul_lo_u32    v5, v4,   s[sgprStridesC+0]                       // rowstart VGPR
  v_and_b32       v4, 3,    v[vgprSerial+1]                         // vectorStaticDiv vgprTmp = vgprSerial % 4
  v_lshlrev_b32   v6, 3,    v4                                      // glvw=8
  v_add_u32       v[vgprTmp], v5, v6

  s_mul_i32       s84, s[sgprStridesC+0], 16
  s_mul_i32       s84, s[sgprFetchSubGrpId], s84
  v_add_u32       v[vgprTmp], s84, v[vgprTmp]

  s_mul_i32       s84, 0x20, s[sgprWorkGroup0]                      // s84 = wgp0*MT0
  v_add_lshl_u32  v[vgprGlobalWriteOfvarC], v[vgprTmp], s84, 0x1    // c base_addr = wave_start+row_start scaled by BPE


  for var j = 0; j < 32; j++
    v_accvgpr_read v_regs(vgprValuC, j), v_regs(vgprAcc, j), 0
//    v_mov_b32      v_regs(vgprValuC, j), 128
//    v_cvt_f32_u32  v_regs(vgprValuC, j), v_regs(vgprValuC, j)
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


s_endpgm

end
