

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU" 
.text
.protected Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1
.globl Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1
.p2align 8
.type Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1,@function
.amdgpu_hsa_kernel Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1
Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 80 // bytes of kern args
  workitem_vgpr_count = 89 // vgprs
  wavefront_sgpr_count = 86 // sgprs
  compute_pgm_rsrc1_vgprs = 22 // floor((89-1)/4)
  compute_pgm_rsrc1_sgprs = 11 // floor((86-1)/8)
  compute_pgm_rsrc2_tidig_comp_cnt = 0 // 1D wg
  compute_pgm_rsrc2_tgid_x_en = 1 // wg.x
  compute_pgm_rsrc2_tgid_y_en = 1 // wg.y
  compute_pgm_rsrc2_tgid_z_en = 1 // wg.z
  workgroup_group_segment_byte_size = 13312 // lds bytes
  compute_pgm_rsrc2_user_sgpr = 2 // vcc
  kernarg_segment_alignment = 4
  group_segment_alignment = 4
  private_segment_alignment = 4
.end_amd_kernel_code_t

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 2 x 32 */
/* SubGroup= 32 x 8 */
/* VectorWidth=2 */
/* GlobalLoadVectorWidthA=2, GlobalLoadVectorWidthB=2 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=False */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1
    SymbolName: 'Cijk_Ailk_Bljk_BBH_MT64x256x8_MI32x32x2x2_SE_K1@kd'
    Language: OpenCL C
    LanguageVersion: [ 2, 0 ]
    Args:
      - Name:            sizeC
        Size:            8
        Align:           8
        ValueKind:       ByValue
        ValueType:       I64
      - Name:            sizeA
        Size:            8
        Align:           8
        ValueKind:       ByValue
        ValueType:       I64
      - Name:            sizeB
        Size:            8
        Align:           8
        ValueKind:       ByValue
        ValueType:       I64
      - Name:            D
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            C
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            A
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            B
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            alpha
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       F32
      - Name:            beta
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       F32
      - Name:            strideD0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideD1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideC0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideC1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideA0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideA1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideB0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideB1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesFree0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesFree1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesFree2
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesSum0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            OrigStaggerUIter
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
      - Name:            NumWorkGroups0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            NumWorkGroups1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            MagicNumberProblemNumGroupTiles0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            GridNumWorkGroups0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            NumFullBlocks
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            WgmRemainder1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            MagicNumberWgmRemainder1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            padding
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
    CodeProps:
      KernargSegmentSize: 148
      GroupSegmentFixedSize: 13312
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign:  8
      WavefrontSize:        64
      NumSGPRs:             86
      NumVGPRs:             89
      MaxFlatWorkGroupSize: 256
.end_amd_amdgpu_hsa_metadata

/******************************************/
/* Asm syntax workarounds                 */
/******************************************/
.macro _v_add_co_u32 dst, cc, src0, src1, dpp=
   v_add_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm

.macro _v_add_u32 dst, src0, src1, dpp=
   v_add_u32 \dst, \src0, \src1 \dpp
.endm

.macro _v_sub_co_u32 dst, cc, src0, src1, dpp=
   v_sub_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm

.macro _v_sub_u32 dst, src0, src1, dpp=
   v_sub_u32 \dst, \src0, \src1 \dpp
.endm

.macro _v_addc_co_u32 dst, ccOut, src0, ccIn, src1, dpp=
   v_addc_co_u32 \dst, \ccOut, \src0, \ccIn, \src1 \dpp
.endm

.macro _v_add_lshl_u32 dst, src0, src1, shiftCnt
    v_add_lshl_u32 \dst, \src0, \src1, \shiftCnt
.endm

.macro _v_lshl_add_u32 dst, src0, src1, shiftCnt
    v_lshl_add_u32 \dst, \src0, \src1, \shiftCnt
.endm

/******************************************/
/* Magic div and mod functions            */
/******************************************/
.macro V_MAGIC_DIV dstIdx, dividend, magicNumber, magicShift
    v_mul_hi_u32 v[\dstIdx+1], \dividend, \magicNumber
    v_mul_lo_u32 v[\dstIdx+0], \dividend, \magicNumber
    v_lshrrev_b64 v[\dstIdx:\dstIdx+1], \magicShift, v[\dstIdx:\dstIdx+1]
.endm

/******************************************/
/* VGPR Assignments                       */
/******************************************/
.set vgprValuC, 0
/* ValuA/B   Xn=PLR buffer idx,  In=InnerUnroll idx */
.set vgprValuA_X0_I0, 64
.set vgprValuA_X1_I0, 66
.set vgprG2LA, 68
.set vgprValuB_X0_I0, 69
.set vgprValuB_X1_I0, 70
.set vgprG2LB, 71
.set vgprLocalWriteAddrA, 75
.set vgprLocalWriteAddrB, 76
.set vgprGlobalReadOffsetA, 77
.set vgprGlobalReadOffsetB, 78
.set vgprLocalReadAddrA, 82
.set vgprLocalReadAddrB, 83
.set vgprSerial, 88
/* Num VGPR=89 */

/******************************************/
/* SGPR Assignments                       */
/******************************************/
.set sgprKernArgAddress, 0
.set sgprWorkGroup0, 2
.set sgprWorkGroup1, 3
.set sgprWorkGroup2, 4
.set sgprNumWorkGroups0, 5
.set sgprNumWorkGroups1, 6
.set sgprSrdA, 8
.set sgprSrdB, 12
.set sgprSrdD, 16
.set sgprSrdC, 20
.set sgprTensor2dSizeC, 24
.set sgprTensor2dSizeA, 26
.set sgprTensor2dSizeB, 28
.set sgprSaveExecMask, 30
.set sgprAddressD, 32
.set sgprAddressC, 34
.set sgprStridesD, 36
.set sgprStridesC, 38
.set sgprAlpha, 40
.set sgprBeta, 41
.set sgprSizesFree, 42
.set sgprSizesSum, 45
.set sgprLoopCounters, 46
.set sgprOrigLoopCounter, 47
.set sgprStridesA, 48
.set sgprStridesB, 50
.set sgprAddressA, 52
.set sgprAddressB, 54
.set sgprShadowLimitA, 56
.set sgprShadowLimitB, 58
.set sgprOrigStaggerUIter, 60
.set sgprStaggerUIter, 61
.set sgprWrapUA, 62
.set sgprWrapUB, 64
.set sgprNumFullBlocks, 66
.set sgprWgmRemainder1, 67
.set sgprMagicNumberWgmRemainder1, 68
.set sgprGlobalReadIncsA, 69
.set sgprGlobalReadIncsB, 70
/* max SGPR=86 */

/* Size Assignments */
.set sgprSizeD0I, sgprSizesFree+0
.set sgprSizeD1J, sgprSizesFree+1
.set sgprSizeDK, sgprSizesFree+2
.set sgprSizeC0I, sgprSizesFree+0
.set sgprSizeC1J, sgprSizesFree+1
.set sgprSizeCK, sgprSizesFree+2
.set sgprSizeA0I, sgprSizesFree+0
.set sgprSizeAL, sgprSizesSum+0
.set sgprSizeAK, sgprSizesFree+2
.set sgprSizeBL, sgprSizesSum+0
.set sgprSizeB1J, sgprSizesFree+1
.set sgprSizeBK, sgprSizesFree+2

/* Stride Assignments */
.set constStrideD0I, 1
.set sgprStrideD1J, sgprStridesD+0
.set sgprStrideDK, sgprStridesD+1
.set constStrideC0I, 1
.set sgprStrideC1J, sgprStridesC+0
.set sgprStrideCK, sgprStridesC+1
.set constStrideA0I, 1
.set sgprStrideAL, sgprStridesA+0
.set sgprStrideAK, sgprStridesA+1
.set constStrideBL, 1
.set sgprStrideB1J, sgprStridesB+0
.set sgprStrideBK, sgprStridesB+1

.set DepthU, 8
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 2
.set SrdShiftLeftB, 2
/* 2GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0x80000000
/* Bits 127:96 of SRD.  Set DataFormat = 32 bit */
.set Srd127_96, 0x0020000
.set BufferOOB, 0x80000000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr vgprOffset0I vgprOffsetL vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideAL], v[\vgprOffsetL] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffset0I], v[\vgprTmp+0] // accumulate K lower
_v_add_u32 v[\vgprAddr+0], 0x2, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffsetL vgprOffset1J vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate K lower
_v_add_u32 v[\vgprAddr+0], 0x2, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/******************************************/
/* Dynamic Scalar Divide: vQuotient=vDividend/vDivisor; vRemainder=vDividend%vDivisor; */
/******************************************/
.macro DYNAMIC_VECTOR_DIVIDE vQuotient vRemainder vDividend vDivisor vTmp0 vTmp1 sTmp
v_cvt_f32_u32 v[\vQuotient], v[\vDivisor]          // 
v_rcp_f32 v[\vQuotient], v[\vQuotient]             // 
v_mul_f32 v[\vQuotient], 0x4f800000, v[\vQuotient] // 
v_cvt_u32_f32 v[\vQuotient], v[\vQuotient]         // 
v_mul_lo_u32 v[\vRemainder], v[\vDivisor], v[\vQuotient] // 
v_mul_hi_u32 v[\vTmp0], v[\vDivisor], v[\vQuotient] // 
_v_sub_co_u32 v[\vTmp1], vcc, 0x0, v[\vRemainder]  // 
v_cmp_ne_i32 s[\sTmp:\sTmp+1], 0x0, v[\vTmp0]      // 
v_cndmask_b32 v[\vRemainder], v[\vTmp1], v[\vRemainder], s[\sTmp:\sTmp+1] // 
v_mul_hi_u32 v[\vRemainder], v[\vRemainder], v[\vQuotient] // 
_v_sub_co_u32 v[\vTmp0], vcc, v[\vQuotient], v[\vRemainder] // 
_v_add_co_u32 v[\vQuotient], vcc, v[\vQuotient], v[\vRemainder] // 
v_cndmask_b32 v[\vQuotient], v[\vQuotient], v[\vTmp0], s[\sTmp:\sTmp+1] // 
v_mul_hi_u32 v[\vQuotient], v[\vQuotient], v[\vDividend] // 
v_mul_lo_u32 v[\vRemainder], v[\vQuotient], v[\vDivisor] // 
_v_sub_co_u32 v[\vTmp0], vcc, v[\vDividend], v[\vRemainder] // 
v_cmp_ge_u32 s[\sTmp:\sTmp+1], v[\vDividend], v[\vRemainder] // 
_v_add_co_u32 v[\vRemainder], vcc, 0x1, v[\vQuotient] // 
_v_add_co_u32 v[\vTmp1], vcc, -1, v[\vQuotient]    // 
v_cmp_le_u32 vcc, v[\vDivisor], v[\vTmp0]          // 
s_and_b64 vcc, s[\sTmp:\sTmp+1], vcc               // 
v_cndmask_b32 v[\vQuotient], v[\vQuotient], v[\vRemainder], vcc // 
v_cndmask_b32 v[\vQuotient], v[\vTmp1], v[\vQuotient], s[\sTmp:\sTmp+1] // 
v_cmp_ne_i32 vcc, 0x0, v[\vDivisor]                // 
v_cndmask_b32 v[\vQuotient], -1, v[\vQuotient], vcc // final result
v_mul_lo_u32 v[\vRemainder], v[\vQuotient], v[\vDivisor] // 
_v_sub_co_u32 v[\vRemainder], vcc, v[\vDividend], v[\vRemainder] // final result
.endm



/******************************************/
/* Allocate Resources                     */
/******************************************/

s_mov_b32 m0, 0x3400                               // LDS clamp at 13312 bytes
v_mov_b32 v[vgprSerial], v0                        // thread serial id

/* Load Kernel Args */
s_load_dword s[sgprTensor2dSizeC+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0 // 
s_load_dword s[sgprTensor2dSizeC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x4 // 
s_load_dword s[sgprTensor2dSizeA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8 // 
s_load_dword s[sgprTensor2dSizeA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0xc // 
s_load_dword s[sgprTensor2dSizeB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x10 // 
s_load_dword s[sgprTensor2dSizeB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x14 // 
s_load_dword s[sgprAddressD], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x18 // 
s_load_dword s[sgprAddressD+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x1c // 
s_load_dword s[sgprAddressC], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x20 // 
s_load_dword s[sgprAddressC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x24 // 
s_load_dword s[sgprAddressA], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x28 // 
s_load_dword s[sgprAddressA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x2c // 
s_load_dword s[sgprAddressB], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x30 // 
s_load_dword s[sgprAddressB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x34 // 
s_load_dword s[sgprAlpha], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x38 // 
s_load_dword s[sgprBeta], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x3c // load beta
s_load_dword s[sgprBeta+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x3c // 
s_load_dword s[sgprStridesD+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40 // 
s_load_dword s[sgprStridesD+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x44 // 
s_load_dword s[sgprStridesC+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x48 // 
s_load_dword s[sgprStridesC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x4c // 
s_load_dword s[sgprStridesA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x50 // 
s_load_dword s[sgprStridesA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x54 // 
s_load_dword s[sgprStridesB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x58 // 
s_load_dword s[sgprStridesB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x5c // 
s_load_dword s[sgprSizesFree+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x60 // 
s_load_dword s[sgprSizesFree+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 // 
s_load_dword s[sgprSizesFree+2], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x68 // 
s_load_dword s[sgprSizesSum+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c // 
s_load_dword s[sgprOrigStaggerUIter], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x70 // 
s_load_dword s[sgprNumWorkGroups0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x74 // 
s_load_dword s[sgprNumWorkGroups1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x78 // 
s_load_dword s[sgprNumFullBlocks], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x84 // 
s_load_dword s[sgprWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x88 // 
s_load_dword s[sgprMagicNumberWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8c // 
s_waitcnt lgkmcnt(0)                               // wait for 144 bytes of kern args


/******************************************/
/* Local Read Addresses                   */
/******************************************/


/* local read addresses: tile assignments a */

/*lr0I = serial % SG0I*/
v_lshrrev_b32 v0, 5, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 32
v_and_b32 v1, 31, v[vgprSerial]                    // vectorStaticDiv: v1 = v[vgprSerial] % 32


/* local read addresses: tile assignments b */

/*lr1J = (serial / SG1J) % SG1J*/
v_lshrrev_b32 v2, 6, v[vgprSerial]                 // vectorStaticDiv: v2 = v[vgprSerial] / 64
v_and_b32 v3, 63, v[vgprSerial]                    // vectorStaticDiv: v3 = v[vgprSerial] % 64


/* local read addresses: final offsets a */

v_lshrrev_b32 v0, 8, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 256
v_and_b32 v2, 255, v[vgprSerial]                   // vectorStaticDiv: v2 = v[vgprSerial] % 256
s_mov_b32 s71, 0x40                                // MT0+PAD
v_mul_lo_u32 v0, s71, v0                           // sgid=sgid*(MT0+PAD)
_v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v1, 0x1 // o = (lroA*VW+sgid*MT0)*bpe


/* local read addresses: final offsets b */

v_lshrrev_b32 v0, 6, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 64
v_and_b32 v1, 63, v[vgprSerial]                    // vectorStaticDiv: v1 = v[vgprSerial] % 64
s_mov_b32 s71, 0x40                                // MT1+PAD
v_mul_lo_u32 v0, s71, v0                           // sgid=sgid*(MT1+PAD)
_v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v3, 0x1 // o = (lroB*VW+sgid*MT1)*bpe


/* local read addresses: declare addresses a */

/* N/A */


/* local read addresses: declare addresses b */

_v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x400, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)



/******************************************/
/* Begin setupNewTile                     */
/******************************************/


/* global read addresses: work-group */

/* graWorkGroup mapping */


/* global read addresses: tile offset assignment a */

/* LVCA = 32 */
/* v0 = (local)groA-tile = serial%LVCA (note (wgA*MTA) will be added to SRD) */
/* v1 = groA-unroll = serial/LVCA */
v_lshrrev_b32 v1, 5, v[vgprSerial]                 // vectorStaticDiv: v1 = v[vgprSerial] / 32
v_and_b32 v0, 31, v[vgprSerial]                    // vectorStaticDiv: v0 = v[vgprSerial] % 32
/* gro-tile *= glvw */
v_lshlrev_b32 v0, 1, v0                            // staticMultiply: v0 = v0 * 2


/* global read addresses: tile offset assignment b */

/* LVCB = 4 */
/* v2 = (local)groB-tile = serial/LVCB (note (wgB*MTB) will be added to SRD) */
/* v3 = groB-unroll = serial%LVCB */
v_lshrrev_b32 v2, 2, v[vgprSerial]                 // vectorStaticDiv: v2 = v[vgprSerial] / 4
v_and_b32 v3, 3, v[vgprSerial]                     // vectorStaticDiv: v3 = v[vgprSerial] % 4
/* gro-unroll *= glvw */
v_lshlrev_b32 v3, 1, v3                            // staticMultiply: v3 = v3 * 2


/* global read addresses: unroll assignment a */

/* v1 */


/* global read addresses: unroll assignment b */

/* v3 */


/* global read addresses: other free assignments */

/* s[sgprWorkGroup2] */


/* global read addresses: tile offsets a */

v_mov_b32 v4, v0                                   // groA0I_0


/* global read addresses: tile offsets b */

v_mov_b32 v5, v2                                   // groB1J_0
_v_add_co_u32 v6, vcc, 64, v5                      // groB1J_1 += LSPB
_v_add_co_u32 v7, vcc, 64, v6                      // groB1J_2 += LSPB
_v_add_co_u32 v8, vcc, 64, v7                      // groB1J_3 += LSPB


/* global read addresses: unroll offsets a */

v_mov_b32 v9, v1                                   // groAL_0


/* global read addresses: unroll offsets b */

v_mov_b32 v10, v3                                  // groBL_0


/* global read addresses: shift a */

s_mul_i32 s71, s[sgprWorkGroup0], 64               // WorkGroup[01] * MT
s_sub_u32 s71, s[sgprSizeA0I], s71                 // edge = Size0I - WG*MT
s_sub_u32 s71, s71, 2                              // edge -= margin
v_mov_b32 v11, s71                                 // edge vgpr = Size0I-2
_v_add_co_u32 v12, vcc, v11, 2                     // add srdShiftLift
_v_add_co_u32 v13, vcc, v4, 2                      // 
v_cmp_lt_u32 s[72:73], v13, v12                    // offset < edge
v_cndmask_b32 v4, v11, v4, s[72:73]                // offset = (offset < edge) ? offset : edge


/* global read addresses: final offsets a */

GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  4,  9, 11 // gROA_0_0_0_0


/* global read addresses: final offsets b */

GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0, 10,  5, 11 // gROB_0_0_0_0
GLOBAL_OFFSET_B vgprGlobalReadOffsetB+1, 10,  6, 11 // gROB_0_0_1_0
GLOBAL_OFFSET_B vgprGlobalReadOffsetB+2, 10,  7, 11 // gROB_0_0_2_0
GLOBAL_OFFSET_B vgprGlobalReadOffsetB+3, 10,  8, 11 // gROB_0_0_3_0


/* global read addresses: addresses a */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s75, s[sgprWorkGroup0], 64            // WorkGroup[01] * MT
s_mul_i32 s74, s[sgprWorkGroup0], 64               // WorkGroup[01] * MT
s_sub_u32 s[sgprShadowLimitA+0], s[sgprTensor2dSizeA], s74 // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s[sgprTensor2dSizeA+1], s75 // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s73, s[sgprStrideAK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s72, s[sgprStrideAK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s74, s74, s72                            // accum wg term to tilestart
s_addc_u32 s75, s75, s73                           // accum wg term to tilestart
s_lshl_b64 s[74:75], s[74:75], 1                   // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s74    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s75   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdA+0], s[sgprSrdA+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: addresses b */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s75, s[sgprWorkGroup1], 256           // WorkGroup[01] * MT
s_mul_i32 s74, s[sgprWorkGroup1], 256              // WorkGroup[01] * MT
s_mul_hi_u32 s75, s74, s[sgprStrideB1J]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s74, s74, s[sgprStrideB1J]               // tlu=0, scaled tile-offset by stride
s_sub_u32 s[sgprShadowLimitB+0], s[sgprTensor2dSizeB], s74 // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s[sgprTensor2dSizeB+1], s75 // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s73, s[sgprStrideBK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s72, s[sgprStrideBK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s74, s74, s72                            // accum wg term to tilestart
s_addc_u32 s75, s75, s73                           // accum wg term to tilestart
s_lshl_b64 s[74:75], s[74:75], 1                   // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s74    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s75   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdB+0], s[sgprSrdB+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: increments a */

s_mul_i32 s[sgprGlobalReadIncsA+0], 0x10, s[sgprStrideAL] // incrAL = strideL*8*bpe (unrollIdx)


/* global read addresses: increments b */

s_mov_b32 s[sgprGlobalReadIncsB+0], 0x10           // incr = 8*bpe


/******************************************/
/* Local Write Addresses                  */
/******************************************/

/* lwaTileAssignmentA = v0 */

/* lwaTileAssignmentB = v2 */

/* lwaUnrollAssignmentA = v1 */

/* lwaUnrollAssignmentB = v3 */


/* local write addresses: first offset a */

v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x40, v1     // lwAL**(MTA + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x1 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe


/* local write addresses: first offset b */

v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x100, v3    // lwBL**(MTB + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrB], v2, v[vgprLocalWriteAddrB], 0x1 // lwFOB = (lwBB + lwBL*(MT1J+PAD))*bpe
_v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x400, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=512*2







/* declare loop num iterations */


s_lshr_b32 s[sgprLoopCounters+0], s[sgprSizesSum+0], 3 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 8
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounters+0] // copy loop counter

s_and_b32 s[sgprStaggerUIter], s[sgprOrigStaggerUIter], s[sgprWorkGroup0] // Compute actual stagger start for this tile
s_lshl_b32 s[sgprStaggerUIter], s[sgprStaggerUIter], 4 // shift by StaggerUStride

/* SRDs += (StaggerUIter) * GlobalReadIncsA+0 */
s_mul_i32 s71, s[sgprStaggerUIter], s[sgprGlobalReadIncsA+0] //  stagger byte offset
s_mul_hi_i32 s[sgprWrapUA+1], s[sgprLoopCounters+0], s[sgprGlobalReadIncsA+0] // Number of bytes accessed by the unroll loop
s_mul_i32 s[sgprWrapUA+0], s[sgprLoopCounters+0], s[sgprGlobalReadIncsA+0] // Number of bytes accessed by the unroll loop
s_sub_u32 s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0], s[sgprWrapUA+0] // remove one iteration
s_subb_u32 s[sgprWrapUA+1], s[sgprWrapUA+1], 0     // remove one iteration
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s71       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s71 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* SRDs += (StaggerUIter) * GlobalReadIncsB+0 */
s_mul_i32 s71, s[sgprStaggerUIter], s[sgprGlobalReadIncsB+0] //  stagger byte offset
s_mul_hi_i32 s[sgprWrapUB+1], s[sgprLoopCounters+0], s[sgprGlobalReadIncsB+0] // Number of bytes accessed by the unroll loop
s_mul_i32 s[sgprWrapUB+0], s[sgprLoopCounters+0], s[sgprGlobalReadIncsB+0] // Number of bytes accessed by the unroll loop
s_sub_u32 s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0], s[sgprWrapUB+0] // remove one iteration
s_subb_u32 s[sgprWrapUB+1], s[sgprWrapUB+1], 0     // remove one iteration
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s71       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s71 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
s_add_u32 s[sgprStaggerUIter], s[sgprStaggerUIter], 2 // Subtract (PGR-1); StaggerUIter now contains target iteration to wrap

/* local read addresses: init pointers a */


/* localReadInitPointers */

/* local read addresses: init pointers b */


/* localReadInitPointers */


/* prefetch: global -> local */

s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIter0I == 0
s_cbranch_scc1 ShadowInitStart_8                   // skip to ShadowInitStart iter b/c numIter==0

buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0

buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_3_0


/* global read inc A loopL */
s_add_u32 s74, s[sgprLoopCounters+0], 1            // remove pf(1)
s_cmp_eq_u32 s[sgprStaggerUIter], s74              // Is this wrapIter? (pf)
s_cselect_b32 s72, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s73, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s72       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s73      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s72 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s73 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s74, s[sgprLoopCounters+0], 1            // remove pf(1)
s_cmp_eq_u32 s[sgprStaggerUIter], s74              // Is this wrapIter? (pf)
s_cselect_b32 s72, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s73, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s72       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s73      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s72 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s73 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32


/******************************************/
/* End setupNewTile                       */
/******************************************/

ShadowInitStart_8: // 

s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000                // 
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000                // 
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in post-loop SRD


s_mul_i32 s74, 0x100, s[sgprWorkGroup1]            // <- wg1*MT1
s_mul_hi_u32 s73, s74, s[sgprStrideC1J]            // CScale s74 by Stride
s_mul_i32 s72, s74, s[sgprStrideC1J]               // CScale s74 by Stride
s_lshl_b64 s[72:73], s[72:73], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s72        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s73       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s72        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s73       // add hi to SRD

s_mul_hi_u32 s73, s[sgprWorkGroup2], s[sgprStrideCK] // CScale s[sgprWorkGroup2] by Stride
s_mul_i32 s72, s[sgprWorkGroup2], s[sgprStrideCK]  // CScale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[72:73], s[72:73], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s72        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s73       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s72        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s73       // add hi to SRD


v_accvgpr_write acc0, 0x0                          // init Acc vgprs
v_accvgpr_write acc1, 0x0                          // init Acc vgprs
v_accvgpr_write acc2, 0x0                          // init Acc vgprs
v_accvgpr_write acc3, 0x0                          // init Acc vgprs
v_accvgpr_write acc4, 0x0                          // init Acc vgprs
v_accvgpr_write acc5, 0x0                          // init Acc vgprs
v_accvgpr_write acc6, 0x0                          // init Acc vgprs
v_accvgpr_write acc7, 0x0                          // init Acc vgprs
v_accvgpr_write acc8, 0x0                          // init Acc vgprs
v_accvgpr_write acc9, 0x0                          // init Acc vgprs
v_accvgpr_write acc10, 0x0                         // init Acc vgprs
v_accvgpr_write acc11, 0x0                         // init Acc vgprs
v_accvgpr_write acc12, 0x0                         // init Acc vgprs
v_accvgpr_write acc13, 0x0                         // init Acc vgprs
v_accvgpr_write acc14, 0x0                         // init Acc vgprs
v_accvgpr_write acc15, 0x0                         // init Acc vgprs
v_accvgpr_write acc16, 0x0                         // init Acc vgprs
v_accvgpr_write acc17, 0x0                         // init Acc vgprs
v_accvgpr_write acc18, 0x0                         // init Acc vgprs
v_accvgpr_write acc19, 0x0                         // init Acc vgprs
v_accvgpr_write acc20, 0x0                         // init Acc vgprs
v_accvgpr_write acc21, 0x0                         // init Acc vgprs
v_accvgpr_write acc22, 0x0                         // init Acc vgprs
v_accvgpr_write acc23, 0x0                         // init Acc vgprs
v_accvgpr_write acc24, 0x0                         // init Acc vgprs
v_accvgpr_write acc25, 0x0                         // init Acc vgprs
v_accvgpr_write acc26, 0x0                         // init Acc vgprs
v_accvgpr_write acc27, 0x0                         // init Acc vgprs
v_accvgpr_write acc28, 0x0                         // init Acc vgprs
v_accvgpr_write acc29, 0x0                         // init Acc vgprs
v_accvgpr_write acc30, 0x0                         // init Acc vgprs
v_accvgpr_write acc31, 0x0                         // init Acc vgprs
v_accvgpr_write acc32, 0x0                         // init Acc vgprs
v_accvgpr_write acc33, 0x0                         // init Acc vgprs
v_accvgpr_write acc34, 0x0                         // init Acc vgprs
v_accvgpr_write acc35, 0x0                         // init Acc vgprs
v_accvgpr_write acc36, 0x0                         // init Acc vgprs
v_accvgpr_write acc37, 0x0                         // init Acc vgprs
v_accvgpr_write acc38, 0x0                         // init Acc vgprs
v_accvgpr_write acc39, 0x0                         // init Acc vgprs
v_accvgpr_write acc40, 0x0                         // init Acc vgprs
v_accvgpr_write acc41, 0x0                         // init Acc vgprs
v_accvgpr_write acc42, 0x0                         // init Acc vgprs
v_accvgpr_write acc43, 0x0                         // init Acc vgprs
v_accvgpr_write acc44, 0x0                         // init Acc vgprs
v_accvgpr_write acc45, 0x0                         // init Acc vgprs
v_accvgpr_write acc46, 0x0                         // init Acc vgprs
v_accvgpr_write acc47, 0x0                         // init Acc vgprs
v_accvgpr_write acc48, 0x0                         // init Acc vgprs
v_accvgpr_write acc49, 0x0                         // init Acc vgprs
v_accvgpr_write acc50, 0x0                         // init Acc vgprs
v_accvgpr_write acc51, 0x0                         // init Acc vgprs
v_accvgpr_write acc52, 0x0                         // init Acc vgprs
v_accvgpr_write acc53, 0x0                         // init Acc vgprs
v_accvgpr_write acc54, 0x0                         // init Acc vgprs
v_accvgpr_write acc55, 0x0                         // init Acc vgprs
v_accvgpr_write acc56, 0x0                         // init Acc vgprs
v_accvgpr_write acc57, 0x0                         // init Acc vgprs
v_accvgpr_write acc58, 0x0                         // init Acc vgprs
v_accvgpr_write acc59, 0x0                         // init Acc vgprs
v_accvgpr_write acc60, 0x0                         // init Acc vgprs
v_accvgpr_write acc61, 0x0                         // init Acc vgprs
v_accvgpr_write acc62, 0x0                         // init Acc vgprs
v_accvgpr_write acc63, 0x0                         // init Acc vgprs

s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIter0I == 0
s_cbranch_scc1 label_0004                          // after InitC, skip to end of prefetch last iter b/c numIter==0

s_waitcnt vmcnt(0)                                 // 8wait for global read


/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0


/* local write b */

ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:0 // lwoB_0_0_0_0 = (0 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:512 // lwoB_0_1_0_0 = (1 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 512
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:128 // lwoB_0_0_1_0 = (0 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 128
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:640 // lwoB_0_1_1_0 = (1 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 640
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:256 // lwoB_0_0_2_0 = (0 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 256
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:768 // lwoB_0_1_2_0 = (1 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 768
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:384 // lwoB_0_0_3_0 = (0 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 384
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:896 // lwoB_0_1_3_0 = (1 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 896


/* local write swap a */



/* local write swap b */




s_waitcnt lgkmcnt(0)                               // 0prefetch wait for local write

s_barrier //


/* local read prefetch a */

ds_read_u16 v84, v[vgprLocalReadAddrA] offset:0    // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:64   // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack


/* local read prefetch b */

ds_read_u16 v84, v[vgprLocalReadAddrB] offset:0    // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack


/* local read inc a */

/* N/A, lro->128 */


/* local read inc b */

/* N/A, lro->512 */



/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/

openLoopL_9:
s_cmp_le_u32 s[sgprLoopCounters+0], 0x1            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0002                          // don't enter LoopL
label_0001:


/******************************************/
/* Unroll Loop 1/2 - Begin                */
/******************************************/

label_0010: // LoopCopy1 





/* iter 0 */


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:256  // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:320  // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_3_0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:448 // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=512 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=512 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X1_I0+0], v84, v85            // pack

/* local read increment a */
/* N/A, lro->256 */

/* local read increment b */
/* N/A, lro->1024 */
s_waitcnt lgkmcnt(6)                               // wait for prior local read old=1 new=6
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]


/* iter 1 */


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:512  // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:576  // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0

/* global read inc A loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s72, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s73, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s72       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s73      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s72 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s73 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:704 // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:2048 // L -> Reg lro=1024 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:2560 // L -> Reg lro=1024 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack

/* local read increment a */
/* N/A, lro->384 */

/* local read increment b */
/* N/A, lro->1536 */
s_waitcnt lgkmcnt(6)                               // wait for prior local read old=1 new=6
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], a[32:63]


/* iter 2 (localWrite + swap local pointers iteration) */


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:768  // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:832  // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0

/* global read inc B loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s72, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s73, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s72       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s73      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s72 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s73 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:960 // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:3072 // L -> Reg lro=1536 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:3584 // L -> Reg lro=1536 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X1_I0+0], v84, v85            // pack
/* sched write - iter 2 writesPerItem=1 */
s_waitcnt vmcnt(4)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:8192 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 8192
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(3)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:8192 // lwoB_0_0_0_0 = (0 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 8192
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:8704 // lwoB_0_1_0_0 = (1 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 8704
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(2)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:8320 // lwoB_0_0_1_0 = (0 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 8320
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:8832 // lwoB_0_1_1_0 = (1 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 8832
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:8448 // lwoB_0_0_2_0 = (0 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 8448
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:8960 // lwoB_0_1_2_0 = (1 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 8960
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:8576 // lwoB_0_0_3_0 = (0 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 8576
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:9088 // lwoB_0_1_3_0 = (1 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 9088

/* local write swap offsets a */

/* local write swap offsets b */

/* local read swap offsets a */

/* local read swap internal offset -> 8192 */

/* local read swap offsets b */

/* local read swap internal offset -> 8192 */

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(15)                              // wait for prior local read old=10 new=15
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]




/* iter 3 (last) */

s_waitcnt lgkmcnt(0)                               // 3wait for local write

s_barrier //


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8192 // L -> Reg lro=0 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:8320 // L -> Reg lro=0 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8256 // L -> Reg lro=0 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:8384 // L -> Reg lro=0 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:8192 // L -> Reg lro=0 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:8704 // L -> Reg lro=0 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack

/* local read inc a */
/* N/A, lro->128 */

/* local read inc b */
/* N/A, lro->512 */
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], a[32:63]


/******************************************/
/* Unrolled Loop - End 1/2                */
/******************************************/


/* closeLoop loopL finalLoop=0 tailLoop=0 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x1            // counterL==0
s_cbranch_scc1 label_0003                          // exit LoopL


/******************************************/
/* Unroll Loop 2/2 - Begin                */
/******************************************/

label_0011: // LoopCopy2 





/* iter 0 */


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8448 // L -> Reg lro=128 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:8576 // L -> Reg lro=128 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8512 // L -> Reg lro=128 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_3_0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:8640 // L -> Reg lro=128 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:9216 // L -> Reg lro=512 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:9728 // L -> Reg lro=512 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X1_I0+0], v84, v85            // pack

/* local read increment a */
/* N/A, lro->256 */

/* local read increment b */
/* N/A, lro->1024 */
s_waitcnt lgkmcnt(6)                               // wait for prior local read old=1 new=6
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]


/* iter 1 */


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8704 // L -> Reg lro=256 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:8832 // L -> Reg lro=256 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8768 // L -> Reg lro=256 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0

/* global read inc A loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s72, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s73, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s72       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s73      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s72 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s73 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:8896 // L -> Reg lro=256 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:10240 // L -> Reg lro=1024 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:10752 // L -> Reg lro=1024 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack

/* local read increment a */
/* N/A, lro->384 */

/* local read increment b */
/* N/A, lro->1536 */
s_waitcnt lgkmcnt(6)                               // wait for prior local read old=1 new=6
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], a[32:63]


/* iter 2 (localWrite + swap local pointers iteration) */


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:8960 // L -> Reg lro=384 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:9088 // L -> Reg lro=384 swapByteOffset=8192 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:9024 // L -> Reg lro=384 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0

/* global read inc B loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s72, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s73, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s72       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s73      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s72 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s73 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:9152 // L -> Reg lro=384 swapByteOffset=8192 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:11264 // L -> Reg lro=1536 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:11776 // L -> Reg lro=1536 swapByteOffset=8192 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X1_I0+0], v84, v85            // pack
/* sched write - iter 2 writesPerItem=1 */
s_waitcnt vmcnt(4)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(3)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:0 // lwoB_0_0_0_0 = (0 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:512 // lwoB_0_1_0_0 = (1 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 512
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(2)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:128 // lwoB_0_0_1_0 = (0 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 128
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:640 // lwoB_0_1_1_0 = (1 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 640
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:256 // lwoB_0_0_2_0 = (0 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 256
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:768 // lwoB_0_1_2_0 = (1 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 768
/* sched write - iter 2 writesPerItem=2 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:384 // lwoB_0_0_3_0 = (0 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 384
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:896 // lwoB_0_1_3_0 = (1 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 896

/* local write swap offsets a */

/* local write swap offsets b */

/* local read swap offsets a */

/* local read swap internal offset -> 0 */

/* local read swap offsets b */

/* local read swap internal offset -> 0 */

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(15)                              // wait for prior local read old=10 new=15
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]




/* iter 3 (last) */

s_waitcnt lgkmcnt(0)                               // 3wait for local write

s_barrier //


/* local read a */
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:0    // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:64   // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack

/* local read b */
ds_read_u16 v84, v[vgprLocalReadAddrB] offset:0    // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack

/* local read inc a */
/* N/A, lro->128 */

/* local read inc b */
/* N/A, lro->512 */
s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], a[32:63]


/******************************************/
/* Unrolled Loop - End 2/2 (final)        */
/******************************************/


/* closeLoop loopL finalLoop=1 tailLoop=0 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x1            // counterL==0
s_cbranch_scc0 label_0001                          // restart LoopL
s_branch label_0002                                // exit unroll loopL (and skip oddexit)
label_0003: // unroll loop odditer exit

/* Select high bank of LDS */
v_xor_b32 v[vgprLocalReadAddrA], 0x2000, v[vgprLocalReadAddrA] // swap Red Blk
v_xor_b32 v[vgprLocalReadAddrB], 0x2000, v[vgprLocalReadAddrB] // swap Red Blk
label_0002:




/* iter 0 */


/* local read a */

ds_read_u16 v84, v[vgprLocalReadAddrA] offset:256  // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:320  // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:448 // L -> Reg lro=128 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+1], v84, v85            // pack


/* local read b */

ds_read_u16 v84, v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=512 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=512 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X1_I0+0], v84, v85            // pack


/* local read inc a */

/* N/A, lro->256 */


/* local read inc b */

/* N/A, lro->1024 */

s_waitcnt lgkmcnt(1)                               // 7wait for local read

s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]


/* iter 1 */


/* local read a */

ds_read_u16 v84, v[vgprLocalReadAddrA] offset:512  // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:576  // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:704 // L -> Reg lro=256 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack


/* local read b */

ds_read_u16 v84, v[vgprLocalReadAddrB] offset:2048 // L -> Reg lro=1024 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:2560 // L -> Reg lro=1024 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack


/* local read inc a */

/* N/A, lro->384 */


/* local read inc b */

/* N/A, lro->1536 */

s_waitcnt lgkmcnt(1)                               // 7wait for local read

s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], a[32:63]


/* iter 2 */


/* local read a */

ds_read_u16 v84, v[vgprLocalReadAddrA] offset:768  // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:832  // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:960 // L -> Reg lro=384 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X1_I0+1], v84, v85            // pack


/* local read b */

ds_read_u16 v84, v[vgprLocalReadAddrB] offset:3072 // L -> Reg lro=1536 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:3584 // L -> Reg lro=1536 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X1_I0+0], v84, v85            // pack


/* local read inc a */

/* N/A, lro->512 */


/* local read inc b */

/* N/A, lro->2048 */

s_waitcnt lgkmcnt(1)                               // 7wait for local read

s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]


/* iter 3 */

s_waitcnt lgkmcnt(0)                               // 7wait for local read

s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], a[32:63]

label_0004:


/******************************************/
/* Tail Loop                              */
/******************************************/


/* local write reset offsets a */



/* local write reset offsets b */



//numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_and_b32 s[sgprLoopCounters+0], 7, s[sgprSizesSum+0] // s[sgprLoopCounters+0] = s[sgprSizesSum+0] % 8
/* calculate number of remaining loops in terms of how many matrix instructions */
//numIterL = ((numIterL + MatrixInstL - 1) / MatrixInstL)
s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 1 // 
s_lshr_b32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 1 // s[sgprLoopCounters+0] = s[sgprLoopCounters+0] / 2
s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIterL == 0
s_cbranch_scc1 label_0006                          // skip to end of tail loop b/c numIter==0


/* remove stagger offsets for tail loop */

s_sub_i32 s71, 3, s[sgprStaggerUIter]              // 
s_mul_i32 s71, s71, s[sgprGlobalReadIncsA+0]       // start offset S in bytes
s_sub_u32 s71, s71, s[sgprWrapUA]                  // S - WrapU
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s71       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s71 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

s_sub_i32 s71, 3, s[sgprStaggerUIter]              // 
s_mul_i32 s71, s71, s[sgprGlobalReadIncsB+0]       // start offset S in bytes
s_sub_u32 s71, s71, s[sgprWrapUB]                  // S - WrapU
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s71       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s71 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32


/* global read a */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LA+0+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load packed 2X half buffer value


/* global read b */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LB+0+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load packed 2X half buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LB+1+0], v[vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load packed 2X half buffer value
/* g2l=2, load component 0 */
buffer_load_dword v[vgprG2LB+2+0], v[vgprGlobalReadOffsetB+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load packed 2X half buffer value
/* g2l=3, load component 0 */
buffer_load_dword v[vgprG2LB+3+0], v[vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load packed 2X half buffer value

s_waitcnt vmcnt(0)                                 // 2wait for global read

s_barrier //




/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0


/* local write b */

ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:0 // lwoB_0_0_0_0 = (0 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:512 // lwoB_0_1_0_0 = (1 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 512
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:128 // lwoB_0_0_1_0 = (0 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 128
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:640 // lwoB_0_1_1_0 = (1 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 640
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:256 // lwoB_0_0_2_0 = (0 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 256
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+2:vgprG2LB+2+0] offset:768 // lwoB_0_1_2_0 = (1 + 0*LSCB)*(MT1J+PAD) + (2*LSPB) = 768
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:384 // lwoB_0_0_3_0 = (0 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 384
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+3:vgprG2LB+3+0] offset:896 // lwoB_0_1_3_0 = (1 + 0*LSCB)*(MT1J+PAD) + (3*LSPB) = 896

s_waitcnt lgkmcnt(0)                               // 5wait for local write

s_barrier //


/* local read reset offsets a */


/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrA], 0x1fff, v[vgprLocalReadAddrA] // reset Red,Blk -> Red


/* local read reset offsets b */


/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrB], 0x1fff, v[vgprLocalReadAddrB] // reset Red,Blk -> Red


/* local read init pointers a */


/* localReadInitPointers */


/* local read init pointers b */


/* localReadInitPointers */


/* tail loop: macs */

s_cmp_le_u32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0006                          // don't enter LoopL
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
label_0005:


/* local read a */

ds_read_u16 v84, v[vgprLocalReadAddrA] offset:0    // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+0], v84, v85            // pack
ds_read_u16 v84, v[vgprLocalReadAddrA] offset:64   // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrA] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuA_X0_I0+1], v84, v85            // pack


/* local read b */

ds_read_u16 v84, v[vgprLocalReadAddrB] offset:0    // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v85, v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(0)                               // 
v_or_b32 v[vgprValuB_X0_I0+0], v84, v85            // pack


/* local read inc a */

s_mov_b32 s71, 0x100                               // inc
_v_add_co_u32 v[vgprLocalReadAddrA], vcc, s71, v[vgprLocalReadAddrA] // lrA += 256 (LSU*(MT+PAD)*bpe)


/* local read inc b */

s_mov_b32 s71, 0x400                               // inc
_v_add_co_u32 v[vgprLocalReadAddrB], vcc, s71, v[vgprLocalReadAddrB] // lrB += 1024 (LSU*(MT+PAD)*bpe)

s_waitcnt lgkmcnt(0)                               // 4wait for local read

s_nop 2
v_mfma_f32_32x32x2bf16 a[0:31], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:31]
v_mfma_f32_32x32x2bf16 a[32:63], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], a[32:63]


/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL (toilLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x0            // counterL==0
s_cbranch_scc0 label_0005                          // restart LoopL
label_0006:

Summation_End_13:
/* endSummation: add vgpr 64...82 to pool */
s_nop 16

/* Mapping of Acc register -> C Vgpr register */
v_accvgpr_read_b32 v[vgprValuC+0], acc0            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+1], acc1            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+2], acc2            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+3], acc3            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+4], acc4            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+5], acc5            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+6], acc6            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+7], acc7            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+8], acc8            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+9], acc9            // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+10], acc10          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+11], acc11          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+12], acc12          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+13], acc13          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+14], acc14          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+15], acc15          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+16], acc32          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+17], acc33          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+18], acc34          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+19], acc35          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+20], acc36          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+21], acc37          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+22], acc38          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+23], acc39          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+24], acc40          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+25], acc41          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+26], acc42          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+27], acc43          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+28], acc44          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+29], acc45          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+30], acc46          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+31], acc47          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+32], acc16          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+33], acc17          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+34], acc18          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+35], acc19          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+36], acc20          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+37], acc21          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+38], acc22          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+39], acc23          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+40], acc24          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+41], acc25          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+42], acc26          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+43], acc27          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+44], acc28          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+45], acc29          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+46], acc30          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+47], acc31          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+48], acc48          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+49], acc49          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+50], acc50          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+51], acc51          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+52], acc52          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+53], acc53          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+54], acc54          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+55], acc55          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+56], acc56          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+57], acc57          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+58], acc58          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+59], acc59          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+60], acc60          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+61], acc61          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+62], acc62          // copy areg to vreg
v_accvgpr_read_b32 v[vgprValuC+63], acc63          // copy areg to vreg


/* shift vector components d0 */

v_mov_b32 v66, s[sgprWorkGroup0]                   // 
v_mul_i32_i24 v66, -0x40, v66                      // wg*MT
_v_add_co_u32 v66, vcc, s[sgprSizesFree+0], v66    // wgMT = Size - wg*MT
v_mov_b32 v64, 0x40                                // MT
v_cmp_lt_u32 s[56:57], v66, v64                    // wgMT < MT
v_cndmask_b32 v66, v64, v66, s[56:57]              // wgMT = (wgMT < MT) ? wgMT : MT
v_lshrrev_b32 v68, 1, v66                          // vectorStaticDiv: v68 = v66 / 2
v_and_b32 v69, 1, v66                              // vectorStaticDiv: v69 = v66 % 2
v_lshrrev_b32 v70, 5, v68                          // vectorStaticDiv: v70 = v68 / 32
v_and_b32 v71, 31, v68                             // vectorStaticDiv: v71 = v68 % 32
v_and_b32 v72, 31, v[vgprSerial]                   // vectorStaticDiv: v72 = v[vgprSerial] % 32
v_lshrrev_b32 v73, 6, v66                          // vectorStaticDiv: v73 = v66 / 64
v_and_b32 v74, 1, v66                              // vectorStaticDiv: v74 = v66 % 2
v_mov_b32 v75, v74                                 // duplicate
v_lshrrev_b32 v74, 1, v75                          // vectorStaticDiv: v74 = v75 / 2
_v_add_co_u32 v74, vcc, v73, v74                   // vId = 2 components
v_cmp_eq_u32 s[56:57], v72, v71                    // mask
v_mov_b32 v64, s56                                 // 
v_mov_b32 v65, s57                                 // 
v_cmp_eq_u32 vcc, v69, 0x1                         // wgMT%VW == 1
s_cbranch_vccnz label_0014                         // shift d0 r=1
s_branch label_0016                                // no shifting

/******************************************/
/* shift d0 r=1                           */
/******************************************/
label_0014:
v_cmp_eq_u32 vcc, v74, 0x0                         // wgMT/(SG*VW) == 0
s_cbranch_vccnz label_0015                         // shift d0, r=1, v=0

/* shift d0 r=1 v=0 */
label_0015:
v_cmpx_eq_u32 s[56:57], v72, v71                   // serial % SG == (wgMT/VECTOR_WIDTH)%SG
// src=1, dst=0
v_mov_b32 v0, v1                                   // rC[0+0*VW+0*TT0I] = rC[1+0*VW+0*TT0I]
// src=3, dst=2
v_mov_b32 v2, v3                                   // rC[0+0*VW+1*TT0I] = rC[1+0*VW+1*TT0I]
// src=5, dst=4
v_mov_b32 v4, v5                                   // rC[0+0*VW+2*TT0I] = rC[1+0*VW+2*TT0I]
// src=7, dst=6
v_mov_b32 v6, v7                                   // rC[0+0*VW+3*TT0I] = rC[1+0*VW+3*TT0I]
// src=9, dst=8
v_mov_b32 v8, v9                                   // rC[0+0*VW+4*TT0I] = rC[1+0*VW+4*TT0I]
// src=11, dst=10
v_mov_b32 v10, v11                                 // rC[0+0*VW+5*TT0I] = rC[1+0*VW+5*TT0I]
// src=13, dst=12
v_mov_b32 v12, v13                                 // rC[0+0*VW+6*TT0I] = rC[1+0*VW+6*TT0I]
// src=15, dst=14
v_mov_b32 v14, v15                                 // rC[0+0*VW+7*TT0I] = rC[1+0*VW+7*TT0I]
// src=17, dst=16
v_mov_b32 v16, v17                                 // rC[0+0*VW+8*TT0I] = rC[1+0*VW+8*TT0I]
// src=19, dst=18
v_mov_b32 v18, v19                                 // rC[0+0*VW+9*TT0I] = rC[1+0*VW+9*TT0I]
// src=21, dst=20
v_mov_b32 v20, v21                                 // rC[0+0*VW+10*TT0I] = rC[1+0*VW+10*TT0I]
// src=23, dst=22
v_mov_b32 v22, v23                                 // rC[0+0*VW+11*TT0I] = rC[1+0*VW+11*TT0I]
// src=25, dst=24
v_mov_b32 v24, v25                                 // rC[0+0*VW+12*TT0I] = rC[1+0*VW+12*TT0I]
// src=27, dst=26
v_mov_b32 v26, v27                                 // rC[0+0*VW+13*TT0I] = rC[1+0*VW+13*TT0I]
// src=29, dst=28
v_mov_b32 v28, v29                                 // rC[0+0*VW+14*TT0I] = rC[1+0*VW+14*TT0I]
// src=31, dst=30
v_mov_b32 v30, v31                                 // rC[0+0*VW+15*TT0I] = rC[1+0*VW+15*TT0I]
// src=33, dst=32
v_mov_b32 v32, v33                                 // rC[0+0*VW+16*TT0I] = rC[1+0*VW+16*TT0I]
// src=35, dst=34
v_mov_b32 v34, v35                                 // rC[0+0*VW+17*TT0I] = rC[1+0*VW+17*TT0I]
// src=37, dst=36
v_mov_b32 v36, v37                                 // rC[0+0*VW+18*TT0I] = rC[1+0*VW+18*TT0I]
// src=39, dst=38
v_mov_b32 v38, v39                                 // rC[0+0*VW+19*TT0I] = rC[1+0*VW+19*TT0I]
// src=41, dst=40
v_mov_b32 v40, v41                                 // rC[0+0*VW+20*TT0I] = rC[1+0*VW+20*TT0I]
// src=43, dst=42
v_mov_b32 v42, v43                                 // rC[0+0*VW+21*TT0I] = rC[1+0*VW+21*TT0I]
// src=45, dst=44
v_mov_b32 v44, v45                                 // rC[0+0*VW+22*TT0I] = rC[1+0*VW+22*TT0I]
// src=47, dst=46
v_mov_b32 v46, v47                                 // rC[0+0*VW+23*TT0I] = rC[1+0*VW+23*TT0I]
// src=49, dst=48
v_mov_b32 v48, v49                                 // rC[0+0*VW+24*TT0I] = rC[1+0*VW+24*TT0I]
// src=51, dst=50
v_mov_b32 v50, v51                                 // rC[0+0*VW+25*TT0I] = rC[1+0*VW+25*TT0I]
// src=53, dst=52
v_mov_b32 v52, v53                                 // rC[0+0*VW+26*TT0I] = rC[1+0*VW+26*TT0I]
// src=55, dst=54
v_mov_b32 v54, v55                                 // rC[0+0*VW+27*TT0I] = rC[1+0*VW+27*TT0I]
// src=57, dst=56
v_mov_b32 v56, v57                                 // rC[0+0*VW+28*TT0I] = rC[1+0*VW+28*TT0I]
// src=59, dst=58
v_mov_b32 v58, v59                                 // rC[0+0*VW+29*TT0I] = rC[1+0*VW+29*TT0I]
// src=61, dst=60
v_mov_b32 v60, v61                                 // rC[0+0*VW+30*TT0I] = rC[1+0*VW+30*TT0I]
// src=63, dst=62
v_mov_b32 v62, v63                                 // rC[0+0*VW+31*TT0I] = rC[1+0*VW+31*TT0I]
s_mov_b64 s[56:57], 0xFFFFFFFFFFFFFFFF             // to restore all threads active
s_or_saveexec_b64 vcc, s[56:57]                    // all threads active
s_branch label_0016                                // done shifting
label_0016: // end shift0



/* not-LocalSplitU: global write indices */

/* computeStoreVgprs */
v_lshrrev_b32 v70, 6, v[vgprSerial]                // vectorStaticDiv: v70 = v[vgprSerial] / 64
v_and_b32 v69, 63, v[vgprSerial]                   // vectorStaticDiv: v69 = v[vgprSerial] % 64
v_mul_lo_u32 v70, 0x2, v70                         // Col-id = tid1*MatrixInstN
v_mul_lo_u32 v70, 0x20, v70                        // col element offset for each block
v_mul_lo_u32 v71, v70, s[sgprStridesC+0]           // Col-block-offset = Col-id*Stride
v_and_b32 v65, 0x1f, v[vgprSerial]                 // colId-perBlock= vgprSerial%MatrixInstN
v_mul_lo_u32 v66, v65, s[sgprStridesC]             // 
v_add_u32 v71, v66, v71                            // rowStart VGPR
v_add_u32 v70, v65, v70                            // coord1 offset in MacroTile

v_lshrrev_b32 v67, 0x5, v69                        // vectorStaticDiv vgprTmp = tid0 / matrixInstM
v_lshlrev_b32 v69, 0x2, v67                        // tmpV3 = tmpV3 << 2 (4xMatrixInstN per block

s_mul_i32 s56, 0x40, s[sgprWorkGroup0]             // wgp0 * MT0
v_add_co_u32 v69, vcc, s56, v69                    // coord0 = (tid0 / matrixInstM)<<2 + wg0*MT0
s_mul_i32 s58, 0x100, s[sgprWorkGroup1]            // <- wg1*MT1
_v_add_co_u32 v70, vcc, s58, v70                   // coord1 = tid1*VW + wg1*MT1


/* not-LocalSplitU: global write */

s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 GW_Beta_24                          // Branch if Beta is not zero

s_and_b32 s56, 63, s[sgprSizeC0I]                  // s56 = s[sgprSizeC0I] % 64
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B0_E1_23                         // jump if edges required
s_and_b32 s56, 255, s[sgprSizeC1J]                 // s56 = s[sgprSizeC1J] % 256
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B0_E1_23                         // jump if edges required
GW_B0_E0_20:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=16 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw4); (0,1,0,0:vw4); (0,2,0,0:vw4); (0,3,0,0:vw4); (0,4,0,0:vw4); (0,5,0,0:vw4); (0,6,0,0:vw4); (0,7,0,0:vw4); (1,0,0,0:vw4); (1,1,0,0:vw4); (1,2,0,0:vw4); (1,3,0,0:vw4); (1,4,0,0:vw4); (1,5,0,0:vw4); (1,6,0,0:vw4); (1,7,0,0:vw4) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v66, v71, v69, 0x1                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
/* (d1,vc1,d0,vc0)=(1,0,7,0) */

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (0, 4, 0, 0), (0, 5, 0, 0), (0, 6, 0, 0), (0, 7, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (1, 4, 0, 0), (1, 5, 0, 0), (1, 6, 0, 0), (1, 7, 0, 0)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v67, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+0], 16, v[vgprValuC+0]   // convert C to bf16
v_and_or_b32 v0, v[vgprValuC+1], v67, v[vgprValuC+0] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+2], 16, v[vgprValuC+2]   // convert C to bf16
v_and_or_b32 v1, v[vgprValuC+3], v67, v[vgprValuC+2] // pack two bf16 to dword
buffer_store_dwordx2 v[0:1], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+4], 16, v[vgprValuC+4]   // convert C to bf16
v_and_or_b32 v4, v[vgprValuC+5], v67, v[vgprValuC+4] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+6], 16, v[vgprValuC+6]   // convert C to bf16
v_and_or_b32 v5, v[vgprValuC+7], v67, v[vgprValuC+6] // pack two bf16 to dword
buffer_store_dwordx2 v[4:5], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:16,  // store D
v_lshrrev_b32 v[vgprValuC+8], 16, v[vgprValuC+8]   // convert C to bf16
v_and_or_b32 v8, v[vgprValuC+9], v67, v[vgprValuC+8] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+10], 16, v[vgprValuC+10] // convert C to bf16
v_and_or_b32 v9, v[vgprValuC+11], v67, v[vgprValuC+10] // pack two bf16 to dword
buffer_store_dwordx2 v[8:9], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
v_lshrrev_b32 v[vgprValuC+12], 16, v[vgprValuC+12] // convert C to bf16
v_and_or_b32 v12, v[vgprValuC+13], v67, v[vgprValuC+12] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+14], 16, v[vgprValuC+14] // convert C to bf16
v_and_or_b32 v13, v[vgprValuC+15], v67, v[vgprValuC+14] // pack two bf16 to dword
buffer_store_dwordx2 v[12:13], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:48,  // store D
v_lshrrev_b32 v[vgprValuC+16], 16, v[vgprValuC+16] // convert C to bf16
v_and_or_b32 v16, v[vgprValuC+17], v67, v[vgprValuC+16] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+18], 16, v[vgprValuC+18] // convert C to bf16
v_and_or_b32 v17, v[vgprValuC+19], v67, v[vgprValuC+18] // pack two bf16 to dword
buffer_store_dwordx2 v[16:17], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
v_lshrrev_b32 v[vgprValuC+20], 16, v[vgprValuC+20] // convert C to bf16
v_and_or_b32 v20, v[vgprValuC+21], v67, v[vgprValuC+20] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+22], 16, v[vgprValuC+22] // convert C to bf16
v_and_or_b32 v21, v[vgprValuC+23], v67, v[vgprValuC+22] // pack two bf16 to dword
buffer_store_dwordx2 v[20:21], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:80,  // store D
v_lshrrev_b32 v[vgprValuC+24], 16, v[vgprValuC+24] // convert C to bf16
v_and_or_b32 v24, v[vgprValuC+25], v67, v[vgprValuC+24] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+26], 16, v[vgprValuC+26] // convert C to bf16
v_and_or_b32 v25, v[vgprValuC+27], v67, v[vgprValuC+26] // pack two bf16 to dword
buffer_store_dwordx2 v[24:25], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:96,  // store D
v_lshrrev_b32 v[vgprValuC+28], 16, v[vgprValuC+28] // convert C to bf16
v_and_or_b32 v28, v[vgprValuC+29], v67, v[vgprValuC+28] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+30], 16, v[vgprValuC+30] // convert C to bf16
v_and_or_b32 v29, v[vgprValuC+31], v67, v[vgprValuC+30] // pack two bf16 to dword
buffer_store_dwordx2 v[28:29], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:112,  // store D
v_lshrrev_b32 v[vgprValuC+32], 16, v[vgprValuC+32] // convert C to bf16
v_and_or_b32 v32, v[vgprValuC+33], v67, v[vgprValuC+32] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+34], 16, v[vgprValuC+34] // convert C to bf16
v_and_or_b32 v33, v[vgprValuC+35], v67, v[vgprValuC+34] // pack two bf16 to dword
s_mul_i32 s56, s[sgprStrideD1J], 64                // scale StrideD *= numRows(32) * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dwordx2 v[32:33], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+36], 16, v[vgprValuC+36] // convert C to bf16
v_and_or_b32 v36, v[vgprValuC+37], v67, v[vgprValuC+36] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+38], 16, v[vgprValuC+38] // convert C to bf16
v_and_or_b32 v37, v[vgprValuC+39], v67, v[vgprValuC+38] // pack two bf16 to dword
buffer_store_dwordx2 v[36:37], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:16,  // store D
v_lshrrev_b32 v[vgprValuC+40], 16, v[vgprValuC+40] // convert C to bf16
v_and_or_b32 v40, v[vgprValuC+41], v67, v[vgprValuC+40] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+42], 16, v[vgprValuC+42] // convert C to bf16
v_and_or_b32 v41, v[vgprValuC+43], v67, v[vgprValuC+42] // pack two bf16 to dword
buffer_store_dwordx2 v[40:41], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
v_lshrrev_b32 v[vgprValuC+44], 16, v[vgprValuC+44] // convert C to bf16
v_and_or_b32 v44, v[vgprValuC+45], v67, v[vgprValuC+44] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+46], 16, v[vgprValuC+46] // convert C to bf16
v_and_or_b32 v45, v[vgprValuC+47], v67, v[vgprValuC+46] // pack two bf16 to dword
buffer_store_dwordx2 v[44:45], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:48,  // store D
v_lshrrev_b32 v[vgprValuC+48], 16, v[vgprValuC+48] // convert C to bf16
v_and_or_b32 v48, v[vgprValuC+49], v67, v[vgprValuC+48] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+50], 16, v[vgprValuC+50] // convert C to bf16
v_and_or_b32 v49, v[vgprValuC+51], v67, v[vgprValuC+50] // pack two bf16 to dword
buffer_store_dwordx2 v[48:49], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
v_lshrrev_b32 v[vgprValuC+52], 16, v[vgprValuC+52] // convert C to bf16
v_and_or_b32 v52, v[vgprValuC+53], v67, v[vgprValuC+52] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+54], 16, v[vgprValuC+54] // convert C to bf16
v_and_or_b32 v53, v[vgprValuC+55], v67, v[vgprValuC+54] // pack two bf16 to dword
buffer_store_dwordx2 v[52:53], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:80,  // store D
v_lshrrev_b32 v[vgprValuC+56], 16, v[vgprValuC+56] // convert C to bf16
v_and_or_b32 v56, v[vgprValuC+57], v67, v[vgprValuC+56] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+58], 16, v[vgprValuC+58] // convert C to bf16
v_and_or_b32 v57, v[vgprValuC+59], v67, v[vgprValuC+58] // pack two bf16 to dword
buffer_store_dwordx2 v[56:57], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:96,  // store D
v_lshrrev_b32 v[vgprValuC+60], 16, v[vgprValuC+60] // convert C to bf16
v_and_or_b32 v60, v[vgprValuC+61], v67, v[vgprValuC+60] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+62], 16, v[vgprValuC+62] // convert C to bf16
v_and_or_b32 v61, v[vgprValuC+63], v67, v[vgprValuC+62] // pack two bf16 to dword
buffer_store_dwordx2 v[60:61], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:112,  // store D
s_branch label_0031                                // jump to end
GW_B0_E1_23:

/* allocate 30 sgpr. perBatch=6 perElement=2 elements=12 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,0,0,1:vw1); (0,0,0,2:vw1); (0,0,0,3:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,1,0,2:vw1); (0,1,0,3:vw1); (0,2,0,0:vw1); (0,2,0,1:vw1); (0,2,0,2:vw1); (0,2,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v69, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v69, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,1) */
_v_add_co_u32 v64, vcc, v69, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v67, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v67, -1, v67, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
_v_add_co_u32 v64, vcc, v69, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,3) */
_v_add_co_u32 v64, vcc, v69, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v74, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v64, vcc, v69, 8                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,1) */
_v_add_co_u32 v64, vcc, v69, 9                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v76, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,2) */
_v_add_co_u32 v64, vcc, v69, 10                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,3) */
_v_add_co_u32 v64, vcc, v69, 11                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v78, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
_v_add_co_u32 v64, vcc, v69, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,1) */
_v_add_co_u32 v64, vcc, v69, 17                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v80, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,2) */
_v_add_co_u32 v64, vcc, v69, 18                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,3) */
_v_add_co_u32 v64, vcc, v69, 19                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v84, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v84, -1, v84, s[84:85]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 0, 2), (0, 0, 0, 3), (0, 1, 0, 0), (0, 1, 0, 1), (0, 1, 0, 2), (0, 1, 0, 3), (0, 2, 0, 0), (0, 2, 0, 1), (0, 2, 0, 2), (0, 2, 0, 3)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+0], 16, v[vgprValuC+0]   // convert C to bf16
buffer_store_short v0, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+1], 16, v[vgprValuC+1]   // convert C to bf16
buffer_store_short v1, v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+2], 16, v[vgprValuC+2]   // convert C to bf16
buffer_store_short v2, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+3], 16, v[vgprValuC+3]   // convert C to bf16
buffer_store_short v3, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+4], 16, v[vgprValuC+4]   // convert C to bf16
buffer_store_short v4, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+5], 16, v[vgprValuC+5]   // convert C to bf16
buffer_store_short v5, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+6], 16, v[vgprValuC+6]   // convert C to bf16
buffer_store_short v6, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+7], 16, v[vgprValuC+7]   // convert C to bf16
buffer_store_short v7, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+8], 16, v[vgprValuC+8]   // convert C to bf16
buffer_store_short v8, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+9], 16, v[vgprValuC+9]   // convert C to bf16
buffer_store_short v9, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+10], 16, v[vgprValuC+10] // convert C to bf16
buffer_store_short v10, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+11], 16, v[vgprValuC+11] // convert C to bf16
buffer_store_short v11, v84, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #1 (d1,d0,vc1,vc0) =
   (0,3,0,0:vw1); (0,3,0,1:vw1); (0,3,0,2:vw1); (0,3,0,3:vw1); (0,4,0,0:vw1); (0,4,0,1:vw1); (0,4,0,2:vw1); (0,4,0,3:vw1); (0,5,0,0:vw1); (0,5,0,1:vw1); (0,5,0,2:vw1); (0,5,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
_v_add_co_u32 v64, vcc, v69, 24                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,3,1) */
_v_add_co_u32 v64, vcc, v69, 25                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v67, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v67, -1, v67, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,3,2) */
_v_add_co_u32 v64, vcc, v69, 26                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,3,3) */
_v_add_co_u32 v64, vcc, v69, 27                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v74, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
_v_add_co_u32 v64, vcc, v69, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,4,1) */
_v_add_co_u32 v64, vcc, v69, 33                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v76, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,4,2) */
_v_add_co_u32 v64, vcc, v69, 34                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,4,3) */
_v_add_co_u32 v64, vcc, v69, 35                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v78, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
_v_add_co_u32 v64, vcc, v69, 40                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,5,1) */
_v_add_co_u32 v64, vcc, v69, 41                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v80, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,5,2) */
_v_add_co_u32 v64, vcc, v69, 42                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,5,3) */
_v_add_co_u32 v64, vcc, v69, 43                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v84, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v84, -1, v84, s[84:85]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 3, 0, 0), (0, 3, 0, 1), (0, 3, 0, 2), (0, 3, 0, 3), (0, 4, 0, 0), (0, 4, 0, 1), (0, 4, 0, 2), (0, 4, 0, 3), (0, 5, 0, 0), (0, 5, 0, 1), (0, 5, 0, 2), (0, 5, 0, 3)] */
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+12], 16, v[vgprValuC+12] // convert C to bf16
buffer_store_short v12, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+13], 16, v[vgprValuC+13] // convert C to bf16
buffer_store_short v13, v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+14], 16, v[vgprValuC+14] // convert C to bf16
buffer_store_short v14, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+15], 16, v[vgprValuC+15] // convert C to bf16
buffer_store_short v15, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+16], 16, v[vgprValuC+16] // convert C to bf16
buffer_store_short v16, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+17], 16, v[vgprValuC+17] // convert C to bf16
buffer_store_short v17, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+18], 16, v[vgprValuC+18] // convert C to bf16
buffer_store_short v18, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+19], 16, v[vgprValuC+19] // convert C to bf16
buffer_store_short v19, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+20], 16, v[vgprValuC+20] // convert C to bf16
buffer_store_short v20, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+21], 16, v[vgprValuC+21] // convert C to bf16
buffer_store_short v21, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+22], 16, v[vgprValuC+22] // convert C to bf16
buffer_store_short v22, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+23], 16, v[vgprValuC+23] // convert C to bf16
buffer_store_short v23, v84, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #2 (d1,d0,vc1,vc0) =
   (0,6,0,0:vw1); (0,6,0,1:vw1); (0,6,0,2:vw1); (0,6,0,3:vw1); (0,7,0,0:vw1); (0,7,0,1:vw1); (0,7,0,2:vw1); (0,7,0,3:vw1); (1,0,0,0:vw1); (1,0,0,1:vw1); (1,0,0,2:vw1); (1,0,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
_v_add_co_u32 v64, vcc, v69, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,6,1) */
_v_add_co_u32 v64, vcc, v69, 49                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v67, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v67, -1, v67, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,6,2) */
_v_add_co_u32 v64, vcc, v69, 50                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,6,3) */
_v_add_co_u32 v64, vcc, v69, 51                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v74, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
_v_add_co_u32 v64, vcc, v69, 56                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,7,1) */
_v_add_co_u32 v64, vcc, v69, 57                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v76, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,7,2) */
_v_add_co_u32 v64, vcc, v69, 58                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,7,3) */
_v_add_co_u32 v64, vcc, v69, 59                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v78, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v70, vcc, v70, 32                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStrideC1J], 32                // scale stride
_v_add_u32 v71, v71, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v69, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v79, v71, v69, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,1) */
_v_add_co_u32 v64, vcc, v69, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v80, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,2) */
_v_add_co_u32 v64, vcc, v69, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,3) */
_v_add_co_u32 v64, vcc, v69, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v84, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v84, -1, v84, s[84:85]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 6, 0, 0), (0, 6, 0, 1), (0, 6, 0, 2), (0, 6, 0, 3), (0, 7, 0, 0), (0, 7, 0, 1), (0, 7, 0, 2), (0, 7, 0, 3), (1, 0, 0, 0), (1, 0, 0, 1), (1, 0, 0, 2), (1, 0, 0, 3)] */
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+24], 16, v[vgprValuC+24] // convert C to bf16
buffer_store_short v24, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+25], 16, v[vgprValuC+25] // convert C to bf16
buffer_store_short v25, v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+26], 16, v[vgprValuC+26] // convert C to bf16
buffer_store_short v26, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+27], 16, v[vgprValuC+27] // convert C to bf16
buffer_store_short v27, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+28], 16, v[vgprValuC+28] // convert C to bf16
buffer_store_short v28, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+29], 16, v[vgprValuC+29] // convert C to bf16
buffer_store_short v29, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+30], 16, v[vgprValuC+30] // convert C to bf16
buffer_store_short v30, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+31], 16, v[vgprValuC+31] // convert C to bf16
buffer_store_short v31, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+32], 16, v[vgprValuC+32] // convert C to bf16
buffer_store_short v32, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+33], 16, v[vgprValuC+33] // convert C to bf16
buffer_store_short v33, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+34], 16, v[vgprValuC+34] // convert C to bf16
buffer_store_short v34, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+35], 16, v[vgprValuC+35] // convert C to bf16
buffer_store_short v35, v84, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #3 (d1,d0,vc1,vc0) =
   (1,1,0,0:vw1); (1,1,0,1:vw1); (1,1,0,2:vw1); (1,1,0,3:vw1); (1,2,0,0:vw1); (1,2,0,1:vw1); (1,2,0,2:vw1); (1,2,0,3:vw1); (1,3,0,0:vw1); (1,3,0,1:vw1); (1,3,0,2:vw1); (1,3,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v64, vcc, v69, 8                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,1) */
_v_add_co_u32 v64, vcc, v69, 9                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v67, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v67, -1, v67, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,2) */
_v_add_co_u32 v64, vcc, v69, 10                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,3) */
_v_add_co_u32 v64, vcc, v69, 11                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v74, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
_v_add_co_u32 v64, vcc, v69, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,1) */
_v_add_co_u32 v64, vcc, v69, 17                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v76, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,2) */
_v_add_co_u32 v64, vcc, v69, 18                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,3) */
_v_add_co_u32 v64, vcc, v69, 19                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v78, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
_v_add_co_u32 v64, vcc, v69, 24                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,3,1) */
_v_add_co_u32 v64, vcc, v69, 25                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v80, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,3,2) */
_v_add_co_u32 v64, vcc, v69, 26                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,3,3) */
_v_add_co_u32 v64, vcc, v69, 27                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v84, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v84, -1, v84, s[84:85]               // clip if OOB. offset

/* rC *= alpha batchEements=[(1, 1, 0, 0), (1, 1, 0, 1), (1, 1, 0, 2), (1, 1, 0, 3), (1, 2, 0, 0), (1, 2, 0, 1), (1, 2, 0, 2), (1, 2, 0, 3), (1, 3, 0, 0), (1, 3, 0, 1), (1, 3, 0, 2), (1, 3, 0, 3)] */
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+36], 16, v[vgprValuC+36] // convert C to bf16
buffer_store_short v36, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+37], 16, v[vgprValuC+37] // convert C to bf16
buffer_store_short v37, v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+38], 16, v[vgprValuC+38] // convert C to bf16
buffer_store_short v38, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+39], 16, v[vgprValuC+39] // convert C to bf16
buffer_store_short v39, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+40], 16, v[vgprValuC+40] // convert C to bf16
buffer_store_short v40, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+41], 16, v[vgprValuC+41] // convert C to bf16
buffer_store_short v41, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+42], 16, v[vgprValuC+42] // convert C to bf16
buffer_store_short v42, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+43], 16, v[vgprValuC+43] // convert C to bf16
buffer_store_short v43, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+44], 16, v[vgprValuC+44] // convert C to bf16
buffer_store_short v44, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+45], 16, v[vgprValuC+45] // convert C to bf16
buffer_store_short v45, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+46], 16, v[vgprValuC+46] // convert C to bf16
buffer_store_short v46, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+47], 16, v[vgprValuC+47] // convert C to bf16
buffer_store_short v47, v84, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #4 (d1,d0,vc1,vc0) =
   (1,4,0,0:vw1); (1,4,0,1:vw1); (1,4,0,2:vw1); (1,4,0,3:vw1); (1,5,0,0:vw1); (1,5,0,1:vw1); (1,5,0,2:vw1); (1,5,0,3:vw1); (1,6,0,0:vw1); (1,6,0,1:vw1); (1,6,0,2:vw1); (1,6,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
_v_add_co_u32 v64, vcc, v69, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,4,1) */
_v_add_co_u32 v64, vcc, v69, 33                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v67, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v67, -1, v67, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,4,2) */
_v_add_co_u32 v64, vcc, v69, 34                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,4,3) */
_v_add_co_u32 v64, vcc, v69, 35                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v74, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
_v_add_co_u32 v64, vcc, v69, 40                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,5,1) */
_v_add_co_u32 v64, vcc, v69, 41                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v76, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,5,2) */
_v_add_co_u32 v64, vcc, v69, 42                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,5,3) */
_v_add_co_u32 v64, vcc, v69, 43                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v78, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
_v_add_co_u32 v64, vcc, v69, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,6,1) */
_v_add_co_u32 v64, vcc, v69, 49                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v80, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,6,2) */
_v_add_co_u32 v64, vcc, v69, 50                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,6,3) */
_v_add_co_u32 v64, vcc, v69, 51                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v84, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v84, -1, v84, s[84:85]               // clip if OOB. offset

/* rC *= alpha batchEements=[(1, 4, 0, 0), (1, 4, 0, 1), (1, 4, 0, 2), (1, 4, 0, 3), (1, 5, 0, 0), (1, 5, 0, 1), (1, 5, 0, 2), (1, 5, 0, 3), (1, 6, 0, 0), (1, 6, 0, 1), (1, 6, 0, 2), (1, 6, 0, 3)] */
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+48], 16, v[vgprValuC+48] // convert C to bf16
buffer_store_short v48, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+49], 16, v[vgprValuC+49] // convert C to bf16
buffer_store_short v49, v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+50], 16, v[vgprValuC+50] // convert C to bf16
buffer_store_short v50, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+51], 16, v[vgprValuC+51] // convert C to bf16
buffer_store_short v51, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+52], 16, v[vgprValuC+52] // convert C to bf16
buffer_store_short v52, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+53], 16, v[vgprValuC+53] // convert C to bf16
buffer_store_short v53, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+54], 16, v[vgprValuC+54] // convert C to bf16
buffer_store_short v54, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+55], 16, v[vgprValuC+55] // convert C to bf16
buffer_store_short v55, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+56], 16, v[vgprValuC+56] // convert C to bf16
buffer_store_short v56, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+57], 16, v[vgprValuC+57] // convert C to bf16
buffer_store_short v57, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+58], 16, v[vgprValuC+58] // convert C to bf16
buffer_store_short v58, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+59], 16, v[vgprValuC+59] // convert C to bf16
buffer_store_short v59, v84, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #5 (d1,d0,vc1,vc0) =
   (1,7,0,0:vw1); (1,7,0,1:vw1); (1,7,0,2:vw1); (1,7,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,7,0) */
_v_add_co_u32 v64, vcc, v69, 56                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,7,1) */
_v_add_co_u32 v64, vcc, v69, 57                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v67, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v67, -1, v67, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,7,2) */
_v_add_co_u32 v64, vcc, v69, 58                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,7,3) */
_v_add_co_u32 v64, vcc, v69, 59                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v74, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[68:69]               // clip if OOB. offset

/* rC *= alpha batchEements=[(1, 7, 0, 0), (1, 7, 0, 1), (1, 7, 0, 2), (1, 7, 0, 3)] */
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v75, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshrrev_b32 v[vgprValuC+60], 16, v[vgprValuC+60] // convert C to bf16
buffer_store_short v60, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+61], 16, v[vgprValuC+61] // convert C to bf16
buffer_store_short v61, v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+62], 16, v[vgprValuC+62] // convert C to bf16
buffer_store_short v62, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshrrev_b32 v[vgprValuC+63], 16, v[vgprValuC+63] // convert C to bf16
buffer_store_short v63, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0031                                // jump to end
GW_Beta_24:
s_and_b32 s56, 63, s[sgprSizeC0I]                  // s56 = s[sgprSizeC0I] % 64
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B1_E1_30                         // jump if edges required
s_and_b32 s56, 255, s[sgprSizeC1J]                 // s56 = s[sgprSizeC1J] % 256
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B1_E1_30                         // jump if edges required
GW_B1_E0_27:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=6 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw4); (0,1,0,0:vw4); (0,2,0,0:vw4); (0,3,0,0:vw4); (0,4,0,0:vw4); (0,5,0,0:vw4) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v66, v71, v69, 0x1                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
buffer_load_dwordx2 v[67:68], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
buffer_load_dwordx2 v[74:75], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:16 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
buffer_load_dwordx2 v[76:77], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:32 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
buffer_load_dwordx2 v[78:79], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:48 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
buffer_load_dwordx2 v[80:81], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
buffer_load_dwordx2 v[84:85], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:80 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (0, 4, 0, 0), (0, 5, 0, 0)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v86, 0xffff0000                          // mask for pack two bfloat16 element to 32bit

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+0], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_and_b32 v87, v67, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+1], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v68                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+2], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_and_b32 v87, v68, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+3], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+0], 16, v[vgprValuC+0]   // convert C to bf16
v_and_or_b32 v0, v[vgprValuC+1], v86, v[vgprValuC+0] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+2], 16, v[vgprValuC+2]   // convert C to bf16
v_and_or_b32 v1, v[vgprValuC+3], v86, v[vgprValuC+2] // pack two bf16 to dword
buffer_store_dwordx2 v[0:1], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+4], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_and_b32 v87, v74, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+5], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v75                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+6], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_and_b32 v87, v75, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+7], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+4], 16, v[vgprValuC+4]   // convert C to bf16
v_and_or_b32 v4, v[vgprValuC+5], v86, v[vgprValuC+4] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+6], 16, v[vgprValuC+6]   // convert C to bf16
v_and_or_b32 v5, v[vgprValuC+7], v86, v[vgprValuC+6] // pack two bf16 to dword
buffer_store_dwordx2 v[4:5], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:16,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+8], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_and_b32 v87, v76, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+9], v87, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v77                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+10], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v77, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+11], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+8], 16, v[vgprValuC+8]   // convert C to bf16
v_and_or_b32 v8, v[vgprValuC+9], v86, v[vgprValuC+8] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+10], 16, v[vgprValuC+10] // convert C to bf16
v_and_or_b32 v9, v[vgprValuC+11], v86, v[vgprValuC+10] // pack two bf16 to dword
buffer_store_dwordx2 v[8:9], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+12], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v78, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+13], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v79                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+14], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v79, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+15], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+12], 16, v[vgprValuC+12] // convert C to bf16
v_and_or_b32 v12, v[vgprValuC+13], v86, v[vgprValuC+12] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+14], 16, v[vgprValuC+14] // convert C to bf16
v_and_or_b32 v13, v[vgprValuC+15], v86, v[vgprValuC+14] // pack two bf16 to dword
buffer_store_dwordx2 v[12:13], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:48,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+16], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v80, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+17], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v81                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+18], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v81, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+19], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+16], 16, v[vgprValuC+16] // convert C to bf16
v_and_or_b32 v16, v[vgprValuC+17], v86, v[vgprValuC+16] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+18], 16, v[vgprValuC+18] // convert C to bf16
v_and_or_b32 v17, v[vgprValuC+19], v86, v[vgprValuC+18] // pack two bf16 to dword
buffer_store_dwordx2 v[16:17], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+20], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v84, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+21], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v85                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+22], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v85, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+23], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+20], 16, v[vgprValuC+20] // convert C to bf16
v_and_or_b32 v20, v[vgprValuC+21], v86, v[vgprValuC+20] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+22], 16, v[vgprValuC+22] // convert C to bf16
v_and_or_b32 v21, v[vgprValuC+23], v86, v[vgprValuC+22] // pack two bf16 to dword
buffer_store_dwordx2 v[20:21], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:80,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #1 (d1,d0,vc1,vc0) =
   (0,6,0,0:vw4); (0,7,0,0:vw4); (1,0,0,0:vw4); (1,1,0,0:vw4); (1,2,0,0:vw4); (1,3,0,0:vw4) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
buffer_load_dwordx2 v[67:68], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:96 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
buffer_load_dwordx2 v[74:75], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:112 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
s_mul_i32 s56, s[sgprStrideC1J], 64                // scale StrideC *= numRows(32) * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dwordx2 v[76:77], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
buffer_load_dwordx2 v[78:79], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:16 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
buffer_load_dwordx2 v[80:81], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:32 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
buffer_load_dwordx2 v[84:85], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:48 // load C for beta calc

/* rC *= alpha batchEements=[(0, 6, 0, 0), (0, 7, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0)] */
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v86, 0xffff0000                          // mask for pack two bfloat16 element to 32bit

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+24], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v67, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+25], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v68                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+26], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v68, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+27], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+24], 16, v[vgprValuC+24] // convert C to bf16
v_and_or_b32 v24, v[vgprValuC+25], v86, v[vgprValuC+24] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+26], 16, v[vgprValuC+26] // convert C to bf16
v_and_or_b32 v25, v[vgprValuC+27], v86, v[vgprValuC+26] // pack two bf16 to dword
buffer_store_dwordx2 v[24:25], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:96,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+28], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v74, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+29], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v75                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+30], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v75, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+31], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+28], 16, v[vgprValuC+28] // convert C to bf16
v_and_or_b32 v28, v[vgprValuC+29], v86, v[vgprValuC+28] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+30], 16, v[vgprValuC+30] // convert C to bf16
v_and_or_b32 v29, v[vgprValuC+31], v86, v[vgprValuC+30] // pack two bf16 to dword
buffer_store_dwordx2 v[28:29], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:112,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+32], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v76, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+33], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v77                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+34], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v77, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+35], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+32], 16, v[vgprValuC+32] // convert C to bf16
v_and_or_b32 v32, v[vgprValuC+33], v86, v[vgprValuC+32] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+34], 16, v[vgprValuC+34] // convert C to bf16
v_and_or_b32 v33, v[vgprValuC+35], v86, v[vgprValuC+34] // pack two bf16 to dword
s_mul_i32 s56, s[sgprStrideD1J], 64                // scale StrideD *= numRows(32) * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dwordx2 v[32:33], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+36], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v78, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+37], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v79                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+38], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v79, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+39], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+36], 16, v[vgprValuC+36] // convert C to bf16
v_and_or_b32 v36, v[vgprValuC+37], v86, v[vgprValuC+36] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+38], 16, v[vgprValuC+38] // convert C to bf16
v_and_or_b32 v37, v[vgprValuC+39], v86, v[vgprValuC+38] // pack two bf16 to dword
buffer_store_dwordx2 v[36:37], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:16,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+40], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v80, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+41], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v81                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+42], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v81, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+43], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+40], 16, v[vgprValuC+40] // convert C to bf16
v_and_or_b32 v40, v[vgprValuC+41], v86, v[vgprValuC+40] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+42], 16, v[vgprValuC+42] // convert C to bf16
v_and_or_b32 v41, v[vgprValuC+43], v86, v[vgprValuC+42] // pack two bf16 to dword
buffer_store_dwordx2 v[40:41], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_lshlrev_b32 v87, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+44], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v84, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+45], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v87, 16, v85                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+46], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v87, v85, v86                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+47], v87, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+44], 16, v[vgprValuC+44] // convert C to bf16
v_and_or_b32 v44, v[vgprValuC+45], v86, v[vgprValuC+44] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+46], 16, v[vgprValuC+46] // convert C to bf16
v_and_or_b32 v45, v[vgprValuC+47], v86, v[vgprValuC+46] // pack two bf16 to dword
buffer_store_dwordx2 v[44:45], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:48,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #2 (d1,d0,vc1,vc0) =
   (1,4,0,0:vw4); (1,5,0,0:vw4); (1,6,0,0:vw4); (1,7,0,0:vw4) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
buffer_load_dwordx2 v[67:68], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
buffer_load_dwordx2 v[74:75], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:80 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
buffer_load_dwordx2 v[76:77], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:96 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,7,0) */
buffer_load_dwordx2 v[78:79], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:112 // load C for beta calc

/* rC *= alpha batchEements=[(1, 4, 0, 0), (1, 5, 0, 0), (1, 6, 0, 0), (1, 7, 0, 0)] */
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha

/* apply mask, calc new C and issue write */
v_mov_b32 v80, 0xffff0000                          // mask for pack two bfloat16 element to 32bit

s_waitcnt vmcnt(3)                                 // wait C (interleaved)
v_lshlrev_b32 v81, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+48], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v67, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+49], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v81, 16, v68                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+50], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v68, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+51], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+48], 16, v[vgprValuC+48] // convert C to bf16
v_and_or_b32 v48, v[vgprValuC+49], v80, v[vgprValuC+48] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+50], 16, v[vgprValuC+50] // convert C to bf16
v_and_or_b32 v49, v[vgprValuC+51], v80, v[vgprValuC+50] // pack two bf16 to dword
buffer_store_dwordx2 v[48:49], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(3)                                 // wait C (interleaved)
v_lshlrev_b32 v81, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+52], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v74, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+53], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v81, 16, v75                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+54], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v75, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+55], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+52], 16, v[vgprValuC+52] // convert C to bf16
v_and_or_b32 v52, v[vgprValuC+53], v80, v[vgprValuC+52] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+54], 16, v[vgprValuC+54] // convert C to bf16
v_and_or_b32 v53, v[vgprValuC+55], v80, v[vgprValuC+54] // pack two bf16 to dword
buffer_store_dwordx2 v[52:53], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:80,  // store D

s_waitcnt vmcnt(3)                                 // wait C (interleaved)
v_lshlrev_b32 v81, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+56], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v76, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+57], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v81, 16, v77                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+58], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v77, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+59], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+56], 16, v[vgprValuC+56] // convert C to bf16
v_and_or_b32 v56, v[vgprValuC+57], v80, v[vgprValuC+56] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+58], 16, v[vgprValuC+58] // convert C to bf16
v_and_or_b32 v57, v[vgprValuC+59], v80, v[vgprValuC+58] // pack two bf16 to dword
buffer_store_dwordx2 v[56:57], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:96,  // store D

s_waitcnt vmcnt(3)                                 // wait C (interleaved)
v_lshlrev_b32 v81, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+60], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v78, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+61], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshlrev_b32 v81, 16, v79                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+62], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_and_b32 v81, v79, v80                            // convert bf16 to fp32
v_mac_f32 v[vgprValuC+63], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+60], 16, v[vgprValuC+60] // convert C to bf16
v_and_or_b32 v60, v[vgprValuC+61], v80, v[vgprValuC+60] // pack two bf16 to dword
v_lshrrev_b32 v[vgprValuC+62], 16, v[vgprValuC+62] // convert C to bf16
v_and_or_b32 v61, v[vgprValuC+63], v80, v[vgprValuC+62] // pack two bf16 to dword
buffer_store_dwordx2 v[60:61], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:112,  // store D
s_branch label_0031                                // jump to end
GW_B1_E1_30:

/* allocate 18 sgpr. perBatch=6 perElement=2 elements=6 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,0,0,1:vw1); (0,0,0,2:vw1); (0,0,0,3:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v69, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v69, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,1) */
_v_add_co_u32 v64, vcc, v69, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
_v_add_co_u32 v64, vcc, v69, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,3) */
_v_add_co_u32 v64, vcc, v69, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v64, vcc, v69, 8                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,1) */
_v_add_co_u32 v64, vcc, v69, 9                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 0, 2), (0, 0, 0, 3), (0, 1, 0, 0), (0, 1, 0, 1)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+0], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+0], 16, v[vgprValuC+0]   // convert C to bf16
buffer_store_short v0, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+1], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+1], 16, v[vgprValuC+1]   // convert C to bf16
buffer_store_short v1, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+2], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+2], 16, v[vgprValuC+2]   // convert C to bf16
buffer_store_short v2, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+3], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+3], 16, v[vgprValuC+3]   // convert C to bf16
buffer_store_short v3, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+4], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+4], 16, v[vgprValuC+4]   // convert C to bf16
buffer_store_short v4, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+5], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+5], 16, v[vgprValuC+5]   // convert C to bf16
buffer_store_short v5, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #1 (d1,d0,vc1,vc0) =
   (0,1,0,2:vw1); (0,1,0,3:vw1); (0,2,0,0:vw1); (0,2,0,1:vw1); (0,2,0,2:vw1); (0,2,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,1,2) */
_v_add_co_u32 v64, vcc, v69, 10                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,3) */
_v_add_co_u32 v64, vcc, v69, 11                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
_v_add_co_u32 v64, vcc, v69, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,1) */
_v_add_co_u32 v64, vcc, v69, 17                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,2) */
_v_add_co_u32 v64, vcc, v69, 18                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,3) */
_v_add_co_u32 v64, vcc, v69, 19                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 1, 0, 2), (0, 1, 0, 3), (0, 2, 0, 0), (0, 2, 0, 1), (0, 2, 0, 2), (0, 2, 0, 3)] */
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+6], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+6], 16, v[vgprValuC+6]   // convert C to bf16
buffer_store_short v6, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+7], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+7], 16, v[vgprValuC+7]   // convert C to bf16
buffer_store_short v7, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+8], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+8], 16, v[vgprValuC+8]   // convert C to bf16
buffer_store_short v8, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+9], v86, s[sgprBeta]         // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+9], 16, v[vgprValuC+9]   // convert C to bf16
buffer_store_short v9, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+10], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+10], 16, v[vgprValuC+10] // convert C to bf16
buffer_store_short v10, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+11], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+11], 16, v[vgprValuC+11] // convert C to bf16
buffer_store_short v11, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #2 (d1,d0,vc1,vc0) =
   (0,3,0,0:vw1); (0,3,0,1:vw1); (0,3,0,2:vw1); (0,3,0,3:vw1); (0,4,0,0:vw1); (0,4,0,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
_v_add_co_u32 v64, vcc, v69, 24                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,1) */
_v_add_co_u32 v64, vcc, v69, 25                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,2) */
_v_add_co_u32 v64, vcc, v69, 26                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,3) */
_v_add_co_u32 v64, vcc, v69, 27                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
_v_add_co_u32 v64, vcc, v69, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,4,1) */
_v_add_co_u32 v64, vcc, v69, 33                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 3, 0, 0), (0, 3, 0, 1), (0, 3, 0, 2), (0, 3, 0, 3), (0, 4, 0, 0), (0, 4, 0, 1)] */
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+12], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+12], 16, v[vgprValuC+12] // convert C to bf16
buffer_store_short v12, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+13], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+13], 16, v[vgprValuC+13] // convert C to bf16
buffer_store_short v13, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+14], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+14], 16, v[vgprValuC+14] // convert C to bf16
buffer_store_short v14, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+15], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+15], 16, v[vgprValuC+15] // convert C to bf16
buffer_store_short v15, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+16], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+16], 16, v[vgprValuC+16] // convert C to bf16
buffer_store_short v16, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+17], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+17], 16, v[vgprValuC+17] // convert C to bf16
buffer_store_short v17, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #3 (d1,d0,vc1,vc0) =
   (0,4,0,2:vw1); (0,4,0,3:vw1); (0,5,0,0:vw1); (0,5,0,1:vw1); (0,5,0,2:vw1); (0,5,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,4,2) */
_v_add_co_u32 v64, vcc, v69, 34                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,4,3) */
_v_add_co_u32 v64, vcc, v69, 35                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
_v_add_co_u32 v64, vcc, v69, 40                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,1) */
_v_add_co_u32 v64, vcc, v69, 41                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,2) */
_v_add_co_u32 v64, vcc, v69, 42                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,3) */
_v_add_co_u32 v64, vcc, v69, 43                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 4, 0, 2), (0, 4, 0, 3), (0, 5, 0, 0), (0, 5, 0, 1), (0, 5, 0, 2), (0, 5, 0, 3)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+18], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+18], 16, v[vgprValuC+18] // convert C to bf16
buffer_store_short v18, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+19], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+19], 16, v[vgprValuC+19] // convert C to bf16
buffer_store_short v19, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+20], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+20], 16, v[vgprValuC+20] // convert C to bf16
buffer_store_short v20, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+21], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+21], 16, v[vgprValuC+21] // convert C to bf16
buffer_store_short v21, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+22], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+22], 16, v[vgprValuC+22] // convert C to bf16
buffer_store_short v22, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+23], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+23], 16, v[vgprValuC+23] // convert C to bf16
buffer_store_short v23, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #4 (d1,d0,vc1,vc0) =
   (0,6,0,0:vw1); (0,6,0,1:vw1); (0,6,0,2:vw1); (0,6,0,3:vw1); (0,7,0,0:vw1); (0,7,0,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
_v_add_co_u32 v64, vcc, v69, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,6,1) */
_v_add_co_u32 v64, vcc, v69, 49                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,6,2) */
_v_add_co_u32 v64, vcc, v69, 50                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,6,3) */
_v_add_co_u32 v64, vcc, v69, 51                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
_v_add_co_u32 v64, vcc, v69, 56                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,7,1) */
_v_add_co_u32 v64, vcc, v69, 57                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 6, 0, 0), (0, 6, 0, 1), (0, 6, 0, 2), (0, 6, 0, 3), (0, 7, 0, 0), (0, 7, 0, 1)] */
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+24], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+24], 16, v[vgprValuC+24] // convert C to bf16
buffer_store_short v24, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+25], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+25], 16, v[vgprValuC+25] // convert C to bf16
buffer_store_short v25, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+26], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+26], 16, v[vgprValuC+26] // convert C to bf16
buffer_store_short v26, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+27], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+27], 16, v[vgprValuC+27] // convert C to bf16
buffer_store_short v27, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+28], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+28], 16, v[vgprValuC+28] // convert C to bf16
buffer_store_short v28, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+29], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+29], 16, v[vgprValuC+29] // convert C to bf16
buffer_store_short v29, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #5 (d1,d0,vc1,vc0) =
   (0,7,0,2:vw1); (0,7,0,3:vw1); (1,0,0,0:vw1); (1,0,0,1:vw1); (1,0,0,2:vw1); (1,0,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,7,2) */
_v_add_co_u32 v64, vcc, v69, 58                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,7,3) */
_v_add_co_u32 v64, vcc, v69, 59                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v70, vcc, v70, 32                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStrideC1J], 32                // scale stride
_v_add_u32 v71, v71, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v69, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v69, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,1) */
_v_add_co_u32 v64, vcc, v69, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,2) */
_v_add_co_u32 v64, vcc, v69, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,3) */
_v_add_co_u32 v64, vcc, v69, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 7, 0, 2), (0, 7, 0, 3), (1, 0, 0, 0), (1, 0, 0, 1), (1, 0, 0, 2), (1, 0, 0, 3)] */
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+30], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+30], 16, v[vgprValuC+30] // convert C to bf16
buffer_store_short v30, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+31], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+31], 16, v[vgprValuC+31] // convert C to bf16
buffer_store_short v31, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+32], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+32], 16, v[vgprValuC+32] // convert C to bf16
buffer_store_short v32, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+33], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+33], 16, v[vgprValuC+33] // convert C to bf16
buffer_store_short v33, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+34], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+34], 16, v[vgprValuC+34] // convert C to bf16
buffer_store_short v34, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+35], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+35], 16, v[vgprValuC+35] // convert C to bf16
buffer_store_short v35, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #6 (d1,d0,vc1,vc0) =
   (1,1,0,0:vw1); (1,1,0,1:vw1); (1,1,0,2:vw1); (1,1,0,3:vw1); (1,2,0,0:vw1); (1,2,0,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v64, vcc, v69, 8                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,1) */
_v_add_co_u32 v64, vcc, v69, 9                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,2) */
_v_add_co_u32 v64, vcc, v69, 10                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,3) */
_v_add_co_u32 v64, vcc, v69, 11                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
_v_add_co_u32 v64, vcc, v69, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,1) */
_v_add_co_u32 v64, vcc, v69, 17                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 1, 0, 0), (1, 1, 0, 1), (1, 1, 0, 2), (1, 1, 0, 3), (1, 2, 0, 0), (1, 2, 0, 1)] */
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+36], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+36], 16, v[vgprValuC+36] // convert C to bf16
buffer_store_short v36, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+37], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+37], 16, v[vgprValuC+37] // convert C to bf16
buffer_store_short v37, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+38], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+38], 16, v[vgprValuC+38] // convert C to bf16
buffer_store_short v38, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+39], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+39], 16, v[vgprValuC+39] // convert C to bf16
buffer_store_short v39, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+40], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+40], 16, v[vgprValuC+40] // convert C to bf16
buffer_store_short v40, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+41], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+41], 16, v[vgprValuC+41] // convert C to bf16
buffer_store_short v41, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #7 (d1,d0,vc1,vc0) =
   (1,2,0,2:vw1); (1,2,0,3:vw1); (1,3,0,0:vw1); (1,3,0,1:vw1); (1,3,0,2:vw1); (1,3,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,2,2) */
_v_add_co_u32 v64, vcc, v69, 18                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,3) */
_v_add_co_u32 v64, vcc, v69, 19                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
_v_add_co_u32 v64, vcc, v69, 24                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,1) */
_v_add_co_u32 v64, vcc, v69, 25                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,2) */
_v_add_co_u32 v64, vcc, v69, 26                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,3) */
_v_add_co_u32 v64, vcc, v69, 27                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 2, 0, 2), (1, 2, 0, 3), (1, 3, 0, 0), (1, 3, 0, 1), (1, 3, 0, 2), (1, 3, 0, 3)] */
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+42], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+42], 16, v[vgprValuC+42] // convert C to bf16
buffer_store_short v42, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+43], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+43], 16, v[vgprValuC+43] // convert C to bf16
buffer_store_short v43, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+44], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+44], 16, v[vgprValuC+44] // convert C to bf16
buffer_store_short v44, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+45], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+45], 16, v[vgprValuC+45] // convert C to bf16
buffer_store_short v45, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+46], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+46], 16, v[vgprValuC+46] // convert C to bf16
buffer_store_short v46, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+47], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+47], 16, v[vgprValuC+47] // convert C to bf16
buffer_store_short v47, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #8 (d1,d0,vc1,vc0) =
   (1,4,0,0:vw1); (1,4,0,1:vw1); (1,4,0,2:vw1); (1,4,0,3:vw1); (1,5,0,0:vw1); (1,5,0,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
_v_add_co_u32 v64, vcc, v69, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,4,1) */
_v_add_co_u32 v64, vcc, v69, 33                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,4,2) */
_v_add_co_u32 v64, vcc, v69, 34                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,4,3) */
_v_add_co_u32 v64, vcc, v69, 35                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
_v_add_co_u32 v64, vcc, v69, 40                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,5,1) */
_v_add_co_u32 v64, vcc, v69, 41                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 4, 0, 0), (1, 4, 0, 1), (1, 4, 0, 2), (1, 4, 0, 3), (1, 5, 0, 0), (1, 5, 0, 1)] */
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+48], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+48], 16, v[vgprValuC+48] // convert C to bf16
buffer_store_short v48, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+49], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+49], 16, v[vgprValuC+49] // convert C to bf16
buffer_store_short v49, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+50], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+50], 16, v[vgprValuC+50] // convert C to bf16
buffer_store_short v50, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+51], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+51], 16, v[vgprValuC+51] // convert C to bf16
buffer_store_short v51, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+52], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+52], 16, v[vgprValuC+52] // convert C to bf16
buffer_store_short v52, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+53], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+53], 16, v[vgprValuC+53] // convert C to bf16
buffer_store_short v53, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #9 (d1,d0,vc1,vc0) =
   (1,5,0,2:vw1); (1,5,0,3:vw1); (1,6,0,0:vw1); (1,6,0,1:vw1); (1,6,0,2:vw1); (1,6,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,5,2) */
_v_add_co_u32 v64, vcc, v69, 42                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,5,3) */
_v_add_co_u32 v64, vcc, v69, 43                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
_v_add_co_u32 v64, vcc, v69, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,6,1) */
_v_add_co_u32 v64, vcc, v69, 49                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,6,2) */
_v_add_co_u32 v64, vcc, v69, 50                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v79, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[70:71]               // clip if OOB. offset
buffer_load_short_d16 v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,6,3) */
_v_add_co_u32 v64, vcc, v69, 51                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v81, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[72:73]               // clip if OOB. offset
buffer_load_short_d16 v84, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 5, 0, 2), (1, 5, 0, 3), (1, 6, 0, 0), (1, 6, 0, 1), (1, 6, 0, 2), (1, 6, 0, 3)] */
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v85, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v86, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+54], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+54], 16, v[vgprValuC+54] // convert C to bf16
buffer_store_short v54, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+55], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+55], 16, v[vgprValuC+55] // convert C to bf16
buffer_store_short v55, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+56], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+56], 16, v[vgprValuC+56] // convert C to bf16
buffer_store_short v56, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+57], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+57], 16, v[vgprValuC+57] // convert C to bf16
buffer_store_short v57, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v80                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+58], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+58], 16, v[vgprValuC+58] // convert C to bf16
buffer_store_short v58, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v86, 16, v84                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+59], v86, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+59], 16, v[vgprValuC+59] // convert C to bf16
buffer_store_short v59, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #10 (d1,d0,vc1,vc0) =
   (1,7,0,0:vw1); (1,7,0,1:vw1); (1,7,0,2:vw1); (1,7,0,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,7,0) */
_v_add_co_u32 v64, vcc, v69, 56                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v66, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v66, -1, v66, s[62:63]               // clip if OOB. offset
buffer_load_short_d16 v67, v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,7,1) */
_v_add_co_u32 v64, vcc, v69, 57                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v68, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v68, -1, v68, s[64:65]               // clip if OOB. offset
buffer_load_short_d16 v74, v68, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,7,2) */
_v_add_co_u32 v64, vcc, v69, 58                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v75, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[66:67]               // clip if OOB. offset
buffer_load_short_d16 v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,7,3) */
_v_add_co_u32 v64, vcc, v69, 59                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v70, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v77, v71, v64, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[68:69]               // clip if OOB. offset
buffer_load_short_d16 v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 7, 0, 0), (1, 7, 0, 1), (1, 7, 0, 2), (1, 7, 0, 3)] */
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mov_b32 v79, 0xffff0000                          // mask for pack two bfloat16 element to 32bit
v_lshlrev_b32 v80, 16, v67                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+60], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+60], 16, v[vgprValuC+60] // convert C to bf16
buffer_store_short v60, v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v80, 16, v74                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+61], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+61], 16, v[vgprValuC+61] // convert C to bf16
buffer_store_short v61, v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v80, 16, v76                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+62], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+62], 16, v[vgprValuC+62] // convert C to bf16
buffer_store_short v62, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_lshlrev_b32 v80, 16, v78                         // convert bf16 to fp32
v_mac_f32 v[vgprValuC+63], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
v_lshrrev_b32 v[vgprValuC+63], 16, v[vgprValuC+63] // convert C to bf16
buffer_store_short v63, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0031                                // jump to end
label_0031:

label_0032:  /// KernelEnd
s_endpgm                                           // Kernel End


