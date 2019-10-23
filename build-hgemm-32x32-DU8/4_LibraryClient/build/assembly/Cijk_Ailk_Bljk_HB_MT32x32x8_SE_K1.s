

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU" 
.text
.protected Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1
.globl Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1
.p2align 8
.type Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1,@function
.amdgpu_hsa_kernel Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1
Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 80 // bytes of kern args
  workitem_vgpr_count = 21 // vgprs
  wavefront_sgpr_count = 78 // sgprs
  compute_pgm_rsrc1_vgprs = 5 // floor((21-1)/4)
  compute_pgm_rsrc1_sgprs = 10 // floor((78-1)/8)
  compute_pgm_rsrc2_tidig_comp_cnt = 0 // 1D wg
  compute_pgm_rsrc2_tgid_x_en = 1 // wg.x
  compute_pgm_rsrc2_tgid_y_en = 1 // wg.y
  compute_pgm_rsrc2_tgid_z_en = 1 // wg.z
  workgroup_group_segment_byte_size = 1638 // lds bytes
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
/* VectorWidth=2 */
/* GlobalLoadVectorWidthA=2, GlobalLoadVectorWidthB=2 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1
    SymbolName: 'Cijk_Ailk_Bljk_HB_MT32x32x8_SE_K1@kd'
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
        ValueType:       F16
        AddrSpaceQual:   Generic
      - Name:            C
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F16
        AddrSpaceQual:   Generic
      - Name:            A
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F16
        AddrSpaceQual:   Generic
      - Name:            B
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F16
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
      GroupSegmentFixedSize: 1638
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign:  8
      WavefrontSize:        64
      NumSGPRs:             78
      NumVGPRs:             21
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
.set vgprValuA_X0_I0, 8
.set vgprG2LA, 8
.set vgprValuB_X0_I0, 10
.set vgprG2LB, 10
.set vgprLocalWriteAddrA, 12
.set vgprLocalWriteAddrB, 13
.set vgprGlobalReadOffsetA, 14
.set vgprGlobalReadOffsetB, 15
.set vgprLocalReadAddrA, 16
.set vgprLocalReadAddrB, 17
.set vgprSerial, 20
/* Num VGPR=21 */

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
/* max SGPR=78 */

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
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffset0I], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x2, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffsetL vgprOffset1J vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate d1 lower
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
/* 4x4 thread-tile                        */
/******************************************/
.macro MAC_4x4_X0
v_pk_fma_f16 v[vgprValuC+0+0*4+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0+0*4+0] op_sel:[0,0,0] op_sel_hi:[1,0,1]
s_setprio 1 // Raise priority while processing macs
v_pk_fma_f16 v[vgprValuC+0+0*4+2], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0+0*4+2] op_sel:[0,1,0] op_sel_hi:[1,1,1]
v_pk_fma_f16 v[vgprValuC+1+0*4+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1+0*4+0] op_sel:[0,0,0] op_sel_hi:[1,0,1]
v_pk_fma_f16 v[vgprValuC+1+0*4+2], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1+0*4+2] op_sel:[0,1,0] op_sel_hi:[1,1,1]
v_pk_fma_f16 v[vgprValuC+0+1*4+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0+1*4+0] op_sel:[0,0,0] op_sel_hi:[1,0,1]
v_pk_fma_f16 v[vgprValuC+0+1*4+2], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0+1*4+2] op_sel:[0,1,0] op_sel_hi:[1,1,1]
v_pk_fma_f16 v[vgprValuC+1+1*4+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1+1*4+0] op_sel:[0,0,0] op_sel_hi:[1,0,1]
v_pk_fma_f16 v[vgprValuC+1+1*4+2], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1+1*4+2] op_sel:[0,1,0] op_sel_hi:[1,1,1]
s_setprio 0 // Reset priority after macs
.endm



/******************************************/
/* Allocate Resources                     */
/******************************************/

s_mov_b32 m0, 0x666                                // LDS clamp at 1638 bytes
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
v_lshrrev_b32 v0, 3, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 8
v_and_b32 v1, 7, v[vgprSerial]                     // vectorStaticDiv: v1 = v[vgprSerial] % 8


/* local read addresses: tile assignments b */

/*lr1J = (serial / SG1J) % SG1J*/
v_lshrrev_b32 v2, 3, v0                            // vectorStaticDiv: v2 = v0 / 8
v_and_b32 v3, 7, v0                                // vectorStaticDiv: v3 = v0 % 8


/* local read addresses: final offsets a */

v_lshrrev_b32 v0, 6, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 64
v_and_b32 v2, 63, v[vgprSerial]                    // vectorStaticDiv: v2 = v[vgprSerial] % 64
s_mov_b32 s73, 0x20                                // MT0+PAD
v_mul_lo_u32 v0, s73, v0                           // sgid=sgid*(MT0+PAD)
v_lshlrev_b32 v1, 1, v1                            // staticMultiply: v1 = v1 * 2
_v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v1, 0x1 // o = (lroA*VW+sgid*MT0)*bpe


/* local read addresses: final offsets b */

v_lshrrev_b32 v0, 6, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 64
v_and_b32 v1, 63, v[vgprSerial]                    // vectorStaticDiv: v1 = v[vgprSerial] % 64
s_mov_b32 s73, 0x20                                // MT1+PAD
v_mul_lo_u32 v0, s73, v0                           // sgid=sgid*(MT1+PAD)
v_lshlrev_b32 v3, 1, v3                            // staticMultiply: v3 = v3 * 2
_v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v3, 0x1 // o = (lroB*VW+sgid*MT1)*bpe


/* local read addresses: declare addresses a */

/* N/A */


/* local read addresses: declare addresses b */

_v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x200, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)



/******************************************/
/* Begin setupNewTile                     */
/******************************************/


/* global read addresses: work-group */

/* graWorkGroup mapping */


/* global read addresses: tile offset assignment a */

/* LVCA = 16 */
/* v0 = (local)groA-tile = serial%LVCA (note (wgA*MTA) will be added to SRD) */
/* v1 = groA-unroll = serial/LVCA */
v_lshrrev_b32 v1, 4, v[vgprSerial]                 // vectorStaticDiv: v1 = v[vgprSerial] / 16
v_and_b32 v0, 15, v[vgprSerial]                    // vectorStaticDiv: v0 = v[vgprSerial] % 16
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



/* global read addresses: tile offsets b */



/* global read addresses: unroll offsets a */



/* global read addresses: unroll offsets b */



/* global read addresses: final offsets a */

GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  0,  1, 4 // gROA_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetA+0], s[sgprStridesA+0], 4 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+0], s[sgprScalarGlobalReadOffsetA+0], 0x1 // scalar offset *= bytes/element


/* global read addresses: final offsets b */

GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  3,  2, 4 // gROB_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetB+0], s[sgprStridesB+0], 16 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+0], s[sgprScalarGlobalReadOffsetB+0], 0x1 // scalar offset *= bytes/element


/* global read addresses: addresses a */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s77, s[sgprWorkGroup0], 32            // WorkGroup[01] * MT
s_mul_i32 s76, s[sgprWorkGroup0], 32               // WorkGroup[01] * MT
s_sub_u32 s[sgprShadowLimitA+0], s[sgprTensor2dSizeA], s76 // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s[sgprTensor2dSizeA+1], s77 // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s75, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s74, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s76, s76, s74                            // accum wg term to tilestart
s_addc_u32 s77, s77, s75                           // accum wg term to tilestart
s_lshl_b64 s[76:77], s[76:77], 1                   // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s76    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s77   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdA+0], s[sgprSrdA+0], 4          // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: addresses b */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s77, s[sgprWorkGroup1], 32            // WorkGroup[01] * MT
s_mul_i32 s76, s[sgprWorkGroup1], 32               // WorkGroup[01] * MT
s_mul_hi_u32 s77, s76, s[sgprStridesB+0]           // tlu=0, scaled tile-offset by stride
s_mul_i32 s76, s76, s[sgprStridesB+0]              // tlu=0, scaled tile-offset by stride
s_sub_u32 s[sgprShadowLimitB+0], s[sgprTensor2dSizeB], s76 // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s[sgprTensor2dSizeB+1], s77 // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s75, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s74, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s76, s76, s74                            // accum wg term to tilestart
s_addc_u32 s77, s77, s75                           // accum wg term to tilestart
s_lshl_b64 s[76:77], s[76:77], 1                   // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s76    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s77   // SRD base = Address+ tileStart1
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

v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x20, v1     // lwAL**(MTA + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x1 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe


/* local write addresses: first offset b */

v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x20, v3     // lwBL**(MTB + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrB], v2, v[vgprLocalWriteAddrB], 0x1 // lwFOB = (lwBB + lwBL*(MT1J+PAD))*bpe
_v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x200, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=256*2







/* declare loop num iterations */


v_mov_b32 v[vgprValuC+0], 0x0                      // initC
v_mov_b32 v[vgprValuC+1], 0x0                      // initC
v_mov_b32 v[vgprValuC+2], 0x0                      // initC
v_mov_b32 v[vgprValuC+3], 0x0                      // initC
v_mov_b32 v[vgprValuC+4], 0x0                      // initC
v_mov_b32 v[vgprValuC+5], 0x0                      // initC
v_mov_b32 v[vgprValuC+6], 0x0                      // initC
v_mov_b32 v[vgprValuC+7], 0x0                      // initC

s_lshr_b32 s[sgprLoopCounters+0], s[sgprSizesSum+0], 3 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 8
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

// Skip barrier: NumThreads=64PGR=0, prior iter done reading lds


/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:256 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 256


/* local write b */

ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:0 // lwoB_0_0_0_0 = (0 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:64 // lwoB_0_1_0_0 = (1 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 64
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:32 // lwoB_0_0_1_0 = (0 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 32
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:96 // lwoB_0_1_1_0 = (1 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 96

s_waitcnt lgkmcnt(0)                               // 2prefetch wait for local write

// Skip barrier: NumThreads=64




/* iter 0 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->32 */

/* local read increment b */
/* N/A, lro->32 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* iter 1 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:96 // L -> Reg lro=32 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:96 // L -> Reg lro=32 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->64 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* iter 2 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:160 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:128 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:160 // L -> Reg lro=64 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->96 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* iter 3 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:192 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:224 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:192 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:224 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->128 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* iter 4 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:288 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:288 // L -> Reg lro=128 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->160 */

/* local read increment b */
/* N/A, lro->160 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* iter 5 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:320 // L -> Reg lro=160 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:352 // L -> Reg lro=160 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:320 // L -> Reg lro=160 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:352 // L -> Reg lro=160 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->192 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* iter 6 */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:416 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:384 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:416 // L -> Reg lro=192 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->224 */

/* local read increment b */
/* N/A, lro->224 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0



/* iter 7 (last) */


/* local read a */
ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:448 // L -> Reg lro=224 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:480 // L -> Reg lro=224 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:448 // L -> Reg lro=224 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:480 // L -> Reg lro=224 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(0)                               // 1wait for local read old=0 new=0
.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

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
s_and_b32 s[sgprLoopCounters+0], 7, s[sgprSizesSum+0] // s[sgprLoopCounters+0] = s[sgprSizesSum+0] % 8
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
buffer_load_dword v[vgprG2LA+0+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load packed 2X half buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LA+1+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0], offen offset:0 // load packed 2X half buffer value


/* global read b */

/* g2l=0, load component 0 */
buffer_load_dword v[vgprG2LB+0+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load packed 2X half buffer value
/* g2l=1, load component 0 */
buffer_load_dword v[vgprG2LB+1+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0], offen offset:0 // load packed 2X half buffer value

s_waitcnt vmcnt(0)                                 // 2wait for global read

// Skip barrier: NumThreads=64




/* local write a */

ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:256 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 256


/* local write b */

ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:0 // lwoB_0_0_0_0 = (0 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+0] offset:64 // lwoB_0_1_0_0 = (1 + 0*LSCB)*(MT1J+PAD) + (0*LSPB) = 64
ds_write_b16 v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:32 // lwoB_0_0_1_0 = (0 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 32
ds_write_b16_d16_hi v[vgprLocalWriteAddrB], v[vgprG2LB+1:vgprG2LB+1+0] offset:96 // lwoB_0_1_1_0 = (1 + 0*LSCB)*(MT1J+PAD) + (1*LSPB) = 96

s_waitcnt lgkmcnt(0)                               // 5wait for local write

// Skip barrier: NumThreads=64


/* tail loop: macs */

s_cmp_le_u32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0006                          // don't enter LoopL
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
label_0005:


/* local read a */

ds_read_b32 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b32 v[vgprValuB_X0_I0+0], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b32 v[vgprValuB_X0_I0+1], v[vgprLocalReadAddrB] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

s_mov_b32 s73, 0x40                                // inc
_v_add_co_u32 v[vgprLocalReadAddrA], vcc, s73, v[vgprLocalReadAddrA] // lrA += 64 (LSU*(MT+PAD)*bpe)


/* local read inc b */

s_mov_b32 s73, 0x40                                // inc
_v_add_co_u32 v[vgprLocalReadAddrB], vcc, s73, v[vgprLocalReadAddrB] // lrB += 64 (LSU*(MT+PAD)*bpe)

s_waitcnt lgkmcnt(0)                               // 4wait for local read

.align32 8, 0xbf800001                             // align v_pk_fma
MAC_4x4_X0

/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // dec counterL (toilLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x0            // counterL==0
s_cbranch_scc0 label_0005                          // restart LoopL
label_0006:

Summation_End_11:
/* endSummation: add vgpr 8...16 to pool */

s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000                // 
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000                // 
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in post-loop SRD


s_mul_i32 s58, 0x20, s[sgprWorkGroup1]             // <- wg1*MT1
s_mul_hi_u32 s57, s58, s[sgprStridesC+0]           // Scale s58 by Stride
s_mul_i32 s56, s58, s[sgprStridesC+0]              // Scale s58 by Stride
s_lshl_b64 s[56:57], s[56:57], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s57       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s57       // add hi to SRD

s_mul_hi_u32 s57, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s56, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[56:57], s[56:57], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s57       // add hi to SRD
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s57       // add hi to SRD




/* not-LocalSplitU: global write indices */

/* computeStoreVgprs */
v_lshrrev_b32 v9, 3, v[vgprSerial]                 // vectorStaticDiv: v9 = v[vgprSerial] / 8
v_and_b32 v8, 7, v[vgprSerial]                     // vectorStaticDiv: v8 = v[vgprSerial] % 8
v_lshlrev_b32 v8, 1, v8                            // staticMultiply: v8 = v8 * 2
v_lshlrev_b32 v9, 1, v9                            // staticMultiply: v9 = v9 * 2
v_mul_lo_u32 v10, v9, s[sgprStridesC+0]            // rowStart vgpr

s_mul_i32 s56, 0x20, s[sgprWorkGroup0]             // s56 = wg0*MT0
_v_add_co_u32 v8, vcc, s56, v8                     // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s58, 0x20, s[sgprWorkGroup1]             // <- wg1*MT1
_v_add_co_u32 v9, vcc, s58, v9                     // coord1 = tid1*VW + wg1*MT1


/* not-LocalSplitU: global write */

s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 GW_Beta_18                          // Branch if Beta is not zero

/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s56, 31, s[sgprSizeC0I]                  // s56 = s[sgprSizeC0I] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B0_E1_17                         // jump if edges required
s_and_b32 s56, 31, s[sgprSizeC1J]                  // s56 = s[sgprSizeC1J] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B0_E1_17                         // jump if edges required
GW_B0_E0_14:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=8 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw2); (0,1,0,0:vw2); (0,0,1,0:vw2); (0,1,1,0:vw2); (1,0,0,0:vw2); (1,1,0,0:vw2); (1,0,1,0:vw2); (1,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v13, v10, v8, 0x1                  // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
/* (d1,vc1,d0,vc0)=(1,1,0,0) */
/* (d1,vc1,d0,vc0)=(1,1,1,0) */

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 0, 1, 0), (0, 1, 1, 0), (1, 0, 0, 0), (1, 1, 0, 0), (1, 0, 1, 0), (1, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha sumIdx=0 vi=1
v_pk_mul_f16 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha sumIdx=2 vi=1
v_pk_mul_f16 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha sumIdx=4 vi=1
v_pk_mul_f16 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha sumIdx=6 vi=1
v_pk_mul_f16 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha sumIdx=8 vi=1
v_pk_mul_f16 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha sumIdx=10 vi=1
v_pk_mul_f16 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha sumIdx=12 vi=1
v_pk_mul_f16 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha sumIdx=14 vi=1

/* apply mask, calc new C and issue write */
buffer_store_dword v0, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v1, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
s_lshl_b32  s56, s[sgprStridesD+0], 1              // incToNextRow: Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v2, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v3, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
s_mul_i32 s56, s[sgprStridesD+0], 30               // scale StrideD *= 15 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v4, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v5, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
s_lshl_b32  s56, s[sgprStridesD+0], 1              // incToNextRow: Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v6, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v7, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
s_branch label_0025                                // jump to end
GW_B0_E1_17:

/* allocate 10 sgpr. perBatch=6 perElement=2 elements=2 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw2); (0,1,0,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v14, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v14, -1, v14, s[64:65]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0)] */
v_pk_mul_f16 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha sumIdx=0 vi=1
v_pk_mul_f16 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha sumIdx=2 vi=1

/* apply mask, calc new C and issue write */
buffer_store_dword v0, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v1, v14, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #1 (d1,d0,vc1,vc0) =
   (0,0,1,0:vw2); (0,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
_v_add_co_u32 v9, vcc, v9, 1                       // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
_v_add_u32 v10, v10, s[sgprStridesC+0]             // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v14, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v14, -1, v14, s[64:65]               // clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 1, 0), (0, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha sumIdx=4 vi=1
v_pk_mul_f16 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha sumIdx=6 vi=1

/* apply mask, calc new C and issue write */
buffer_store_dword v2, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v3, v14, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #2 (d1,d0,vc1,vc0) =
   (1,0,0,0:vw2); (1,1,0,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v9, vcc, v9, 15                      // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 15               // scale stride
_v_add_u32 v10, v10, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v14, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v14, -1, v14, s[64:65]               // clip if OOB. offset

/* rC *= alpha batchEements=[(1, 0, 0, 0), (1, 1, 0, 0)] */
v_pk_mul_f16 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha sumIdx=8 vi=1
v_pk_mul_f16 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha sumIdx=10 vi=1

/* apply mask, calc new C and issue write */
buffer_store_dword v4, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v5, v14, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #3 (d1,d0,vc1,vc0) =
   (1,0,1,0:vw2); (1,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,1,0,0) */
_v_add_co_u32 v9, vcc, v9, 1                       // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
_v_add_u32 v10, v10, s[sgprStridesC+0]             // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,1,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v14, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v14, -1, v14, s[64:65]               // clip if OOB. offset

/* rC *= alpha batchEements=[(1, 0, 1, 0), (1, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha sumIdx=12 vi=1
v_pk_mul_f16 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha sumIdx=14 vi=1

/* apply mask, calc new C and issue write */
buffer_store_dword v6, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
buffer_store_dword v7, v14, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0025                                // jump to end
GW_Beta_18:
/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_and_b32 s56, 31, s[sgprSizeC0I]                  // s56 = s[sgprSizeC0I] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_ge_u32 s[sgprWorkGroup0], s58                // wg0 >= nwg0-1 ?
s_cselect_b32 s56, s56, 0                          // set rMT0
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B1_E1_24                         // jump if edges required
s_and_b32 s56, 31, s[sgprSizeC1J]                  // s56 = s[sgprSizeC1J] % 32
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_ge_u32 s[sgprWorkGroup1], s58                // wg1 >= nwg1-1
s_cselect_b32 s56, s56, 0                          // set rMT1
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B1_E1_24                         // jump if edges required
GW_B1_E0_21:

/* allocate 2 sgpr. perBatch=2 perElement=0 elements=2 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw2); (0,1,0,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v13, v10, v8, 0x1                  // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
buffer_load_dword v15, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:32 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0)] */
v_pk_mul_f16 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha sumIdx=0 vi=1
v_pk_mul_f16 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha sumIdx=2 vi=1

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+0], v14, v[vgprValuC+0]   // sum*alpha + C*beta
buffer_store_dword v0, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v15, s[sgprBeta], v15                 // v15 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+1], v15, v[vgprValuC+1]   // sum*alpha + C*beta
buffer_store_dword v1, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #1 (d1,d0,vc1,vc0) =
   (0,0,1,0:vw2); (0,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
s_lshl_b32  s56, s[sgprStridesC+0], 1              // incToNextRow: Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
buffer_load_dword v15, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:32 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 1, 0), (0, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha sumIdx=4 vi=1
v_pk_mul_f16 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha sumIdx=6 vi=1

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+2], v14, v[vgprValuC+2]   // sum*alpha + C*beta
s_lshl_b32  s56, s[sgprStridesD+0], 1              // incToNextRow: Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v2, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v15, s[sgprBeta], v15                 // v15 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+3], v15, v[vgprValuC+3]   // sum*alpha + C*beta
buffer_store_dword v3, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #2 (d1,d0,vc1,vc0) =
   (1,0,0,0:vw2); (1,1,0,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
s_mul_i32 s56, s[sgprStridesC+0], 30               // scale StrideC *= 15 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
buffer_load_dword v15, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:32 // load C for beta calc

/* rC *= alpha batchEements=[(1, 0, 0, 0), (1, 1, 0, 0)] */
v_pk_mul_f16 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha sumIdx=8 vi=1
v_pk_mul_f16 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha sumIdx=10 vi=1

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+4], v14, v[vgprValuC+4]   // sum*alpha + C*beta
s_mul_i32 s56, s[sgprStridesD+0], 30               // scale StrideD *= 15 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v4, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v15, s[sgprBeta], v15                 // v15 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+5], v15, v[vgprValuC+5]   // sum*alpha + C*beta
buffer_store_dword v5, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #3 (d1,d0,vc1,vc0) =
   (1,0,1,0:vw2); (1,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,1,0,0) */
s_lshl_b32  s56, s[sgprStridesC+0], 1              // incToNextRow: Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,1,0) */
buffer_load_dword v15, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:32 // load C for beta calc

/* rC *= alpha batchEements=[(1, 0, 1, 0), (1, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha sumIdx=12 vi=1
v_pk_mul_f16 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha sumIdx=14 vi=1

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+6], v14, v[vgprValuC+6]   // sum*alpha + C*beta
s_lshl_b32  s56, s[sgprStridesD+0], 1              // incToNextRow: Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_dword v6, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D

s_waitcnt vmcnt(1)                                 // wait C (interleaved)
v_pk_mul_f16 v15, s[sgprBeta], v15                 // v15 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+7], v15, v[vgprValuC+7]   // sum*alpha + C*beta
buffer_store_dword v7, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:32,  // store D
s_branch label_0025                                // jump to end
GW_B1_E1_24:

/* allocate 10 sgpr. perBatch=6 perElement=2 elements=2 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw2); (0,1,0,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v15, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v15, -1, v15, s[64:65]               // clip if OOB. offset
buffer_load_dword v18, v15, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0)] */
v_pk_mul_f16 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha sumIdx=0 vi=1
v_pk_mul_f16 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha sumIdx=2 vi=1
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+0], v14, v[vgprValuC+0]   // sum*alpha + C*beta
buffer_store_dword v0, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_pk_mul_f16 v18, s[sgprBeta], v18                 // v18 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+1], v18, v[vgprValuC+1]   // sum*alpha + C*beta
buffer_store_dword v1, v15, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #1 (d1,d0,vc1,vc0) =
   (0,0,1,0:vw2); (0,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
_v_add_co_u32 v9, vcc, v9, 1                       // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
_v_add_u32 v10, v10, s[sgprStridesC+0]             // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v15, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v15, -1, v15, s[64:65]               // clip if OOB. offset
buffer_load_dword v18, v15, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 1, 0), (0, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha sumIdx=4 vi=1
v_pk_mul_f16 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha sumIdx=6 vi=1
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+2], v14, v[vgprValuC+2]   // sum*alpha + C*beta
buffer_store_dword v2, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_pk_mul_f16 v18, s[sgprBeta], v18                 // v18 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+3], v18, v[vgprValuC+3]   // sum*alpha + C*beta
buffer_store_dword v3, v15, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #2 (d1,d0,vc1,vc0) =
   (1,0,0,0:vw2); (1,1,0,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) */
_v_add_co_u32 v9, vcc, v9, 15                      // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 15               // scale stride
_v_add_u32 v10, v10, s56                           // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v15, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v15, -1, v15, s[64:65]               // clip if OOB. offset
buffer_load_dword v18, v15, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 0, 0, 0), (1, 1, 0, 0)] */
v_pk_mul_f16 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha sumIdx=8 vi=1
v_pk_mul_f16 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha sumIdx=10 vi=1
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+4], v14, v[vgprValuC+4]   // sum*alpha + C*beta
buffer_store_dword v4, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_pk_mul_f16 v18, s[sgprBeta], v18                 // v18 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+5], v18, v[vgprValuC+5]   // sum*alpha + C*beta
buffer_store_dword v5, v15, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #3 (d1,d0,vc1,vc0) =
   (1,0,1,0:vw2); (1,1,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,1,0,0) */
_v_add_co_u32 v9, vcc, v9, 1                       // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
_v_add_u32 v10, v10, s[sgprStridesC+0]             // ROWINC- Move cinRowPtr to next row
v_cmp_lt_u32 s[56:57], v8, s[sgprSizeC0I]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[62:63]             // in0 && in1
_v_add_lshl_u32 v13, v10, v8, 0x1                  // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v13, -1, v13, s[62:63]               // clip if OOB. offset
buffer_load_dword v14, v13, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,1,0) */
_v_add_co_u32 v11, vcc, v8, 16                     // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[56:57], v11, s[sgprSizeC0I]         // coord0 < size0
v_cmp_lt_u32 s[64:65], v9, s[sgprSizeC1J]          // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[64:65]             // in0 && in1
_v_add_lshl_u32 v15, v10, v11, 0x1                 // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v15, -1, v15, s[64:65]               // clip if OOB. offset
buffer_load_dword v18, v15, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 0, 1, 0), (1, 1, 1, 0)] */
v_pk_mul_f16 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha sumIdx=12 vi=1
v_pk_mul_f16 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha sumIdx=14 vi=1
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_pk_mul_f16 v14, s[sgprBeta], v14                 // v14 = C*beta ei=0 vi=0
v_pk_add_f16 v[vgprValuC+6], v14, v[vgprValuC+6]   // sum*alpha + C*beta
buffer_store_dword v6, v13, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
v_pk_mul_f16 v18, s[sgprBeta], v18                 // v18 = C*beta ei=1 vi=0
v_pk_add_f16 v[vgprValuC+7], v18, v[vgprValuC+7]   // sum*alpha + C*beta
buffer_store_dword v7, v15, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store D
s_branch label_0025                                // jump to end
label_0025:

label_0026:  /// KernelEnd
s_endpgm                                           // Kernel End


