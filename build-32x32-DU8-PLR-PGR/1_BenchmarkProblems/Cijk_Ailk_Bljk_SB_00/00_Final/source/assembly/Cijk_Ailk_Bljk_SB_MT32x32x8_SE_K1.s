

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU" 
.text
.protected Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1
.globl Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1
.p2align 8
.type Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1,@function
.amdgpu_hsa_kernel Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1
Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 80 // bytes of kern args
  workitem_vgpr_count = 47 // vgprs
  wavefront_sgpr_count = 98 // sgprs
  compute_pgm_rsrc1_vgprs = 11 // floor((47-1)/4)
  compute_pgm_rsrc1_sgprs = 13 // floor((98-1)/8)
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
/* ThreadTile= 4 x 4 */
/* SubGroup= 8 x 8 */
/* VectorWidth=1 */
/* GlobalLoadVectorWidthA=1, GlobalLoadVectorWidthB=1 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1
    SymbolName: 'Cijk_Ailk_Bljk_SB_MT32x32x8_SE_K1@kd'
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
      NumSGPRs:             98
      NumVGPRs:             47
      MaxFlatWorkGroupSize: 64
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
.set vgprValuA_X0_I0, 16
.set vgprValuA_X1_I0, 20
.set vgprG2LA, 24
.set vgprValuB_X0_I0, 28
.set vgprValuB_X1_I0, 32
.set vgprG2LB, 36
.set vgprLocalWriteAddrA, 40
.set vgprLocalWriteAddrB, 41
.set vgprGlobalReadOffsetA, 42
.set vgprGlobalReadOffsetB, 43
.set vgprLocalReadAddrA, 44
.set vgprLocalReadAddrB, 45
.set vgprSerial, 46
/* Num VGPR=47 */

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
.set sgprScalarGlobalReadOffsetB, 74
/* max SGPR=98 */

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
/* 4x4 thread-tile                        */
/******************************************/
.macro MAC_4x4_X0
v_mac_f32 v[vgprValuC+0+0*4], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0]
s_setprio 1 // Raise priority while processing macs
v_mac_f32 v[vgprValuC+1+0*4], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+2+0*4], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+3+0*4], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+0]
v_mac_f32 v[vgprValuC+0+1*4], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+1+1*4], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+2+1*4], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+3+1*4], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+1]
v_mac_f32 v[vgprValuC+0+2*4], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+1+2*4], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+2+2*4], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+3+2*4], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+2]
v_mac_f32 v[vgprValuC+0+3*4], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+1+3*4], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+2+3*4], v[vgprValuA_X0_I0+2], v[vgprValuB_X0_I0+3]
v_mac_f32 v[vgprValuC+3+3*4], v[vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+3]
s_setprio 0 // Reset priority after macs 
.endm
.macro MAC_4x4_X1
v_mac_f32 v[vgprValuC+0+0*4], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0]
s_setprio 1 // Raise priority while processing macs
v_mac_f32 v[vgprValuC+1+0*4], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0]
v_mac_f32 v[vgprValuC+2+0*4], v[vgprValuA_X1_I0+2], v[vgprValuB_X1_I0+0]
v_mac_f32 v[vgprValuC+3+0*4], v[vgprValuA_X1_I0+3], v[vgprValuB_X1_I0+0]
v_mac_f32 v[vgprValuC+0+1*4], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1]
v_mac_f32 v[vgprValuC+1+1*4], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1]
v_mac_f32 v[vgprValuC+2+1*4], v[vgprValuA_X1_I0+2], v[vgprValuB_X1_I0+1]
v_mac_f32 v[vgprValuC+3+1*4], v[vgprValuA_X1_I0+3], v[vgprValuB_X1_I0+1]
v_mac_f32 v[vgprValuC+0+2*4], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2]
v_mac_f32 v[vgprValuC+1+2*4], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2]
v_mac_f32 v[vgprValuC+2+2*4], v[vgprValuA_X1_I0+2], v[vgprValuB_X1_I0+2]
v_mac_f32 v[vgprValuC+3+2*4], v[vgprValuA_X1_I0+3], v[vgprValuB_X1_I0+2]
v_mac_f32 v[vgprValuC+0+3*4], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3]
v_mac_f32 v[vgprValuC+1+3*4], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3]
v_mac_f32 v[vgprValuC+2+3*4], v[vgprValuA_X1_I0+2], v[vgprValuB_X1_I0+3]
v_mac_f32 v[vgprValuC+3+3*4], v[vgprValuA_X1_I0+3], v[vgprValuB_X1_I0+3]
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

/*lr0I = serial % MFMA_MN*/
v_lshrrev_b32 v0, 5, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 32(MFMA_MN)
v_and_b32 v1, 31, v[vgprSerial]                    // vectorStaticDiv: v1 = v[vgprSerial] % 32(MFMA_MN)

/* local read addresses: tile assignments b */

/*lr1J = (serial / SG1J) % SG1J*/
v_lshrrev_b32 v2, 3, v0                            // vectorStaticDiv: v2 = v0 / 8
v_and_b32 v3, 7, v0                                // vectorStaticDiv: v3 = v0 % 8

/*lr1J = (serial / MFMA_MN) % MFMA_K*/
v_lshrrev_b32 v2, 1, v0                            // vectorStaticDiv: v2 = v0 / 2(MFMA_K)
v_and_b32 v3, 1, v0                                // vectorStaticDiv: v3 = v0 % 2(MFMA_K)

// ----- Tony comment -----
// v1 lr0I
// v2 sgId
// v3 lr1J


/* local read addresses: final offsets a */
// v[vgprLocalReadAddrA] = sgid * (MT1+PAD) * MFMA_K + ((lid / MFMA_MN) * (MT1+PAD)) + (lid % MFMA_MN)
v_mul_lo_u32 v4, v3, 0x20
v_add_u32 v4, v4, v1
v_lshrrev_b32 v0, 6, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 64
v_and_b32 v2, 63, v[vgprSerial]                    // vectorStaticDiv: v2 = v[vgprSerial] % 64
s_mov_b32 s77, 0x40                                // MT0+PAD
v_mul_lo_u32 v0, s77, v0                           // sgid=sgid*(MT0+PAD)
_v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v4, 0x2 // o = (lroA*VW+sgid*MT0)*bpe


/* local read addresses: final offsets b */
v_mul_lo_u32 v4, v3, 0x20
v_add_u32 v4, v4, v1                               // v1 = lr0I + lr1J * (MT0+PAD)
v_lshrrev_b32 v0, 6, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 64
v_and_b32 v1, 63, v[vgprSerial]                    // vectorStaticDiv: v1 = v[vgprSerial] % 64
s_mov_b32 s77, 0x40                                // MT1+PAD
v_mul_lo_u32 v0, s77, v0                           // sgid=sgid*(MT1+PAD)
_v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v4, 0x2 // o = (lroB*VW+sgid*MT1)*bpe


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


/* global read addresses: tile offset assignment b */

/* LVCB = 8 */
/* v2 = (local)groB-tile = serial/LVCB (note (wgB*MTB) will be added to SRD) */
/* v3 = groB-unroll = serial%LVCB */
v_lshrrev_b32 v2, 3, v[vgprSerial]                 // vectorStaticDiv: v2 = v[vgprSerial] / 8
v_and_b32 v3, 7, v[vgprSerial]                     // vectorStaticDiv: v3 = v[vgprSerial] % 8


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
s_mul_i32 s[sgprScalarGlobalReadOffsetA+1], s[sgprStridesA+0], 4 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+1], s[sgprScalarGlobalReadOffsetA+1], 0x2 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+2], s[sgprStridesA+0], 6 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+2], s[sgprScalarGlobalReadOffsetA+2], 0x2 // scalar offset *= bytes/element


/* global read addresses: final offsets b */

GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  3,  2, 4 // gROB_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetB+0], s[sgprStridesB+0], 8 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+0], s[sgprScalarGlobalReadOffsetB+0], 0x2 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+1], s[sgprStridesB+0], 16 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+1], s[sgprScalarGlobalReadOffsetB+1], 0x2 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+2], s[sgprStridesB+0], 24 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+2], s[sgprScalarGlobalReadOffsetB+2], 0x2 // scalar offset *= bytes/element


/* global read addresses: addresses a */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s81, s[sgprWorkGroup0], 32            // WorkGroup[01] * MT
s_mul_i32 s80, s[sgprWorkGroup0], 32               // WorkGroup[01] * MT
s_sub_u32 s[sgprShadowLimitA+0], s[sgprTensor2dSizeA], s80 // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s[sgprTensor2dSizeA+1], s81 // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x2 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s79, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s78, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s80, s80, s78                            // accum wg term to tilestart
s_addc_u32 s81, s81, s79                           // accum wg term to tilestart
s_lshl_b64 s[80:81], s[80:81], 2                   // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s80    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s81   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdA+0], s[sgprSrdA+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: addresses b */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s81, s[sgprWorkGroup1], 32            // WorkGroup[01] * MT
s_mul_i32 s80, s[sgprWorkGroup1], 32               // WorkGroup[01] * MT
s_mul_hi_u32 s81, s80, s[sgprStridesB+0]           // tlu=0, scaled tile-offset by stride
s_mul_i32 s80, s80, s[sgprStridesB+0]              // tlu=0, scaled tile-offset by stride
s_sub_u32 s[sgprShadowLimitB+0], s[sgprTensor2dSizeB], s80 // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s[sgprTensor2dSizeB+1], s81 // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x2 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s79, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s78, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s80, s80, s78                            // accum wg term to tilestart
s_addc_u32 s81, s81, s79                           // accum wg term to tilestart
s_lshl_b64 s[80:81], s[80:81], 2                   // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s80    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s81   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdB+0], s[sgprSrdB+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: increments a */

s_mul_i32 s[sgprGlobalReadIncsA+0], 0x20, s[sgprStrideAL] // incrAL = strideL*8*bpe (unrollIdx)


/* global read addresses: increments b */

s_mov_b32 s[sgprGlobalReadIncsB+0], 0x20           // incr = 8*bpe


/******************************************/
/* Local Write Addresses                  */
/******************************************/

/* lwaTileAssignmentA = v0 */

/* lwaTileAssignmentB = v2 */

/* lwaUnrollAssignmentA = v1 */

/* lwaUnrollAssignmentB = v3 */


/* local write addresses: first offset a */

v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x20, v1     // lwAL**(MTA + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x2 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe


/* local write addresses: first offset b */

v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x20, v3     // lwBL**(MTB + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrB], v2, v[vgprLocalWriteAddrB], 0x2 // lwFOB = (lwBB + lwBL*(MT1J+PAD))*bpe
_v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x400, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=256*4







/* declare loop num iterations */


s_lshr_b32 s[sgprLoopCounters+0], s[sgprSizesSum+0], 3 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 8
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounters+0] // copy loop counter

s_and_b32 s[sgprStaggerUIter], s[sgprOrigStaggerUIter], s[sgprWorkGroup0] // Compute actual stagger start for this tile
s_lshl_b32 s[sgprStaggerUIter], s[sgprStaggerUIter], 3 // shift by StaggerUStride

/* SRDs += (StaggerUIter) * GlobalReadIncsA+0 */
s_mul_i32 s77, s[sgprStaggerUIter], s[sgprGlobalReadIncsA+0] //  stagger byte offset
s_mul_hi_i32 s[sgprWrapUA+1], s[sgprLoopCounters+0], s[sgprGlobalReadIncsA+0] // Number of bytes accessed by the unroll loop
s_mul_i32 s[sgprWrapUA+0], s[sgprLoopCounters+0], s[sgprGlobalReadIncsA+0] // Number of bytes accessed by the unroll loop
s_sub_u32 s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0], s[sgprWrapUA+0] // remove one iteration
s_subb_u32 s[sgprWrapUA+1], s[sgprWrapUA+1], 0     // remove one iteration
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s77       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s77 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* SRDs += (StaggerUIter) * GlobalReadIncsB+0 */
s_mul_i32 s77, s[sgprStaggerUIter], s[sgprGlobalReadIncsB+0] //  stagger byte offset
s_mul_hi_i32 s[sgprWrapUB+1], s[sgprLoopCounters+0], s[sgprGlobalReadIncsB+0] // Number of bytes accessed by the unroll loop
s_mul_i32 s[sgprWrapUB+0], s[sgprLoopCounters+0], s[sgprGlobalReadIncsB+0] // Number of bytes accessed by the unroll loop
s_sub_u32 s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0], s[sgprWrapUB+0] // remove one iteration
s_subb_u32 s[sgprWrapUB+1], s[sgprWrapUB+1], 0     // remove one iteration
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s77       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s77 // limit -= inc)
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
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1], offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2], offen offset:0 // G -> Reg 0_0_3_0

buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1], offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2], offen offset:0 // G -> Reg 0_0_3_0


/* global read inc A loopL */
s_add_u32 s80, s[sgprLoopCounters+0], 1            // remove pf(1)
s_cmp_eq_u32 s[sgprStaggerUIter], s80              // Is this wrapIter? (pf)
s_cselect_b32 s78, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s79, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s78       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s79      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s78 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s79 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32


/* global read inc B loopL */
s_add_u32 s80, s[sgprLoopCounters+0], 1            // remove pf(1)
s_cmp_eq_u32 s[sgprStaggerUIter], s80              // Is this wrapIter? (pf)
s_cselect_b32 s78, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s79, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s78       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s79      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s78 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s79 // limit -= inc)
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


s_mul_i32 s80, 0x20, s[sgprWorkGroup1]             // <- wg1*MT1
s_mul_hi_u32 s79, s80, s[sgprStridesC+0]           // Scale s80 by Stride
s_mul_i32 s78, s80, s[sgprStridesC+0]              // Scale s80 by Stride
s_lshl_b64 s[78:79], s[78:79], 2                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s78        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s79       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s78        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s79       // add hi to SRD

s_mul_hi_u32 s79, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s78, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[78:79], s[78:79], 2                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s78        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s79       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s78        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s79       // add hi to SRD


v_accvgpr_write_b32 a0,  0x0
v_accvgpr_write_b32 a1,  0x0
v_accvgpr_write_b32 a2,  0x0
v_accvgpr_write_b32 a3,  0x0
v_accvgpr_write_b32 a4,  0x0
v_accvgpr_write_b32 a5,  0x0
v_accvgpr_write_b32 a6,  0x0
v_accvgpr_write_b32 a7,  0x0
v_accvgpr_write_b32 a8,  0x0
v_accvgpr_write_b32 a9,  0x0
v_accvgpr_write_b32 a10, 0x0
v_accvgpr_write_b32 a11, 0x0
v_accvgpr_write_b32 a12, 0x0
v_accvgpr_write_b32 a13, 0x0
v_accvgpr_write_b32 a14, 0x0
v_accvgpr_write_b32 a15, 0x0


s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIter0I == 0
s_cbranch_scc1 label_0004                          // after InitC, skip to end of prefetch last iter b/c numIter==0

s_waitcnt vmcnt(0)                                 // 8wait for global read


/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:256 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 256
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:512 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 512
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:768 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 768


/* local write b */

ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:32 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 32
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:64 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 64
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:96 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 96


/* local write swap a */



/* local write swap b */




s_waitcnt lgkmcnt(0)                               // 0prefetch wait for local write

// Skip barrier: NumThreads=64


/* local read prefetch a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read prefetch b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->32 */


/* local read inc b */

/* N/A, lro->32 */



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






buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1], offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2], offen offset:0 // G -> Reg 0_0_3_0

/* iter 1 */


/* local read a */
ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0

/* local read b */
ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->96 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=8 new=8
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]

buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // G -> Reg 0_0_1_0

/* iter 3 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1], offen offset:0 // G -> Reg 0_0_2_0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->160 */

/* local read increment b */
/* N/A, lro->160 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=8 new=8
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]

buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2], offen offset:0 // G -> Reg 0_0_3_0

/* iter 5 */


/* local read a */
ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* global read inc A loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s78, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s79, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s78       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s79      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s78 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s79 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* local read b */
ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->224 */

/* local read increment b */
/* N/A, lro->224 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=8 new=8
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]

/* global read inc B loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s78, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s79, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s78       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s79      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s78 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s79 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(7)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:2048 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 2048
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(6)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:2304 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 2304
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(5)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:2560 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 2560
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(4)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:2816 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 2816
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(3)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:2048 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 2048
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(2)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:2080 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 2080
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:2112 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 2112
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:2144 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 2144

/* local write swap offsets a */

/* local write swap offsets b */

/* local read swap offsets a */

/* local read swap internal offset -> 2048 */

/* local read swap offsets b */

/* local read swap internal offset -> 2048 */

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */



/* iter 7 (last) */

s_waitcnt lgkmcnt(0)                               // 3wait for local write

// Skip barrier: NumThreads=64


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:2048 // L -> Reg lro=0 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:2048 // L -> Reg lro=0 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read inc a */
/* N/A, lro->32 */

/* local read inc b */
/* N/A, lro->32 */
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]

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


buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1], offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2], offen offset:0 // G -> Reg 0_0_3_0


/* iter 1 */


/* local read a */
ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:2304 // L -> Reg lro=64 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0

/* local read b */
ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:2304 // L -> Reg lro=64 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->96 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=8 new=8
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]

buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // G -> Reg 0_0_1_0

/* iter 3 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:2560 // L -> Reg lro=128 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1], offen offset:0 // G -> Reg 0_0_2_0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:2560 // L -> Reg lro=128 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->160 */

/* local read increment b */
/* N/A, lro->160 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=8 new=8
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]

buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2], offen offset:0 // G -> Reg 0_0_3_0

/* iter 5 */


/* local read a */
ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:2816 // L -> Reg lro=192 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* global read inc A loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s78, s[sgprWrapUA+0], s[sgprGlobalReadIncsA+0] // incLower <- ?
s_cselect_b32 s79, s[sgprWrapUA+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s78       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], s79      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s78 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], s79 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* local read b */
ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:2816 // L -> Reg lro=192 swapByteOffset=2048 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->224 */

/* local read increment b */
/* N/A, lro->224 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=8 new=8
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]

/* (localWrite + swap local pointers iteration) */


/* global read inc B loopL */
s_cmp_eq_u32 s[sgprLoopCounters+0], s[sgprStaggerUIter] // Is this the wrapIter?
s_cselect_b32 s78, s[sgprWrapUB+0], s[sgprGlobalReadIncsB+0] // incLower <- ?
s_cselect_b32 s79, s[sgprWrapUB+1], 0              // incUpper <- ?
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s78       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], s79      // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s78 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], s79 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(7)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(6)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:256 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 256
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(5)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:512 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 512
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(4)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:768 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 768
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(3)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(2)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:32 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 32
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:64 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 64
/* sched write - iter 6 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:96 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 96

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



/* iter 7 (last) */

s_waitcnt lgkmcnt(0)                               // 3wait for local write

// Skip barrier: NumThreads=64


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read inc a */
/* N/A, lro->32 */

/* local read inc b */
/* N/A, lro->32 */
v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]

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
v_xor_b32 v[vgprLocalReadAddrA], 0x800, v[vgprLocalReadAddrA] // swap Red Blk
v_xor_b32 v[vgprLocalReadAddrB], 0x800, v[vgprLocalReadAddrB] // swap Red Blk
label_0002:


/******************************************/
/* Opt NoLoadLoop - Begin                  */
/******************************************/

s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 OptNLL_End_12                       // Branch if Beta is not zero

s_cmp_eq_u32 s[sgprAlpha], 1.0                     // Alpha == 1.0 ?
s_cbranch_scc0 OptNLL_End_12                       // branch if alpha != 1

/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s78, 31, s[sgprSizeC0I]                  // s78 = s[sgprSizeC0I] % 32
s_add_u32 s80, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s80                // wg0 >= nwg0-1 ?
s_cselect_b32 s78, s78, 0                          // set rMT0
s_cmpk_gt_u32 s78, 0x0                             // rMT0 > 0
s_cbranch_scc1 OptNLL_End_12                       // jump if edges required
s_and_b32 s78, 31, s[sgprSizeC1J]                  // s78 = s[sgprSizeC1J] % 32
s_add_u32 s80, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s80                // wg1 >= nwg1-1
s_cselect_b32 s78, s78, 0                          // set rMT1
s_cmpk_gt_u32 s78, 0x0                             // rMT1 > 0
s_cbranch_scc1 OptNLL_End_12                       // jump if edges required

s_and_b32 s79, 7, s[sgprSizesSum+0]                // s79 = s[sgprSizesSum+0] % 8
s_cmp_eq_u32 s79, 0x0                              // numIterL == 0
s_cbranch_scc0 OptNLL_End_12                       // skip if tail loop required

/* reclaim VGPRS: 24-27, 40-40, 36-39, 41-41, 42-43 */
/* computeStoreVgprs */
v_lshrrev_b32 v24, 5, v[vgprSerial]                // vectorStaticDiv: v25 = v[vgprSerial] / 32
v_mul_lo_u32 v24, v24, 4
v_and_b32 v25, 31, v[vgprSerial]                    // vectorStaticDiv: v24 = v[vgprSerial] % 8
v_mul_lo_u32 v26, v25, s[sgprStridesC+0]           // rowStart vgpr

s_mul_i32 s78, 0x20, s[sgprWorkGroup0]             // s78 = wg0*MT0
_v_add_co_u32 v24, vcc, s78, v24                   // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s80, 0x20, s[sgprWorkGroup1]             // <- wg1*MT1
_v_add_co_u32 v25, vcc, s80, v25                   // coord1 = tid1*VW + wg1*MT1


/* iter 1 */


/* local read a */

ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->96 */


/* local read inc b */

/* N/A, lro->96 */

s_waitcnt lgkmcnt(2)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]

/* iter 3 */


/* local read a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->160 */


/* local read inc b */

/* N/A, lro->160 */

s_waitcnt lgkmcnt(2)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]


/* iter 5 */


/* local read a */

ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->224 */


/* local read inc b */

/* N/A, lro->224 */

s_waitcnt lgkmcnt(2)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]

/* iter 7 */

s_waitcnt lgkmcnt(0)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]

s_nop 8
s_nop 8
s_nop 8
s_nop 8
s_nop 8
s_nop 8
s_nop 8
s_nop 8

/* read c value from accumualted register bank */
v_accvgpr_read_b32 v[vgprValuC+ 0], a0
v_accvgpr_read_b32 v[vgprValuC+ 1], a1
v_accvgpr_read_b32 v[vgprValuC+ 2], a2
v_accvgpr_read_b32 v[vgprValuC+ 3], a3
v_accvgpr_read_b32 v[vgprValuC+ 4], a4
v_accvgpr_read_b32 v[vgprValuC+ 5], a5
v_accvgpr_read_b32 v[vgprValuC+ 6], a6
v_accvgpr_read_b32 v[vgprValuC+ 7], a7
v_accvgpr_read_b32 v[vgprValuC+ 8], a8
v_accvgpr_read_b32 v[vgprValuC+ 9], a9
v_accvgpr_read_b32 v[vgprValuC+10], a10
v_accvgpr_read_b32 v[vgprValuC+11], a11
v_accvgpr_read_b32 v[vgprValuC+12], a12
v_accvgpr_read_b32 v[vgprValuC+13], a13
v_accvgpr_read_b32 v[vgprValuC+14], a14
v_accvgpr_read_b32 v[vgprValuC+15], a15

/* Stores for OptNLL */

/* store element 0 : (0, 0, 0, 0) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v27, v26, v24, 0x2                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
buffer_store_dword v0, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,   // store D

/* store element 1 : (0, 1, 0, 0) */
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
buffer_store_dword v1, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,   // store D

/* store element 2 : (0, 2, 0, 0) */
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
buffer_store_dword v2, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,   // store D

/* store element 3 : (0, 3, 0, 0) */
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
buffer_store_dword v3, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

/* store element 4 : (1, 0, 0, 0) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v4, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,   // store D

/* store element 5 : (1, 1, 0, 0) */
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
buffer_store_dword v5, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,   // store D

/* store element 6 : (1, 2, 0, 0) */
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
buffer_store_dword v6, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,   // store D

/* store element 7 : (1, 3, 0, 0) */
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
buffer_store_dword v7, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

/* store element 8 : (2, 0, 0, 0) */
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v8, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,   // store D

/* store element 9 : (2, 1, 0, 0) */
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
buffer_store_dword v9, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,   // store D

/* store element 10 : (2, 2, 0, 0) */
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
buffer_store_dword v10, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D

/* store element 11 : (2, 3, 0, 0) */
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
buffer_store_dword v11, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

/* store element 12 : (3, 0, 0, 0) */
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v12, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

/* store element 13 : (3, 1, 0, 0) */
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
buffer_store_dword v13, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D

/* store element 14 : (3, 2, 0, 0) */
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
buffer_store_dword v14, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D

/* store element 15 : (3, 3, 0, 0) */
/* (d1,vc1,d0,vc0)=(3,0,3,0) */
buffer_store_dword v15, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

s_endpgm                                           // Kernel End


OptNLL_End_12:




/* iter 1 */


/* local read a */

ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->96 */


/* local read inc b */

/* N/A, lro->96 */

s_waitcnt lgkmcnt(2)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]


/* iter 3 */


/* local read a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->160 */


/* local read inc b */

/* N/A, lro->160 */

s_waitcnt lgkmcnt(2)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]

/* iter 5 */


/* local read a */

ds_read_b32 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X1_I0+0], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

/* N/A, lro->224 */


/* local read inc b */

/* N/A, lro->224 */

s_waitcnt lgkmcnt(2)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]


/* iter 7 */

s_waitcnt lgkmcnt(0)                               // 7wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], a[0:15]


label_0004:


/******************************************/
/* Tail Loop                              */
/******************************************/


/* local write reset offsets a */



/* local write reset offsets b */



//numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_and_b32 s[sgprLoopCounters+0], 7, s[sgprSizesSum+0] // s[sgprLoopCounters+0] = s[sgprSizesSum+0] % 8
s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIterL == 0
s_cbranch_scc1 label_0006                          // skip to end of tail loop b/c numIter==0


/* remove stagger offsets for tail loop */

s_sub_i32 s77, 3, s[sgprStaggerUIter]              // 
s_mul_i32 s77, s77, s[sgprGlobalReadIncsA+0]       // start offset S in bytes
s_sub_u32 s77, s77, s[sgprWrapUA]                  // S - WrapU
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s77       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s77 // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

s_sub_i32 s77, 3, s[sgprStaggerUIter]              // 
s_mul_i32 s77, s77, s[sgprGlobalReadIncsB+0]       // start offset S in bytes
s_sub_u32 s77, s77, s[sgprWrapUB]                  // S - WrapU
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s77       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s77 // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32


/* global read a */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LA+0+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LA+1+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // load one buffer value
/* g2l=2, load component 0 */
buffer_load_dword v[vgprG2LA+2+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1], offen offset:0 // load one buffer value
/* g2l=3, load component 0 */
buffer_load_dword v[vgprG2LA+3+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2], offen offset:0 // load one buffer value


/* global read b */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LB+0+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LB+1+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // load one buffer value
/* g2l=2, load component 0 */
buffer_load_dword v[vgprG2LB+2+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1], offen offset:0 // load one buffer value
/* g2l=3, load component 0 */
buffer_load_dword v[vgprG2LB+3+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2], offen offset:0 // load one buffer value

s_waitcnt vmcnt(0)                                 // 2wait for global read

// Skip barrier: NumThreads=64




/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:256 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 256
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:512 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 512
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:768 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 768


/* local write b */

ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:32 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 32
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:64 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 64
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:96 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 96

s_waitcnt lgkmcnt(0)                               // 5wait for local write

// Skip barrier: NumThreads=64


/* local read reset offsets a */


/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrA], 0x7ff, v[vgprLocalReadAddrA] // reset Red,Blk -> Red


/* local read reset offsets b */


/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrB], 0x7ff, v[vgprLocalReadAddrB] // reset Red,Blk -> Red


/* local read init pointers a */


/* localReadInitPointers */


/* local read init pointers b */


/* localReadInitPointers */


/* tail loop: macs */

s_cmp_le_u32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0006                          // don't enter LoopL
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment

label_0005:
s_cmp_le_i32 s[sgprLoopCounters+0], 0x1            // LoopCounterL < EndCounter
s_cbranch_scc1 label_00055

/* local read a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

s_mov_b32 s77, 0x100                                // inc
_v_add_co_u32 v[vgprLocalReadAddrA], vcc, s77, v[vgprLocalReadAddrA] // lrA += 128 (LSU*(MT+PAD)*bpe)


/* local read inc b */

s_mov_b32 s77, 0x100                                // inc
_v_add_co_u32 v[vgprLocalReadAddrB], vcc, s77, v[vgprLocalReadAddrB] // lrB += 128 (LSU*(MT+PAD)*bpe)

s_waitcnt lgkmcnt(0)                               // 4wait for local read

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]


/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x2 // dec counterL (toilLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x2 // inc counterL
s_cmp_lt_i32 s[sgprLoopCounters+0], 0x2            // counterL<MFMA_K
s_cbranch_scc0 label_0005                          // restart LoopL


/* second taile for MFMA */
label_00055:

s_cmp_le_i32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0006

/* local read a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 4wait for local read

v_and_b32 v47, 63, v[vgprSerial]                   // vectorStaticDiv: v2 = v[vgprSerial] % 64

v_cmp_lt_u32 s[56:57], v47, 0x20

v_cndmask_b32 v[vgprValuA_X0_I0+0], 0, v[vgprValuA_X0_I0+0], s[56:57]

v_cndmask_b32 v[vgprValuB_X0_I0+0], 0, v[vgprValuB_X0_I0+0], s[56:57]

v_mfma_f32_32x32x2f32 a[0:15], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], a[0:15]


s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL (toilLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x0            // counterL==0
s_cbranch_scc0 label_00055                         // restart LoopL
label_0006:

Summation_End_13:
/* endSummation: add vgpr 16...44 to pool */

/* read c value from accumualted register bank */
v_accvgpr_read_b32 v[vgprValuC+ 0], a0
v_accvgpr_read_b32 v[vgprValuC+ 1], a1
v_accvgpr_read_b32 v[vgprValuC+ 2], a2
v_accvgpr_read_b32 v[vgprValuC+ 3], a3
v_accvgpr_read_b32 v[vgprValuC+ 4], a4
v_accvgpr_read_b32 v[vgprValuC+ 5], a5
v_accvgpr_read_b32 v[vgprValuC+ 6], a6
v_accvgpr_read_b32 v[vgprValuC+ 7], a7
v_accvgpr_read_b32 v[vgprValuC+ 8], a8
v_accvgpr_read_b32 v[vgprValuC+ 9], a9
v_accvgpr_read_b32 v[vgprValuC+10], a10
v_accvgpr_read_b32 v[vgprValuC+11], a11
v_accvgpr_read_b32 v[vgprValuC+12], a12
v_accvgpr_read_b32 v[vgprValuC+13], a13
v_accvgpr_read_b32 v[vgprValuC+14], a14
v_accvgpr_read_b32 v[vgprValuC+15], a15


/* not-LocalSplitU: global write indices */

/* computeStoreVgprs */
// v17: ldx1
// v16: ldx0
// v18: ldx1 * stirde_C
v_lshrrev_b32 v16, 5, v[vgprSerial]                // vectorStaticDiv: v17 = v[vgprSerial] / 32
v_mul_lo_u32 v16, v16, 4
v_and_b32 v17, 31, v[vgprSerial]                   // vectorStaticDiv: v16 = v[vgprSerial] % 32
v_mul_lo_u32 v18, v17, s[sgprStridesC+0]           // rowStart vgpr

// v16: wg0*MT0 + ldx0
// v17: wg1*MT1 + ldx1
s_mul_i32 s56, 0x20, s[sgprWorkGroup0]             // s56 = wg0*MT0
_v_add_co_u32 v16, vcc, s56, v16                   // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s58, 0x20, s[sgprWorkGroup1]             // <- wg1*MT1
_v_add_co_u32 v17, vcc, s58, v17                   // coord1 = tid1*VW + wg1*MT1


/* not-LocalSplitU: global write */

s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 GW_Beta_21                          // Branch if Beta is not zero

/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s56, 31, s[sgprSizeC0I]                  // s56 = s[sgprSizeC0I] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B0_E1_20                         // jump if edges required
s_and_b32 s56, 31, s[sgprSizeC1J]                  // s56 = s[sgprSizeC1J] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B0_E1_20                         // jump if edges required
GW_B0_E0_17:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=16 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v21, v18, v16, 0x2                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
/* (d1,vc1,d0,vc0)=(3,0,3,0) */

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0)] */
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

/* apply mask, calc new C and issue write */
buffer_store_dword v0, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v1, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D
buffer_store_dword v2, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D
buffer_store_dword v3, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v4, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v5, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D
buffer_store_dword v6, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D
buffer_store_dword v7, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v8, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v9, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D
buffer_store_dword v10, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D
buffer_store_dword v11, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v12, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v13, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D
buffer_store_dword v14, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D
buffer_store_dword v15, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D
s_branch label_0028                                // jump to end

GW_B0_E1_20:

/* allocate 42 sgpr. perBatch=6 perElement=2 elements=18 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v21, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v21, -1, v21, s[62:63]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v22, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v22, -1, v22, s[64:65]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(0,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v23, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v23, -1, v23, s[66:67]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(0,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v24, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v24, -1, v24, s[68:69]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v16, vcc, v16, 8                     // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v25, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v25, -1, v25, s[70:71]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v26, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v26, -1, v26, s[72:73]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(1,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v27, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v27, -1, v27, s[74:75]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(1,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v28, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v28, -1, v28, s[76:77]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(2,0,0,0) */
_v_add_co_u32 v16, vcc, v16, 8                     // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v29, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v29, -1, v29, s[78:79]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(2,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v30, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v30, -1, v30, s[80:81]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(2,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v31, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v31, -1, v31, s[82:83]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(2,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[84:85], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[84:85]             // in0 && in1
_v_add_lshl_u32 v32, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v32, -1, v32, s[84:85]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(3,0,0,0) */
_v_add_co_u32 v16, vcc, v16, 8                     // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[86:87], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[86:87], s[56:57], s[86:87]             // in0 && in1
_v_add_lshl_u32 v33, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v33, -1, v33, s[86:87]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(3,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[88:89], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[88:89], s[56:57], s[88:89]             // in0 && in1
_v_add_lshl_u32 v34, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v34, -1, v34, s[88:89]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(3,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[90:91], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[90:91], s[56:57], s[90:91]             // in0 && in1
_v_add_lshl_u32 v35, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v35, -1, v35, s[90:91]               // clip if OOB. offset

/* (d1,vc1,d0,vc0)=(3,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[92:93], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[92:93], s[56:57], s[92:93]             // in0 && in1
_v_add_lshl_u32 v36, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v36, -1, v36, s[92:93]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0)] */
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

/* apply mask, calc new C and issue write */
buffer_store_dword v0, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v1, v22, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v2, v23, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v3, v24, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v4, v25, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v5, v26, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v6, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v7, v28, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v8, v29, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v9, v30, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v10, v31, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v11, v32, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v12, v33, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v13, v34, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v14, v35, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v15, v36, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0028                                // jump to end


GW_Beta_21:
/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s56, 31, s[sgprSizeC0I]                  // s56 = s[sgprSizeC0I] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B1_E1_27                         // jump if edges required
s_and_b32 s56, 31, s[sgprSizeC1J]                  // s56 = s[sgprSizeC1J] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B1_E1_27                         // jump if edges required
GW_B1_E0_24:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=22 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1); (2,3,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v21, v18, v16, 0x2                 // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
buffer_load_dword v22, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
buffer_load_dword v23, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:4 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) */
buffer_load_dword v24, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:8 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,3,0) */
buffer_load_dword v25, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:12 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v26, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
buffer_load_dword v27, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:4 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,0) */
buffer_load_dword v28, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:8 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,3,0) */
buffer_load_dword v29, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:12 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,0,0) */
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v30, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,1,0) */
buffer_load_dword v31, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:4 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,2,0) */
buffer_load_dword v32, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:8 // load C for beta calc
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
buffer_load_dword v33, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:12 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,0,0) */
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v34, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,1,0) */
buffer_load_dword v35, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:4 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,2,0) */
buffer_load_dword v36, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:8 // load C for beta calc
/* (d1,vc1,d0,vc0)=(3,0,3,0) */
buffer_load_dword v37, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:12 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0), (2, 3, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0)] */
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

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+0], v22, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v0, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+1], v23, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v1, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+2], v24, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v2, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+3], v25, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v3, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+4], v26, s[sgprBeta]         // finalSum = sum*alpha + C*beta
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v4, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+5], v27, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v5, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+6], v28, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v6, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+7], v29, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v7, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+8], v30, s[sgprBeta]         // finalSum = sum*alpha + C*beta
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v8, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+9], v31, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v9, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+10], v32, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v10, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+11], v33, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v11, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+12], v34, s[sgprBeta]        // finalSum = sum*alpha + C*beta
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], 32        // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v12, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+13], v35, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v13, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:4,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+14], v36, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v14, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:8,  // store D

s_waitcnt vmcnt(15)                                // wait C (interleaved)
v_mac_f32 v[vgprValuC+15], v37, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v15, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:12,  // store D
s_branch label_0028                                // jump to end

GW_B1_E1_27:

/* allocate 28 sgpr. perBatch=6 perElement=2 elements=11 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,1,0,0:vw1); (0,2,0,0:vw1); (0,3,0,0:vw1); (1,0,0,0:vw1); (1,1,0,0:vw1); (1,2,0,0:vw1); (1,3,0,0:vw1); (2,0,0,0:vw1); (2,1,0,0:vw1); (2,2,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v21, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v21, -1, v21, s[62:63]               // clip if OOB. offset
buffer_load_dword v22, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v23, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v23, -1, v23, s[64:65]               // clip if OOB. offset
buffer_load_dword v24, v23, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(0,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                    // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v25, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v25, -1, v25, s[66:67]               // clip if OOB. offset
buffer_load_dword v26, v25, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(0,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v27, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v27, -1, v27, s[68:69]               // clip if OOB. offset
buffer_load_dword v28, v27, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v16, vcc, v16, 8                     // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v29, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v29, -1, v29, s[70:71]               // clip if OOB. offset
buffer_load_dword v30, v29, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[72:73], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[72:73]             // in0 && in1
_v_add_lshl_u32 v31, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v31, -1, v31, s[72:73]               // clip if OOB. offset
buffer_load_dword v32, v31, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(1,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[74:75], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[74:75]             // in0 && in1
_v_add_lshl_u32 v33, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v33, -1, v33, s[74:75]               // clip if OOB. offset
buffer_load_dword v34, v33, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(1,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[76:77], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[76:77]             // in0 && in1
_v_add_lshl_u32 v35, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v35, -1, v35, s[76:77]               // clip if OOB. offset
buffer_load_dword v36, v35, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(2,0,0,0) */
_v_add_co_u32 v16, vcc, v16, 8                     // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[78:79], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[78:79]             // in0 && in1
_v_add_lshl_u32 v37, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v37, -1, v37, s[78:79]               // clip if OOB. offset
buffer_load_dword v38, v37, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(2,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[80:81], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[80:81]             // in0 && in1
_v_add_lshl_u32 v39, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v39, -1, v39, s[80:81]               // clip if OOB. offset
buffer_load_dword v40, v39, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(2,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[82:83], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[82:83]             // in0 && in1
_v_add_lshl_u32 v41, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v41, -1, v41, s[82:83]               // clip if OOB. offset
buffer_load_dword v42, v41, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 3, 0, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 3, 0, 0), (2, 0, 0, 0), (2, 1, 0, 0), (2, 2, 0, 0)] */
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
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+0], v22, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v0, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+1], v24, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v1, v23, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+2], v26, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v2, v25, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+3], v28, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v3, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+4], v30, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v4, v29, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+5], v32, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v5, v31, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+6], v34, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v6, v33, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+7], v36, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v7, v35, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+8], v38, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v8, v37, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+9], v40, s[sgprBeta]         // finalSum = sum*alpha + C*beta
buffer_store_dword v9, v39, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+10], v42, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v10, v41, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #1 (d1,d0,vc1,vc0) =
   (2,3,0,0:vw1); (3,0,0,0:vw1); (3,1,0,0:vw1); (3,2,0,0:vw1); (3,3,0,0:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(2,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[62:63], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v21, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v21, -1, v21, s[62:63]               // clip if OOB. offset
buffer_load_dword v22, v21, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(3,0,0,0) */
_v_add_co_u32 v16, vcc, v16, 8                     // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[56:57], v16, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v23, v18, v16, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v23, -1, v23, s[64:65]               // clip if OOB. offset
buffer_load_dword v24, v23, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(3,0,1,0) */
_v_add_co_u32 v19, vcc, v16, 1                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[66:67], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[66:67]             // in0 && in1
_v_add_lshl_u32 v25, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v25, -1, v25, s[66:67]               // clip if OOB. offset
buffer_load_dword v26, v25, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(3,0,2,0) */
_v_add_co_u32 v19, vcc, v16, 2                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[68:69], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[68:69]             // in0 && in1
_v_add_lshl_u32 v27, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v27, -1, v27, s[68:69]               // clip if OOB. offset
buffer_load_dword v28, v27, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* (d1,vc1,d0,vc0)=(3,0,3,0) */
_v_add_co_u32 v19, vcc, v16, 3                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v19, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[70:71], v17, s[sgprSizeC1J]         // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[70:71]             // in0 && in1
_v_add_lshl_u32 v29, v18, v19, 0x2                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v29, -1, v29, s[70:71]               // clip if OOB. offset
buffer_load_dword v30, v29, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(2, 3, 0, 0), (3, 0, 0, 0), (3, 1, 0, 0), (3, 2, 0, 0), (3, 3, 0, 0)] */
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_mac_f32 v[vgprValuC+11], v22, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v11, v21, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+12], v24, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v12, v23, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+13], v26, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v13, v25, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+14], v28, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v14, v27, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_mac_f32 v[vgprValuC+15], v30, s[sgprBeta]        // finalSum = sum*alpha + C*beta
buffer_store_dword v15, v29, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0028                                // jump to end
label_0028:

label_0029:  /// KernelEnd
s_endpgm                                           // Kernel End


