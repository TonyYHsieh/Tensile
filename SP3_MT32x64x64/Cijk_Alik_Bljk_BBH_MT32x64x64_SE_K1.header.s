

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU" 
.text
.protected Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1
.globl Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1
.p2align 8
.type Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1,@function
.amdgpu_hsa_kernel Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1
Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 148 // bytes of kern args
  workitem_vgpr_count = 108 // vgprs
  wavefront_sgpr_count = 98 // sgprs
  compute_pgm_rsrc1_vgprs = 26 // floor((108-1)/4)
  compute_pgm_rsrc1_sgprs = 12 // floor((98-1)/8)
  compute_pgm_rsrc2_tidig_comp_cnt = 0 // 1D wg
  compute_pgm_rsrc2_tgid_x_en = 1 // wg.x
  compute_pgm_rsrc2_tgid_y_en = 1 // wg.y
  compute_pgm_rsrc2_tgid_z_en = 1 // wg.z
  workgroup_group_segment_byte_size = 30000// lds bytes
  compute_pgm_rsrc2_user_sgpr = 2 // vcc
  kernarg_segment_alignment = 4
  group_segment_alignment = 4
  private_segment_alignment = 4
.end_amd_kernel_code_t

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 4 x 4 */
/* SubGroup= 16 x 32 */
/* VectorWidth=4 */
/* GlobalLoadVectorWidthA=4, GlobalLoadVectorWidthB=4 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1
    SymbolName: 'Cijk_Alik_Bljk_BBH_MT32x64x64_SE_K1@kd'
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
        ValueType:       F16
      - Name:            beta
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       F16
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
      GroupSegmentFixedSize: 28672
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign:  8
      WavefrontSize:        64
      NumSGPRs:             98
      NumVGPRs:             108
      MaxFlatWorkGroupSize: 512
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
.set vgprValuA_X0_I0, 32
.set vgprValuA_X1_I0, 34
.set vgprG2LA, 36
.set vgprValuB_X0_I0, 40
.set vgprValuB_X1_I0, 44
.set vgprG2LB, 48
.set vgprLocalWriteAddrA, 56
.set vgprLocalWriteAddrB, 57
.set vgprGlobalReadOffsetA, 58
.set vgprGlobalReadOffsetB, 59
.set vgprLocalReadAddrA, 60
.set vgprLocalReadAddrB, 61
.set vgprSerial, 62
/* Num VGPR=63 */

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
/* max SGPR=98 */

/* Size Assignments */
.set sgprSizeD0I, sgprSizesFree+0
.set sgprSizeD1J, sgprSizesFree+1
.set sgprSizeDK, sgprSizesFree+2
.set sgprSizeC0I, sgprSizesFree+0
.set sgprSizeC1J, sgprSizesFree+1
.set sgprSizeCK, sgprSizesFree+2
.set sgprSizeAL, sgprSizesSum+0
.set sgprSizeA0I, sgprSizesFree+0
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
.set constStrideAL, 1
.set sgprStrideA0I, sgprStridesA+0
.set sgprStrideAK, sgprStridesA+1
.set constStrideBL, 1
.set sgprStrideB1J, sgprStridesB+0
.set sgprStrideBK, sgprStridesB+1

.set DepthU, 32
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 4
.set SrdShiftLeftB, 4
/* 2GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0x80000000
/* Bits 127:96 of SRD.  Set DataFormat = 32 bit */
.set Srd127_96, 0x0020000
.set BufferOOB, 0x80000000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr vgprOffsetL vgprOffset0I vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideA0I], v[\vgprOffset0I] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x4, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffsetL vgprOffset1J vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x4, v[\vgprAddr+0]     // add prepad for pointer shift
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
/* 4x8 thread-tile                        */
/******************************************/
.macro MAC_4x8_X0
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[0] iui=0
s_setprio 1 // Raise priority while processing macs
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[1]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[4]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[5]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[2] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[3]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[6]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[7]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[8] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[9]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[12]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[13]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[10] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[11]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[14]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[15]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[16] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[17]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[20]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[21]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[18] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[19]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[22]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[23]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[24] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[25]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[28]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[29]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[26] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[27]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[30]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[31]
s_setprio 0 // Reset priority after macs
.endm
.macro MAC_4x8_X1
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[0] iui=0
s_setprio 1 // Raise priority while processing macs
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[1]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[4]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[5]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[2] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[3]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[6]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[7]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[8] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[9]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[12]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[13]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[10] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[11]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[14]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[15]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[16] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[17]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[20]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[21]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[18] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[19]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[22]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[23]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[24] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[25]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[28]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[29]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[26] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[27]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[30]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[31]
s_setprio 0 // Reset priority after macs
.endm




/***** program start from here *****/

