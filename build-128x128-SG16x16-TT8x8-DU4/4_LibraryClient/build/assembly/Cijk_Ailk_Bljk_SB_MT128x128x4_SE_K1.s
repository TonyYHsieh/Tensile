

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU" 
.text
.protected Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1
.globl Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1
.p2align 8
.type Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1,@function
.amdgpu_hsa_kernel Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1
Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 80 // bytes of kern args
  workitem_vgpr_count = 87 // vgprs
  wavefront_sgpr_count = 92 // sgprs
  compute_pgm_rsrc1_vgprs = 21 // floor((87-1)/4)
  compute_pgm_rsrc1_sgprs = 12 // floor((92-1)/8)
  compute_pgm_rsrc2_tidig_comp_cnt = 0 // 1D wg
  compute_pgm_rsrc2_tgid_x_en = 1 // wg.x
  compute_pgm_rsrc2_tgid_y_en = 1 // wg.y
  compute_pgm_rsrc2_tgid_z_en = 1 // wg.z
  workgroup_group_segment_byte_size = 4096 // lds bytes
  compute_pgm_rsrc2_user_sgpr = 2 // vcc
  kernarg_segment_alignment = 4
  group_segment_alignment = 4
  private_segment_alignment = 4
.end_amd_kernel_code_t

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 8 x 8 */
/* SubGroup= 16 x 16 */
/* VectorWidth=1 */
/* GlobalLoadVectorWidthA=1, GlobalLoadVectorWidthB=1 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1
    SymbolName: 'Cijk_Ailk_Bljk_SB_MT128x128x4_SE_K1@kd'
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
        ValueType:       F32
        AddrSpaceQual:   Generic
      - Name:            C
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Generic
      - Name:            A
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Generic
      - Name:            B
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
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
      GroupSegmentFixedSize: 4096
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign:  8
      WavefrontSize:        64
      NumSGPRs:             92
      NumVGPRs:             87
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
.set vgprG2LA, 64
.set vgprValuB_X0_I0, 72
.set vgprG2LB, 72
.set vgprLocalWriteAddrA, 80
.set vgprLocalWriteAddrB, 81
.set vgprGlobalReadOffsetA, 82
.set vgprGlobalReadOffsetB, 83
.set vgprLocalReadAddrA, 84
.set vgprLocalReadAddrB, 85
.set vgprSerial, 86
/* Num VGPR=87 */

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
.set sgprScalarGlobalReadOffsetA, 71
.set sgprScalarGlobalReadOffsetB, 72
/* max SGPR=92 */

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

.set DepthU, 4
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 1
.set SrdShiftLeftB, 1
/* 2GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0x80000000
/* Bits 127:96 of SRD.  Set DataFormat = 32 bit */
.set Srd127_96, 0x0020000
.set BufferOOB, 0x80000000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr vgprOffset0I vgprOffsetL vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideAL], v[\vgprOffsetL] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffset0I], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x2, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffsetL vgprOffset1J vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x2, v[\vgprAddr+0]  // offset *= bytes/element
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
/* 8x8 thread-tile                        */
/******************************************/
.macro MAC_8x8_X0
v_mac_f32 v[vgprValuC+0+0*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0]
s_setprio 1 // Raise priority while processing macs
v_mac_f32 v[vgprValuC+1+0*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+2+0*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+3+0*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+4+0*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+5+0*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+6+0*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+7+0*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+0+1*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+1+1*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+2+1*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+3+1*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+4+1*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+5+1*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+6+1*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+7+1*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+0+2*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+1+2*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+2+2*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+3+2*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+4+2*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+5+2*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+6+2*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+7+2*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+0+3*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+1+3*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+2+3*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+3+3*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+4+3*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+5+3*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+6+3*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+7+3*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+0+4*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+1+4*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+2+4*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+3+4*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+4+4*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+5+4*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+6+4*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+7+4*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+4]
v_mac_f32 v[vgprValuC+0+5*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+1+5*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+2+5*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+3+5*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+4+5*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+5+5*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+6+5*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+7+5*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+5]
v_mac_f32 v[vgprValuC+0+6*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+1+6*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+2+6*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+3+6*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+4+6*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+5+6*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+6+6*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+7+6*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+6]
v_mac_f32 v[vgprValuC+0+7*8], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+1+7*8], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+2+7*8], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+3+7*8], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+4+7*8], v[vgprValuA_X0_I0+4], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+5+7*8], v[vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+6+7*8], v[vgprValuA_X0_I0+6], v[vgprValuB_X0_I0+7]
v_mac_f32 v[vgprValuC+7+7*8], v[vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+7]
s_setprio 0 // Reset priority after macs 
.endm



/******************************************/
/* Allocate Resources                     */
/******************************************/

s_mov_b32 m0, 0x1000                               // LDS clamp at 4096 bytes
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
v_lshrrev_b32 v0, 4, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 16
v_and_b32 v1, 15, v[vgprSerial]                    // vectorStaticDiv: v1 = v[vgprSerial] % 16


/* local read addresses: tile assignments b */

/*lr1J = (serial / SG1J) % SG1J*/
v_lshrrev_b32 v2, 4, v0                            // vectorStaticDiv: v2 = v0 / 16
v_and_b32 v3, 15, v0                               // vectorStaticDiv: v3 = v0 % 16


/* local read addresses: final offsets a */

v_lshrrev_b32 v0, 8, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 256
v_and_b32 v2, 255, v[vgprSerial]                   // vectorStaticDiv: v2 = v[vgprSerial] % 256
s_mov_b32 s73, 0x80                                // MT0+PAD
v_mul_lo_u32 v0, s73, v0                           // sgid=sgid*(MT0+PAD)
_v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v1, 0x2 // o = (lroA*VW+sgid*MT0)*bpe


/* local read addresses: final offsets b */

v_lshrrev_b32 v0, 8, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 256
v_and_b32 v1, 255, v[vgprSerial]                   // vectorStaticDiv: v1 = v[vgprSerial] % 256
s_mov_b32 s73, 0x80                                // MT1+PAD
v_mul_lo_u32 v0, s73, v0                           // sgid=sgid*(MT1+PAD)
_v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v3, 0x2 // o = (lroB*VW+sgid*MT1)*bpe


/* local read addresses: declare addresses a */

/* N/A */


/* local read addresses: declare addresses b */

_v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x800, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)



/******************************************/
/* Begin setupNewTile                     */
/******************************************/


/* global read addresses: work-group */

/* graWorkGroup mapping */
s_mov_b32 s77, 0x10000001L                         // magic number for WGM==8
s_mul_hi_u32 s75, s[sgprWorkGroup1], s77           // s_magic mul
s_mul_i32 s74, s[sgprWorkGroup1], s77              // s_magic mul
s_lshr_b64 s[74:75], s[74:75], 31                  // sMagicDiv
s_mul_i32 s75, s74, 8                              // quotient * non-magic divisor
s_sub_u32 s75, s[sgprWorkGroup1], s75              // WorkGroup1=remainder
s_mul_i32 s75, s75, s[sgprNumWorkGroups0]          // (wg1 % WGM)*nwg0
s_add_u32 s75, s75, s[sgprWorkGroup0]              // wgSerial = wg0 + (wg1 % WGM)*nwg0
s_cmp_ge_u32 s74, s[sgprNumFullBlocks]             // blockId >= numFullBlocks ?
s_cmov_b32 s77, s[sgprMagicNumberWgmRemainder1]    // 
s_cselect_b32 s76, s[sgprWgmRemainder1], 8         // 
s_mul_hi_u32 s3, s75, s77                          // s_magic mul
s_mul_i32 s2, s75, s77                             // s_magic mul
s_lshr_b64 s[2:3], s[2:3], 31                      // sMagicDiv
s_mul_i32 s[sgprWorkGroup1], s[sgprWorkGroup0], s76 // quotient * non-magic divisor
s_sub_u32 s[sgprWorkGroup1], s75, s[sgprWorkGroup1] // WorkGroup1=remainder
s_mul_i32 s74, s74, 8                              // blockId * WGM
s_add_u32 s[sgprWorkGroup1], s[sgprWorkGroup1], s74 // wg1 += blockId * WGM


/* global read addresses: tile offset assignment a */

/* LVCA = 128 */
/* v0 = (local)groA-tile = serial%LVCA (note (wgA*MTA) will be added to SRD) */
/* v1 = groA-unroll = serial/LVCA */
v_lshrrev_b32 v1, 7, v[vgprSerial]                 // vectorStaticDiv: v1 = v[vgprSerial] / 128
v_and_b32 v0, 127, v[vgprSerial]                   // vectorStaticDiv: v0 = v[vgprSerial] % 128


/* global read addresses: tile offset assignment b */

/* LVCB = 4 */
/* v2 = (local)groB-tile = serial/LVCB (note (wgB*MTB) will be added to SRD) */
/* v3 = groB-unroll = serial%LVCB */
v_lshrrev_b32 v2, 2, v[vgprSerial]                 // vectorStaticDiv: v2 = v[vgprSerial] / 4
v_and_b32 v3, 3, v[vgprSerial]                     // vectorStaticDiv: v3 = v[vgprSerial] % 4


/* global read addresses: unroll assignment a */

/* v1 */


/* global read addresses: unroll assignment b */

/* v3 */


/* global read addresses: other free assignments */

/* s[sgprWorkGroup2] */


/* global read addresses: tile offsets a */



/* global read addresses: tile offsets b */



/* global read addresses: unroll offsets a */



/* global read addresses: unroll offsets b */



/* global read addresses: final offsets a */

GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  0,  1, 4 // gROA_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetA+0], s[sgprStridesA+0], 2 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+0], s[sgprScalarGlobalReadOffsetA+0], 0x2 // scalar offset *= bytes/element


/* global read addresses: final offsets b */

GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  3,  2, 4 // gROB_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetB+0], s[sgprStridesB+0], 64 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+0], s[sgprScalarGlobalReadOffsetB+0], 0x2 // scalar offset *= bytes/element


/* global read addresses: addresses a */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s77, s[sgprWorkGroup0], 128           // WorkGroup[01] * MT
s_mul_i32 s76, s[sgprWorkGroup0], 128              // WorkGroup[01] * MT
s_sub_u32 s[sgprShadowLimitA+0], s[sgprTensor2dSizeA], s76 // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s[sgprTensor2dSizeA+1], s77 // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x2 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s75, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s74, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s76, s76, s74                            // accum wg term to tilestart
s_addc_u32 s77, s77, s75                           // accum wg term to tilestart
s_lshl_b64 s[76:77], s[76:77], 2                   // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s76    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s77   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdA+0], s[sgprSrdA+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: addresses b */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s77, s[sgprWorkGroup1], 128           // WorkGroup[01] * MT
s_mul_i32 s76, s[sgprWorkGroup1], 128              // WorkGroup[01] * MT
s_mul_hi_u32 s77, s76, s[sgprStridesB+0]           // tlu=0, scaled tile-offset by stride
s_mul_i32 s76, s76, s[sgprStridesB+0]              // tlu=0, scaled tile-offset by stride
s_sub_u32 s[sgprShadowLimitB+0], s[sgprTensor2dSizeB], s76 // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s[sgprTensor2dSizeB+1], s77 // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x2 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s75, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s74, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s76, s76, s74                            // accum wg term to tilestart
s_addc_u32 s77, s77, s75                           // accum wg term to tilestart
s_lshl_b64 s[76:77], s[76:77], 2                   // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s76    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s77   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdB+0], s[sgprSrdB+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: increments a */

s_mul_i32 s[sgprGlobalReadIncsA+0], 0x10, s[sgprStrideAL] // incrAL = strideL*4*bpe (unrollIdx)


/* global read addresses: increments b */

s_mov_b32 s[sgprGlobalReadIncsB+0], 0x10           // incr = 4*bpe


/******************************************/
/* Local Write Addresses                  */
/******************************************/

/* lwaTileAssignmentA = v0 */

/* lwaTileAssignmentB = v2 */

/* lwaUnrollAssignmentA = v1 */

/* lwaUnrollAssignmentB = v3 */


/* local write addresses: first offset a */

v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x80, v1     // lwAL**(MTA + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x2 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe


/* local write addresses: first offset b */

v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x80, v3     // lwBL**(MTB + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrB], v2, v[vgprLocalWriteAddrB], 0x2 // lwFOB = (lwBB + lwBL*(MT1J+PAD))*bpe
_v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x800, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=512*4







/* declare loop num iterations */


v_mov_b32 v[vgprValuC+0], 0x0                      // initC
v_mov_b32 v[vgprValuC+1], 0x0                      // initC
v_mov_b32 v[vgprValuC+2], 0x0                      // initC
v_mov_b32 v[vgprValuC+3], 0x0                      // initC
v_mov_b32 v[vgprValuC+4], 0x0                      // initC
v_mov_b32 v[vgprValuC+5], 0x0                      // initC
v_mov_b32 v[vgprValuC+6], 0x0                      // initC
v_mov_b32 v[vgprValuC+7], 0x0                      // initC
v_mov_b32 v[vgprValuC+8], 0x0                      // initC
v_mov_b32 v[vgprValuC+9], 0x0                      // initC
v_mov_b32 v[vgprValuC+10], 0x0                     // initC
v_mov_b32 v[vgprValuC+11], 0x0                     // initC
v_mov_b32 v[vgprValuC+12], 0x0                     // initC
v_mov_b32 v[vgprValuC+13], 0x0                     // initC
v_mov_b32 v[vgprValuC+14], 0x0                     // initC
v_mov_b32 v[vgprValuC+15], 0x0                     // initC
v_mov_b32 v[vgprValuC+16], 0x0                     // initC
v_mov_b32 v[vgprValuC+17], 0x0                     // initC
v_mov_b32 v[vgprValuC+18], 0x0                     // initC
v_mov_b32 v[vgprValuC+19], 0x0                     // initC
v_mov_b32 v[vgprValuC+20], 0x0                     // initC
v_mov_b32 v[vgprValuC+21], 0x0                     // initC
v_mov_b32 v[vgprValuC+22], 0x0                     // initC
v_mov_b32 v[vgprValuC+23], 0x0                     // initC
v_mov_b32 v[vgprValuC+24], 0x0                     // initC
v_mov_b32 v[vgprValuC+25], 0x0                     // initC
v_mov_b32 v[vgprValuC+26], 0x0                     // initC
v_mov_b32 v[vgprValuC+27], 0x0                     // initC
v_mov_b32 v[vgprValuC+28], 0x0                     // initC
v_mov_b32 v[vgprValuC+29], 0x0                     // initC
v_mov_b32 v[vgprValuC+30], 0x0                     // initC
v_mov_b32 v[vgprValuC+31], 0x0                     // initC
v_mov_b32 v[vgprValuC+32], 0x0                     // initC
v_mov_b32 v[vgprValuC+33], 0x0                     // initC
v_mov_b32 v[vgprValuC+34], 0x0                     // initC
v_mov_b32 v[vgprValuC+35], 0x0                     // initC
v_mov_b32 v[vgprValuC+36], 0x0                     // initC
v_mov_b32 v[vgprValuC+37], 0x0                     // initC
v_mov_b32 v[vgprValuC+38], 0x0                     // initC
v_mov_b32 v[vgprValuC+39], 0x0                     // initC
v_mov_b32 v[vgprValuC+40], 0x0                     // initC
v_mov_b32 v[vgprValuC+41], 0x0                     // initC
v_mov_b32 v[vgprValuC+42], 0x0                     // initC
v_mov_b32 v[vgprValuC+43], 0x0                     // initC
v_mov_b32 v[vgprValuC+44], 0x0                     // initC
v_mov_b32 v[vgprValuC+45], 0x0                     // initC
v_mov_b32 v[vgprValuC+46], 0x0                     // initC
v_mov_b32 v[vgprValuC+47], 0x0                     // initC
v_mov_b32 v[vgprValuC+48], 0x0                     // initC
v_mov_b32 v[vgprValuC+49], 0x0                     // initC
v_mov_b32 v[vgprValuC+50], 0x0                     // initC
v_mov_b32 v[vgprValuC+51], 0x0                     // initC
v_mov_b32 v[vgprValuC+52], 0x0                     // initC
v_mov_b32 v[vgprValuC+53], 0x0                     // initC
v_mov_b32 v[vgprValuC+54], 0x0                     // initC
v_mov_b32 v[vgprValuC+55], 0x0                     // initC
v_mov_b32 v[vgprValuC+56], 0x0                     // initC
v_mov_b32 v[vgprValuC+57], 0x0                     // initC
v_mov_b32 v[vgprValuC+58], 0x0                     // initC
v_mov_b32 v[vgprValuC+59], 0x0                     // initC
v_mov_b32 v[vgprValuC+60], 0x0                     // initC
v_mov_b32 v[vgprValuC+61], 0x0                     // initC
v_mov_b32 v[vgprValuC+62], 0x0                     // initC
v_mov_b32 v[vgprValuC+63], 0x0                     // initC

s_lshr_b32 s[sgprLoopCounters+0], s[sgprSizesSum+0], 2 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 4
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounters+0] // copy loop counter

s_and_b32 s[sgprStaggerUIter], s[sgprOrigStaggerUIter], s[sgprWorkGroup0] // Compute actual stagger start for this tile
s_lshl_b32 s[sgprStaggerUIter], s[sgprStaggerUIter], 4 // shift by StaggerUStride

/* SRDs += (StaggerUIter) * GlobalReadIncsA+0 */
s_mul_i32 s73, s[sgprStaggerUIter], s[sgprGlobalReadIncsA+0] //  stagger byte offset
s_mul_hi_i32 s[sgprWrapUA+1], s[sgprLoopCounters+0], s[sgprGlobalReadIncsA+0] // Number of bytes accessed by the unroll loop
s_mul_i32 s[sgprWrapUA+0], s[sgprLoopCounters+0], s[sgprGlobalReadIncsA+0] // Number of bytes accessed by the unroll loop
s_sub_u32 s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0], s[sgprWrapUA+0] // remove one iteration
s_subb_u32 s[sgprWrapUA+1], s[sgprWrapUA+1], 0     // remove one iteration
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s73       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s73 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* SRDs += (StaggerUIter) * GlobalReadIncsB+0 */
s_mul_i32 s73, s[sgprStaggerUIter], s[sgprGlobalReadIncsB+0] //  stagger byte offset
s_mul_hi_i32 s[sgprWrapUB+1], s[sgprLoopCounters+0], s[sgprGlobalReadIncsB+0] // Number of bytes accessed by the unroll loop
s_mul_i32 s[sgprWrapUB+0], s[sgprLoopCounters+0], s[sgprGlobalReadIncsB+0] // Number of bytes accessed by the unroll loop
s_sub_u32 s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0], s[sgprWrapUB+0] // remove one iteration
s_subb_u32 s[sgprWrapUB+1], s[sgprWrapUB+1], 0     // remove one iteration
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s73       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s73 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
s_add_u32 s[sgprStaggerUIter], s[sgprStaggerUIter], 1 // Subtract (PGR-1); StaggerUIter now contains target iteration to wrap

/* local read addresses: init pointers a */


/* localReadInitPointers */

/* local read addresses: init pointers b */


/* localReadInitPointers */


/******************************************/
/* End setupNewTile                       */
/******************************************/


/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/

openLoopL_8:
s_cmp_le_u32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0002                          // don't enter LoopL
label_0001:


/******************************************/
/* Unroll Loop 1/1 - Begin                */
/******************************************/

label_0009: // LoopCopy1 

buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // G -> Reg 0_0_1_0

/* global read inc A loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s74, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s75, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s74       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s75      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s74 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s75 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s74, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s75, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s74       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s75      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s74 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s75 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

s_waitcnt vmcnt(0)                                 // 5wait for global read

s_barrier //PGR=0, prior iter done reading lds


/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:1024 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 1024


/* local write b */

ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:256 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 256

s_waitcnt lgkmcnt(0)                               // 2prefetch wait for local write

s_barrier //




/* iter 0 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+2], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+4], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+5], v[vgprLocalReadAddrA] offset:320 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+6], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+7], v[vgprLocalReadAddrA] offset:448 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+2], v[vgprLocalReadAddrB] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+3], v[vgprLocalReadAddrB] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+4], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+5], v[vgprLocalReadAddrB] offset:320 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+6], v[vgprLocalReadAddrB] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+7], v[vgprLocalReadAddrB] offset:448 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->128 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_8x8_X0

/* iter 1 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:576 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+2], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:704 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+4], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+5], v[vgprLocalReadAddrA] offset:832 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+6], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+7], v[vgprLocalReadAddrA] offset:960 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:576 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+2], v[vgprLocalReadAddrB] offset:640 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+3], v[vgprLocalReadAddrB] offset:704 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+4], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+5], v[vgprLocalReadAddrB] offset:832 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+6], v[vgprLocalReadAddrB] offset:896 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+7], v[vgprLocalReadAddrB] offset:960 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->256 */

/* local read increment b */
/* N/A, lro->256 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_8x8_X0

/* iter 2 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:1088 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+2], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:1216 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+4], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+5], v[vgprLocalReadAddrA] offset:1344 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+6], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+7], v[vgprLocalReadAddrA] offset:1472 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:1088 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+2], v[vgprLocalReadAddrB] offset:1152 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+3], v[vgprLocalReadAddrB] offset:1216 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+4], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+5], v[vgprLocalReadAddrB] offset:1344 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+6], v[vgprLocalReadAddrB] offset:1408 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+7], v[vgprLocalReadAddrB] offset:1472 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->384 */

/* local read increment b */
/* N/A, lro->384 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_8x8_X0



/* iter 3 (last) */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:1536 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:1600 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+2], v[vgprLocalReadAddrA] offset:1664 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:1728 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+4], v[vgprLocalReadAddrA] offset:1792 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+5], v[vgprLocalReadAddrA] offset:1856 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+6], v[vgprLocalReadAddrA] offset:1920 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+7], v[vgprLocalReadAddrA] offset:1984 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:1600 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+2], v[vgprLocalReadAddrB] offset:1664 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+3], v[vgprLocalReadAddrB] offset:1728 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+4], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+5], v[vgprLocalReadAddrB] offset:1856 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+6], v[vgprLocalReadAddrB] offset:1920 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+7], v[vgprLocalReadAddrB] offset:1984 // L -> Reg lro=384 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(0)                               // 1wait for local read old=0 new=0
MAC_8x8_X0

/******************************************/
/* Unrolled Loop - End                    */
/******************************************/


/* closeLoop loopL finalLoop=1 tailLoop=0 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x0            // counterL==0
s_cbranch_scc0 label_0001                          // restart LoopL
label_0003: // unroll loop odditer exit
label_0002:


/******************************************/
/* Tail Loop                              */
/******************************************/


//numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_and_b32 s[sgprLoopCounters+0], 3, s[sgprSizesSum+0] // s[sgprLoopCounters+0] = s[sgprSizesSum+0] % 4
s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIterL == 0
s_cbranch_scc1 label_0006                          // skip to end of tail loop b/c numIter==0


/* remove stagger offsets for tail loop */

s_sub_i32 s73, 2, s[sgprStaggerUIter]              // 
s_mul_i32 s73, s73, s[sgprGlobalReadIncsA+0]       // start offset S in bytes
s_sub_u32 s73, s73, s[sgprWrapUA]                  // S - WrapU
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s73       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s73 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

s_sub_i32 s73, 2, s[sgprStaggerUIter]              // 
s_mul_i32 s73, s73, s[sgprGlobalReadIncsB+0]       // start offset S in bytes
s_sub_u32 s73, s73, s[sgprWrapUB]                  // S - WrapU
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s73       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s73 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32


/* global read a */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LA+0+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LA+1+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // load one buffer value


/* global read b */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LB+0+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LB+1+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // load one buffer value

s_waitcnt vmcnt(0)                                 // 2wait for global read

s_barrier //




/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:1024 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 1024


/* local write b */

ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:256 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 256

s_waitcnt lgkmcnt(0)                               // 5wait for local write

s_barrier //


/* tail loop: macs */

s_cmp_le_u32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0006                          // don't enter LoopL
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
label_0005:


/* local read a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+2], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+4], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+5], v[vgprLocalReadAddrA] offset:320 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+6], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+7], v[vgprLocalReadAddrA] offset:448 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+2], v[vgprLocalReadAddrB] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+3], v[vgprLocalReadAddrB] offset:192 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+4], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+5], v[vgprLocalReadAddrB] offset:320 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+6], v[vgprLocalReadAddrB] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+7], v[vgprLocalReadAddrB] offset:448 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

s_mov_b32 s73, 0x200                               // inc
_v_add_co_u32 v[vgprLocalReadAddrA], vcc, s73, v[vgprLocalReadAddrA] // lrA += 512 (LSU*(MT+PAD)*bpe)


/* local read inc b */

s_mov_b32 s73, 0x200                               // inc
_v_add_co_u32 v[vgprLocalReadAddrB], vcc, s73, v[vgprLocalReadAddrB] // lrB += 512 (LSU*(MT+PAD)*bpe)

s_waitcnt lgkmcnt(0)                               // 4wait for local read

MAC_8x8_X0

/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL (toilLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x0            // counterL==0
s_cbranch_scc0 label_0005                          // restart LoopL
label_0006:

Summation_End_11:
/* endSummation: add vgpr 64...84 to pool */

s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000                // 
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000                // 
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in post-loop SRD


s_mul_i32 s58, 0x80, s[sgprWorkGroup1]             // <- wg1*MT1
s_mul_hi_u32 s57, s58, s[sgprStridesC+0]           // Scale s58 by Stride
s_mul_i32 s56, s58, s[sgprStridesC+0]              // Scale s58 by Stride
s_lshl_b64 s[56:57], s[56:57], 2                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s57       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s57       // add hi to SRD

s_mul_hi_u32 s57, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s56, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[56:57], s[56:57], 2                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s57       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s57       // add hi to SRD




/* not-LocalSplitU: global write indices */

/* computeStoreVgprs */
v_lshrrev_b32 v65, 4, v[vgprSerial]                // vectorStaticDiv: v65 = v[vgprSerial] / 16
v_and_b32 v64, 15, v[vgprSerial]                   // vectorStaticDiv: v64 = v[vgprSerial] % 16
v_mul_lo_u32 v66, v65, s[sgprStridesC+0]           // rowStart vgpr

s_mul_i32 s56, 0x80, s[sgprWorkGroup0]             // s56 = wg0*MT0
_v_add_co_u32 v64, vcc, s56, v64                   // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s58, 0x80, s[sgprWorkGroup1]             // <- wg1*MT1
_v_add_co_u32 v65, vcc, s58, v65                   // coord1 = tid1*VW + wg1*MT1


/* not-LocalSplitU: global write */

s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 GW_Beta_18                          // Branch if Beta is not zero

/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s56, 127, s[sgprSizeC0I]                 // s56 = s[sgprSizeC0I] % 128
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B0_E1_17                         // jump if edges required
s_and_b32 s56, 127, s[sgprSizeC1J]                 // s56 = s[sgprSizeC1J] % 128
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B0_E1_17                         // jump if edges required
GW_B0_E0_14:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=64 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (0,4,0,0:vw1); (0,5,0,0:vw1); (0,6,0,0:vw1); (0,7,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (1,4,0,0:vw1); (1,5,0,0:vw1); (1,6,0,0:vw1); (1,7,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (2,4,0,0:vw1); (2,5,0,0:vw1); (2,6,0,0:vw1); (2,7,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1); (3,4,0,0:vw1); (3,5,0,0:vw1); (3,6,0,0:vw1); (3,7,0,0:vw1); (4,0,0,0:vw1); (4,1,0,0:vw1); (4,2,0,0:vw1); (4,3,0,0:vw1); (4,4,0,0:vw1); (4,5,0,0:vw1); (4,6,0,0:vw1); (4,7,0,0:vw1); (5,0,0,0:vw1); (5,1,0,0:vw1); (5,2,0,0:vw1); (5,3,0,0:vw1); (5,4,0,0:vw1); (5,5,0,0:vw1); (5,6,0,0:vw1); (5,7,0,0:vw1); (6,0,0,0:vw1); (6,1,0,0:vw1); (6,2,0,0:vw1); (6,3,0,0:vw1); (6,4,0,0:vw1); (6,5,0,0:vw1); (6,6,0,0:vw1); (6,7,0,0:vw1); (7,0,0,0:vw1); (7,1,0,0:vw1); (7,2,0,0:vw1); (7,3,0,0:vw1); (7,4,0,0:vw1); (7,5,0,0:vw1); (7,6,0,0:vw1); (7,7,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v69, v66, v64, 0x2                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
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
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
/* (d1,vc1,d0,vc0)=(2,0,4,0) */
/* (d1,vc1,d0,vc0)=(2,0,5,0) */
/* (d1,vc1,d0,vc0)=(2,0,6,0) */
/* (d1,vc1,d0,vc0)=(2,0,7,0) */
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
/* (d1,vc1,d0,vc0)=(3,0,3,0) */
/* (d1,vc1,d0,vc0)=(3,0,4,0) */
/* (d1,vc1,d0,vc0)=(3,0,5,0) */
/* (d1,vc1,d0,vc0)=(3,0,6,0) */
/* (d1,vc1,d0,vc0)=(3,0,7,0) */
/* (d1,vc1,d0,vc0)=(4,0,0,0) */
/* (d1,vc1,d0,vc0)=(4,0,1,0) */
/* (d1,vc1,d0,vc0)=(4,0,2,0) */
/* (d1,vc1,d0,vc0)=(4,0,3,0) */
/* (d1,vc1,d0,vc0)=(4,0,4,0) */
/* (d1,vc1,d0,vc0)=(4,0,5,0) */
/* (d1,vc1,d0,vc0)=(4,0,6,0) */
/* (d1,vc1,d0,vc0)=(4,0,7,0) */
/* (d1,vc1,d0,vc0)=(5,0,0,0) */
/* (d1,vc1,d0,vc0)=(5,0,1,0) */
/* (d1,vc1,d0,vc0)=(5,0,2,0) */
/* (d1,vc1,d0,vc0)=(5,0,3,0) */
/* (d1,vc1,d0,vc0)=(5,0,4,0) */
/* (d1,vc1,d0,vc0)=(5,0,5,0) */
/* (d1,vc1,d0,vc0)=(5,0,6,0) */
/* (d1,vc1,d0,vc0)=(5,0,7,0) */
/* (d1,vc1,d0,vc0)=(6,0,0,0) */
/* (d1,vc1,d0,vc0)=(6,0,1,0) */
/* (d1,vc1,d0,vc0)=(6,0,2,0) */
/* (d1,vc1,d0,vc0)=(6,0,3,0) */
/* (d1,vc1,d0,vc0)=(6,0,4,0) */
/* (d1,vc1,d0,vc0)=(6,0,5,0) */
/* (d1,vc1,d0,vc0)=(6,0,6,0) */
/* (d1,vc1,d0,vc0)=(6,0,7,0) */
/* (d1,vc1,d0,vc0)=(7,0,0,0) */
/* (d1,vc1,d0,vc0)=(7,0,1,0) */
/* (d1,vc1,d0,vc0)=(7,0,2,0) */
/* (d1,vc1,d0,vc0)=(7,0,3,0) */
/* (d1,vc1,d0,vc0)=(7,0,4,0) */
/* (d1,vc1,d0,vc0)=(7,0,5,0) */
/* (d1,vc1,d0,vc0)=(7,0,6,0) */
/* (d1,vc1,d0,vc0)=(7,0,7,0) */

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (0, 4, 0, 0), (0, 5, 0, 0), (0, 6, 0, 0), (0, 7, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (1, 4, 0, 0), (1, 5, 0, 0), (1, 6, 0, 0), (1, 7, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (2, 4, 0, 0), (2, 5, 0, 0), (2, 6, 0, 0), (2, 7, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0), (3, 4, 0, 0), (3, 5, 0, 0), (3, 6, 0, 0), (3, 7, 0, 0), (4, 0, 0, 0), (4, 1, 0, 0), (4, 2, 0, 0), (4, 3, 0, 0), (4, 4, 0, 0), (4, 5, 0, 0), (4, 6, 0, 0), (4, 7, 0, 0), (5, 0, 0, 0), (5, 1, 0, 0), (5, 2, 0, 0), (5, 3, 0, 0), (5, 4, 0, 0), (5, 5, 0, 0), (5, 6, 0, 0), (5, 7, 0, 0), (6, 0, 0, 0), (6, 1, 0, 0), (6, 2, 0, 0), (6, 3, 0, 0), (6, 4, 0, 0), (6, 5, 0, 0), (6, 6, 0, 0), (6, 7, 0, 0), (7, 0, 0, 0), (7, 1, 0, 0), (7, 2, 0, 0), (7, 3, 0, 0), (7, 4, 0, 0), (7, 5, 0, 0), (7, 6, 0, 0), (7, 7, 0, 0)] */
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
buffer_store_dword v0, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v1, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v2, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v3, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v4, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v5, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v6, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v7, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v8, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v9, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v10, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v11, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v12, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v13, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v14, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v15, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v16, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v17, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v18, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v19, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v20, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v21, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v22, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v23, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v24, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v25, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v26, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v27, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v28, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v29, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v30, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v31, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v32, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v33, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v34, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v35, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v36, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v37, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v38, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v39, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v40, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v41, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v42, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v43, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v44, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v45, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v46, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v47, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v48, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v49, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v50, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v51, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v52, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v53, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v54, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v55, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v56, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v57, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
buffer_store_dword v58, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D
buffer_store_dword v59, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
buffer_store_dword v60, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D
buffer_store_dword v61, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
buffer_store_dword v62, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D
buffer_store_dword v63, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_branch label_0025                                // jump to end
GW_B0_E1_17:

/* allocate 36 sgpr. perBatch=6 perElement=2 elements=15 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (0,4,0,0:vw1); (0,5,0,0:vw1); (0,6,0,0:vw1); (0,7,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (1,4,0,0:vw1); (1,5,0,0:vw1); (1,6,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v70, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v70, -1, v70, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v72, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v72, -1, v72, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v74, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v76, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v77, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v78, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v80, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[84:85]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[86:87], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[86:87], s[56:57], s[86:87]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[86:87]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[88:89], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[88:89], s[56:57], s[88:89]             // in0 && in1
_v_add_lshl_u32 v82, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v82, -1, v82, s[88:89]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[90:91], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[90:91], s[56:57], s[90:91]             // in0 && in1
_v_add_lshl_u32 v83, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v83, -1, v83, s[90:91]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (0, 4, 0, 0), (0, 5, 0, 0), (0, 6, 0, 0), (0, 7, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (1, 4, 0, 0), (1, 5, 0, 0), (1, 6, 0, 0)] */
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

/* apply mask, calc new C and issue write */
buffer_store_dword v0, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v1, v70, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v2, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v3, v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v4, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v5, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v6, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v7, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v8, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v9, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v10, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v11, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v12, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v13, v82, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v14, v83, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #1 (d1,d0,vc1,vc0) =
   (1,7,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (2,4,0,0:vw1); (2,5,0,0:vw1); (2,6,0,0:vw1); (2,7,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1); (3,4,0,0:vw1); (3,5,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v70, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v70, -1, v70, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v72, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v72, -1, v72, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v74, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v76, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(2,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v78, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v80, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[84:85]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[86:87], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[86:87], s[56:57], s[86:87]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[86:87]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[88:89], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[88:89], s[56:57], s[88:89]             // in0 && in1
_v_add_lshl_u32 v82, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v82, -1, v82, s[88:89]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[90:91], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[90:91], s[56:57], s[90:91]             // in0 && in1
_v_add_lshl_u32 v83, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v83, -1, v83, s[90:91]               // clip if OOB. offset

/* rC *= alpha batchEements=[(1, 7, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (2, 4, 0, 0), (2, 5, 0, 0), (2, 6, 0, 0), (2, 7, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0), (3, 4, 0, 0), (3, 5, 0, 0)] */
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

/* apply mask, calc new C and issue write */
buffer_store_dword v15, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v16, v70, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v17, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v18, v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v19, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v20, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v21, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v22, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v23, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v24, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v25, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v26, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v27, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v28, v82, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v29, v83, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #2 (d1,d0,vc1,vc0) =
   (3,6,0,0:vw1); (3,7,0,0:vw1); (4,0,0,0:vw1); (4,1,0,0:vw1); (4,2,0,0:vw1); (4,3,0,0:vw1); (4,4,0,0:vw1); (4,5,0,0:vw1); (4,6,0,0:vw1); (4,7,0,0:vw1); (5,0,0,0:vw1); (5,1,0,0:vw1); (5,2,0,0:vw1); (5,3,0,0:vw1); (5,4,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(3,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(3,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v70, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v70, -1, v70, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v71, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v72, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v72, -1, v72, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v74, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v76, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(4,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v78, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v79, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v80, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[84:85]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[86:87], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[86:87], s[56:57], s[86:87]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[86:87]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[88:89], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[88:89], s[56:57], s[88:89]             // in0 && in1
_v_add_lshl_u32 v82, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v82, -1, v82, s[88:89]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[90:91], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[90:91], s[56:57], s[90:91]             // in0 && in1
_v_add_lshl_u32 v83, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v83, -1, v83, s[90:91]               // clip if OOB. offset

/* rC *= alpha batchEements=[(3, 6, 0, 0), (3, 7, 0, 0), (4, 0, 0, 0), (4, 1, 0, 0), (4, 2, 0, 0), (4, 3, 0, 0), (4, 4, 0, 0), (4, 5, 0, 0), (4, 6, 0, 0), (4, 7, 0, 0), (5, 0, 0, 0), (5, 1, 0, 0), (5, 2, 0, 0), (5, 3, 0, 0), (5, 4, 0, 0)] */
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

/* apply mask, calc new C and issue write */
buffer_store_dword v30, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v31, v70, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v32, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v33, v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v34, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v35, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v36, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v37, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v38, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v39, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v40, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v41, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v42, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v43, v82, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v44, v83, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #3 (d1,d0,vc1,vc0) =
   (5,5,0,0:vw1); (5,6,0,0:vw1); (5,7,0,0:vw1); (6,0,0,0:vw1); (6,1,0,0:vw1); (6,2,0,0:vw1); (6,3,0,0:vw1); (6,4,0,0:vw1); (6,5,0,0:vw1); (6,6,0,0:vw1); (6,7,0,0:vw1); (7,0,0,0:vw1); (7,1,0,0:vw1); (7,2,0,0:vw1); (7,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(5,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v70, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v70, -1, v70, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(5,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v72, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v72, -1, v72, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v74, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v74, -1, v74, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v76, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v76, -1, v76, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v78, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v78, -1, v78, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(6,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v80, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v80, -1, v80, s[84:85]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[86:87], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[86:87], s[56:57], s[86:87]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[86:87]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[88:89], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[88:89], s[56:57], s[88:89]             // in0 && in1
_v_add_lshl_u32 v82, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v82, -1, v82, s[88:89]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[90:91], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[90:91], s[56:57], s[90:91]             // in0 && in1
_v_add_lshl_u32 v83, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v83, -1, v83, s[90:91]               // clip if OOB. offset

/* rC *= alpha batchEements=[(5, 5, 0, 0), (5, 6, 0, 0), (5, 7, 0, 0), (6, 0, 0, 0), (6, 1, 0, 0), (6, 2, 0, 0), (6, 3, 0, 0), (6, 4, 0, 0), (6, 5, 0, 0), (6, 6, 0, 0), (6, 7, 0, 0), (7, 0, 0, 0), (7, 1, 0, 0), (7, 2, 0, 0), (7, 3, 0, 0)] */
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

/* apply mask, calc new C and issue write */
buffer_store_dword v45, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v46, v70, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v47, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v48, v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v49, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v50, v74, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v51, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v52, v76, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v53, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v54, v78, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v55, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v56, v80, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v57, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v58, v82, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v59, v83, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #4 (d1,d0,vc1,vc0) =
   (7,4,0,0:vw1); (7,5,0,0:vw1); (7,6,0,0:vw1); (7,7,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(7,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v70, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v70, -1, v70, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(7,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v72, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v72, -1, v72, s[68:69]               // clip if OOB. offset

/* rC *= alpha batchEements=[(7, 4, 0, 0), (7, 5, 0, 0), (7, 6, 0, 0), (7, 7, 0, 0)] */
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha

/* apply mask, calc new C and issue write */
buffer_store_dword v60, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v61, v70, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v62, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v63, v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0025                                // jump to end
GW_Beta_18:
/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s56, 127, s[sgprSizeC0I]                 // s56 = s[sgprSizeC0I] % 128
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B1_E1_24                         // jump if edges required
s_and_b32 s56, 127, s[sgprSizeC1J]                 // s56 = s[sgprSizeC1J] % 128
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B1_E1_24                         // jump if edges required
GW_B1_E0_21:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=14 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (0,4,0,0:vw1); (0,5,0,0:vw1); (0,6,0,0:vw1); (0,7,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (1,4,0,0:vw1); (1,5,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v69, v66, v64, 0x2                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
buffer_load_dword v71, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
buffer_load_dword v72, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
buffer_load_dword v73, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
buffer_load_dword v74, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
buffer_load_dword v75, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
buffer_load_dword v76, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
buffer_load_dword v77, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v78, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
buffer_load_dword v79, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
buffer_load_dword v80, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
buffer_load_dword v81, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
buffer_load_dword v82, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
buffer_load_dword v83, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (0, 4, 0, 0), (0, 5, 0, 0), (0, 6, 0, 0), (0, 7, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (1, 4, 0, 0), (1, 5, 0, 0)] */
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

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+0], v70, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v0, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+1], v71, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v1, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+2], v72, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v2, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+3], v73, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v3, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+4], v74, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v4, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+5], v75, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v5, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+6], v76, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v6, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+7], v77, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v7, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+8], v78, s[sgprBeta]         // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v8, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+9], v79, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v9, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+10], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v10, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+11], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v11, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+12], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v12, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+13], v83, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v13, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #1 (d1,d0,vc1,vc0) =
   (1,6,0,0:vw1); (1,7,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (2,4,0,0:vw1); (2,5,0,0:vw1); (2,6,0,0:vw1); (2,7,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,7,0) */
buffer_load_dword v71, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v72, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
buffer_load_dword v73, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
buffer_load_dword v74, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
buffer_load_dword v75, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,4,0) */
buffer_load_dword v76, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,5,0) */
buffer_load_dword v77, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,6,0) */
buffer_load_dword v78, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,7,0) */
buffer_load_dword v79, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v80, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
buffer_load_dword v81, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
buffer_load_dword v82, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,3,0) */
buffer_load_dword v83, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc

/* rC *= alpha batchEements=[(1, 6, 0, 0), (1, 7, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (2, 4, 0, 0), (2, 5, 0, 0), (2, 6, 0, 0), (2, 7, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0)] */
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

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+14], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v14, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+15], v71, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v15, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+16], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v16, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+17], v73, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v17, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+18], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v18, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+19], v75, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v19, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+20], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v20, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+21], v77, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v21, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+22], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v22, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+23], v79, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v23, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+24], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v24, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+25], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v25, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+26], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v26, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+27], v83, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v27, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #2 (d1,d0,vc1,vc0) =
   (3,4,0,0:vw1); (3,5,0,0:vw1); (3,6,0,0:vw1); (3,7,0,0:vw1); (4,0,0,0:vw1); (4,1,0,0:vw1); (4,2,0,0:vw1); (4,3,0,0:vw1); (4,4,0,0:vw1); (4,5,0,0:vw1); (4,6,0,0:vw1); (4,7,0,0:vw1); (5,0,0,0:vw1); (5,1,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(3,0,4,0) */
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,5,0) */
buffer_load_dword v71, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,6,0) */
buffer_load_dword v72, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,7,0) */
buffer_load_dword v73, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v74, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,1,0) */
buffer_load_dword v75, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,2,0) */
buffer_load_dword v76, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,3,0) */
buffer_load_dword v77, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,4,0) */
buffer_load_dword v78, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,5,0) */
buffer_load_dword v79, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,6,0) */
buffer_load_dword v80, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,7,0) */
buffer_load_dword v81, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v82, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,1,0) */
buffer_load_dword v83, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc

/* rC *= alpha batchEements=[(3, 4, 0, 0), (3, 5, 0, 0), (3, 6, 0, 0), (3, 7, 0, 0), (4, 0, 0, 0), (4, 1, 0, 0), (4, 2, 0, 0), (4, 3, 0, 0), (4, 4, 0, 0), (4, 5, 0, 0), (4, 6, 0, 0), (4, 7, 0, 0), (5, 0, 0, 0), (5, 1, 0, 0)] */
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

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+28], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v28, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+29], v71, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v29, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+30], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v30, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+31], v73, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v31, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+32], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v32, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+33], v75, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v33, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+34], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v34, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+35], v77, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v35, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+36], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v36, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+37], v79, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v37, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+38], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v38, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+39], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v39, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+40], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v40, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+41], v83, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v41, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #3 (d1,d0,vc1,vc0) =
   (5,2,0,0:vw1); (5,3,0,0:vw1); (5,4,0,0:vw1); (5,5,0,0:vw1); (5,6,0,0:vw1); (5,7,0,0:vw1); (6,0,0,0:vw1); (6,1,0,0:vw1); (6,2,0,0:vw1); (6,3,0,0:vw1); (6,4,0,0:vw1); (6,5,0,0:vw1); (6,6,0,0:vw1); (6,7,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(5,0,2,0) */
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,3,0) */
buffer_load_dword v71, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,4,0) */
buffer_load_dword v72, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,5,0) */
buffer_load_dword v73, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,6,0) */
buffer_load_dword v74, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,7,0) */
buffer_load_dword v75, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v76, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,1,0) */
buffer_load_dword v77, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,2,0) */
buffer_load_dword v78, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,3,0) */
buffer_load_dword v79, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,4,0) */
buffer_load_dword v80, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,5,0) */
buffer_load_dword v81, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,6,0) */
buffer_load_dword v82, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,7,0) */
buffer_load_dword v83, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc

/* rC *= alpha batchEements=[(5, 2, 0, 0), (5, 3, 0, 0), (5, 4, 0, 0), (5, 5, 0, 0), (5, 6, 0, 0), (5, 7, 0, 0), (6, 0, 0, 0), (6, 1, 0, 0), (6, 2, 0, 0), (6, 3, 0, 0), (6, 4, 0, 0), (6, 5, 0, 0), (6, 6, 0, 0), (6, 7, 0, 0)] */
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

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+42], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v42, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+43], v71, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v43, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+44], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v44, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+45], v73, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v45, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+46], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v46, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+47], v75, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v47, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+48], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v48, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+49], v77, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v49, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+50], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v50, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+51], v79, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v51, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+52], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v52, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+53], v81, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v53, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+54], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v54, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(13)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+55], v83, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v55, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #4 (d1,d0,vc1,vc0) =
   (7,0,0,0:vw1); (7,1,0,0:vw1); (7,2,0,0:vw1); (7,3,0,0:vw1); (7,4,0,0:vw1); (7,5,0,0:vw1); (7,6,0,0:vw1); (7,7,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(7,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 64               // scale StrideC *= 16 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,1,0) */
buffer_load_dword v71, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:64 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,2,0) */
buffer_load_dword v72, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,3,0) */
buffer_load_dword v73, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:192 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,4,0) */
buffer_load_dword v74, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,5,0) */
buffer_load_dword v75, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:320 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,6,0) */
buffer_load_dword v76, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:384 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,7,0) */
buffer_load_dword v77, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:448 // load C for beta calc

/* rC *= alpha batchEements=[(7, 0, 0, 0), (7, 1, 0, 0), (7, 2, 0, 0), (7, 3, 0, 0), (7, 4, 0, 0), (7, 5, 0, 0), (7, 6, 0, 0), (7, 7, 0, 0)] */
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+56], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 64               // scale StrideD *= 16 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v56, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+57], v71, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v57, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:64,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+58], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v58, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+59], v73, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v59, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:192,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+60], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v60, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+61], v75, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v61, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:320,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+62], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v62, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:384,  // store D

s_waitcnt vmcnt(7)                                 // wait C (interleaved)
v_mac_f32 v[vgprValuC+63], v77, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v63, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:448,  // store D
s_branch label_0025                                // jump to end
GW_B1_E1_24:

/* allocate 20 sgpr. perBatch=6 perElement=2 elements=7 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (0,4,0,0:vw1); (0,5,0,0:vw1); (0,6,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (0, 4, 0, 0), (0, 5, 0, 0), (0, 6, 0, 0)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+0], v70, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v0, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+1], v72, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v1, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+2], v74, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v2, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+3], v76, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v3, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+4], v78, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v4, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+5], v80, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v5, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+6], v82, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v6, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #1 (d1,d0,vc1,vc0) =
   (0,7,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (1,4,0,0:vw1); (1,5,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 7, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (1, 4, 0, 0), (1, 5, 0, 0)] */
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+7], v70, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v7, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+8], v72, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v8, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+9], v74, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v9, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+10], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v10, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+11], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v11, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+12], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v12, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+13], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v13, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #2 (d1,d0,vc1,vc0) =
   (1,6,0,0:vw1); (1,7,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (2,4,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 6, 0, 0), (1, 7, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (2, 4, 0, 0)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+14], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v14, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+15], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v15, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+16], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v16, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+17], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v17, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+18], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v18, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+19], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v19, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+20], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v20, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #3 (d1,d0,vc1,vc0) =
   (2,5,0,0:vw1); (2,6,0,0:vw1); (2,7,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(2,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(2, 5, 0, 0), (2, 6, 0, 0), (2, 7, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0)] */
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+21], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v21, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+22], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v22, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+23], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v23, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+24], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v24, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+25], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v25, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+26], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v26, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+27], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v27, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #4 (d1,d0,vc1,vc0) =
   (3,4,0,0:vw1); (3,5,0,0:vw1); (3,6,0,0:vw1); (3,7,0,0:vw1); (4,0,0,0:vw1); (4,1,0,0:vw1); (4,2,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(3,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(3, 4, 0, 0), (3, 5, 0, 0), (3, 6, 0, 0), (3, 7, 0, 0), (4, 0, 0, 0), (4, 1, 0, 0), (4, 2, 0, 0)] */
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+28], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v28, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+29], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v29, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+30], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v30, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+31], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v31, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+32], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v32, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+33], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v33, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+34], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v34, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #5 (d1,d0,vc1,vc0) =
   (4,3,0,0:vw1); (4,4,0,0:vw1); (4,5,0,0:vw1); (4,6,0,0:vw1); (4,7,0,0:vw1); (5,0,0,0:vw1); (5,1,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(4,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(4,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(4, 3, 0, 0), (4, 4, 0, 0), (4, 5, 0, 0), (4, 6, 0, 0), (4, 7, 0, 0), (5, 0, 0, 0), (5, 1, 0, 0)] */
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+35], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v35, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+36], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v36, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+37], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v37, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+38], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v38, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+39], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v39, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+40], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v40, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+41], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v41, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #6 (d1,d0,vc1,vc0) =
   (5,2,0,0:vw1); (5,3,0,0:vw1); (5,4,0,0:vw1); (5,5,0,0:vw1); (5,6,0,0:vw1); (5,7,0,0:vw1); (6,0,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(5,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(5,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(5, 2, 0, 0), (5, 3, 0, 0), (5, 4, 0, 0), (5, 5, 0, 0), (5, 6, 0, 0), (5, 7, 0, 0), (6, 0, 0, 0)] */
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+42], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v42, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+43], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v43, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+44], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v44, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+45], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v45, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+46], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v46, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+47], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v47, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+48], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v48, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #7 (d1,d0,vc1,vc0) =
   (6,1,0,0:vw1); (6,2,0,0:vw1); (6,3,0,0:vw1); (6,4,0,0:vw1); (6,5,0,0:vw1); (6,6,0,0:vw1); (6,7,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(6,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(6,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(6, 1, 0, 0), (6, 2, 0, 0), (6, 3, 0, 0), (6, 4, 0, 0), (6, 5, 0, 0), (6, 6, 0, 0), (6, 7, 0, 0)] */
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+49], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v49, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+50], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v50, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+51], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v51, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+52], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v52, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+53], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v53, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+54], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v54, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+55], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v55, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #8 (d1,d0,vc1,vc0) =
   (7,0,0,0:vw1); (7,1,0,0:vw1); (7,2,0,0:vw1); (7,3,0,0:vw1); (7,4,0,0:vw1); (7,5,0,0:vw1); (7,6,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(7,0,0,0) */
_v_add_co_u32 v65, vcc, v65, 16                    // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 16               // scale stride
_v_add_u32 v66, v66, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v64, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v64, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,1,0) */
_v_add_co_u32 v67, vcc, v64, 16                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v71, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v71, -1, v71, s[64:65]               // clip if OOB. offset
buffer_load_dword v72, v71, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,2,0) */
_v_add_co_u32 v67, vcc, v64, 32                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v73, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v73, -1, v73, s[66:67]               // clip if OOB. offset
buffer_load_dword v74, v73, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,3,0) */
_v_add_co_u32 v67, vcc, v64, 48                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v75, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v75, -1, v75, s[68:69]               // clip if OOB. offset
buffer_load_dword v76, v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,4,0) */
_v_add_co_u32 v67, vcc, v64, 64                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v77, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v77, -1, v77, s[70:71]               // clip if OOB. offset
buffer_load_dword v78, v77, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,5,0) */
s_mov_b32 s56, 80                                  // coordOffset0 d0=5 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v79, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v79, -1, v79, s[72:73]               // clip if OOB. offset
buffer_load_dword v80, v79, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(7,0,6,0) */
s_mov_b32 s56, 96                                  // coordOffset0 d0=6 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v81, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v81, -1, v81, s[74:75]               // clip if OOB. offset
buffer_load_dword v82, v81, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(7, 0, 0, 0), (7, 1, 0, 0), (7, 2, 0, 0), (7, 3, 0, 0), (7, 4, 0, 0), (7, 5, 0, 0), (7, 6, 0, 0)] */
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+56], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v56, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+57], v72, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v57, v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+58], v74, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v58, v73, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+59], v76, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v59, v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+60], v78, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v60, v77, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+61], v80, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v61, v79, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+62], v82, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v62, v81, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #9 (d1,d0,vc1,vc0) =
   (7,7,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(7,0,7,0) */
s_mov_b32 s56, 112                                 // coordOffset0 d0=7 vc0=0
_v_add_co_u32 v67, vcc, v64, s56                   // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v67, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v65, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v69, v66, v67, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v69, -1, v69, s[62:63]               // clip if OOB. offset
buffer_load_dword v70, v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(7, 7, 0, 0)] */
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+63], v70, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v63, v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0025                                // jump to end
label_0025:

label_0026:  /// KernelEnd
s_endpgm                                           // Kernel End


