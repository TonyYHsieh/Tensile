

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 6, "AMD", "AMDGPU" 
.text
.p2align 8
.amdgpu_hsa_kernel Cijk_Ailk_Bjlk_DB_MT48x64x4_SE_K1_PLR0_SNLL0_TT6_4_WG8_16_1_WGM4 
Cijk_Ailk_Bjlk_DB_MT48x64x4_SE_K1_PLR0_SNLL0_TT6_4_WG8_16_1_WGM4:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 92 // bytes of kern args
  workitem_vgpr_count = 84 // vgprs
  wavefront_sgpr_count = 98 // sgprs
  compute_pgm_rsrc1_vgprs = 20 // floor((83-1)/4)
  compute_pgm_rsrc1_sgprs = 13 // floor((98-1)/8)
  compute_pgm_rsrc2_tidig_comp_cnt = 0 // 1D wg
  compute_pgm_rsrc2_tgid_x_en = 1 // wg.x
  compute_pgm_rsrc2_tgid_y_en = 1 // wg.y
  compute_pgm_rsrc2_tgid_z_en = 1 // wg.z
  workgroup_group_segment_byte_size = 7680 // lds bytes
  compute_pgm_rsrc2_user_sgpr = 2 // vcc
  kernarg_segment_alignment = 4
  group_segment_alignment = 4
  private_segment_alignment = 4
.end_amd_kernel_code_t

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 6 x 4 */
/* SubGroup= 8 x 16 */
/* VectorWidth=2 */
/* GlobalLoadVectorWidthA=2, GlobalLoadVectorWidthB=2 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=False */

/******************************************/
/* Asm syntax workarounds                 */
/******************************************/
.macro _v_add_co_u32 dst, cc, src0, src1, dpp=
   v_add_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm
.macro _v_sub_co_u32 dst, cc, src0, src1, dpp=
   v_sub_co_u32 \dst, \cc, \src0, \src1 \dpp
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
    v_mul_lo_u32 v[\dstIdx+0], \dividend, \magicNumber
    v_mul_hi_u32 v[\dstIdx+1], \dividend, \magicNumber
    v_lshrrev_b64 v[\dstIdx:\dstIdx+1], \magicShift, v[\dstIdx:\dstIdx+1]
.endm

/******************************************/
/* VGPR Assignments                       */
/******************************************/
.set vgprValuC, 0
/* ValuA/B   Xn=PLR buffer idx,  In=InnerUnroll idx */
.set vgprValuA_X0_I0, 48
.set vgprG2LA, 60
.set vgprValuB_X0_I0, 64
.set vgprG2LB, 72
.set vgprLocalWriteAddrA, 76
.set vgprLocalWriteAddrB, 77
.set vgprGlobalReadOffsetA, 78
.set vgprGlobalReadOffsetB, 79
.set vgprLocalReadAddrA, 80
.set vgprLocalReadAddrB, 81
.set vgprSerial, 82
/* Num VGPR=83 */

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
.set sgprStridesC, 36
.set sgprAlpha, 38
.set sgprBeta, 40
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
.set sgprNumFullBlocks, 60
.set sgprWgmRemainder1, 61
.set sgprMagicNumberWgmRemainder1, 62
.set sgprGlobalReadIncsA, 63
.set sgprGlobalReadIncsB, 64
.set sgprStridesD, 74
.set sgprTMP0, 90
.set sgprTMP1, 91
.set sgprEdgeSelMask0, 93
.set sgprEdgeSelMask1, 94
/* max SGPR=98 */

/******************************************/
/* 2GB limit - set offsets to -1 to exceed this and clamp */
/******************************************/
.set BufferLimit, 0x80000000

/******************************************/
/* Bits 127:96 of SRD.  Set DataFormat = 32 bit */
/******************************************/
.set Srd127_96, 0x0020000
.set BufferOOB, 0x80000000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr vgprOffset0I vgprOffsetL vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStridesA+0], v[\vgprOffsetL] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprTmp+0], v[\vgprOffset0I] // accumulate d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, 0x2, v[\vgprAddr+0] // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x3, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffset1J vgprOffsetL vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStridesB+0], v[\vgprOffsetL] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprTmp+0], v[\vgprOffset1J] // accumulate d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, 0x2, v[\vgprAddr+0] // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x3, v[\vgprAddr+0]  // offset *= bytes/element
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
/* 6x4 thread-tile                        */
/******************************************/

.macro MAC_6x4_X0
v_fma_f32 v[vgprValuC+(0+0*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2+1]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(1+0*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2+1]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2+1]

v_fma_f32 v[vgprValuC+(2+0*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2+1]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2+1]

v_fma_f32 v[vgprValuC+(3+0*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2+1]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2+1]

v_fma_f32 v[vgprValuC+(4+0*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2+1]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2+1]

v_fma_f32 v[vgprValuC+(5+0*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2+1]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+1*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2+1]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2+1]

v_fma_f32 v[vgprValuC+(1+1*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2+1]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2+1]

v_fma_f32 v[vgprValuC+(2+1*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2+1]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2+1]

v_fma_f32 v[vgprValuC+(3+1*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2+1]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2+1]

v_fma_f32 v[vgprValuC+(4+1*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2+1]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2+1]

v_fma_f32 v[vgprValuC+(5+1*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2+1]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+2*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2+1]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2+1]

v_fma_f32 v[vgprValuC+(1+2*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2+1]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2+1]

v_fma_f32 v[vgprValuC+(2+2*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2+1]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2+1]

v_fma_f32 v[vgprValuC+(3+2*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2+1]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2+1]

v_fma_f32 v[vgprValuC+(4+2*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2+1]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2+1]

v_fma_f32 v[vgprValuC+(5+2*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2+1]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+3*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2+1]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2+1]

v_fma_f32 v[vgprValuC+(1+3*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2+1]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2+1]

v_fma_f32 v[vgprValuC+(2+3*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2+1]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2+1]

v_fma_f32 v[vgprValuC+(3+3*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2+1]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2+1]

v_fma_f32 v[vgprValuC+(4+3*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2+1]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2+1]

v_fma_f32 v[vgprValuC+(5+3*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2+1]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
s_setprio 0 // Reset priority after macs 
.endm

.macro MAC_6x4_X0_part_1
v_fma_f32 v[vgprValuC+(0+0*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2+1]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(1+0*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2+1]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+1*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2+1]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2+1]

v_fma_f32 v[vgprValuC+(1+1*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2+1]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+2*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2+1]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2+1]

v_fma_f32 v[vgprValuC+(1+2*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2+1]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+3*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2+1]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2+1]

v_fma_f32 v[vgprValuC+(1+3*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2+1]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
.endm

.macro MAC_6x4_X0_part_2
.endm

.macro MAC_6x4_X0_part_3

v_fma_f32 v[vgprValuC+(2+0*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2+1]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2+1]

v_fma_f32 v[vgprValuC+(3+0*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2+1]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2+1]

v_fma_f32 v[vgprValuC+(4+0*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2+1]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2+1]

v_fma_f32 v[vgprValuC+(5+0*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2+1]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+1*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2+1]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2+1]

v_fma_f32 v[vgprValuC+(3+1*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2+1]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2+1]

v_fma_f32 v[vgprValuC+(4+1*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2+1]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2+1]

v_fma_f32 v[vgprValuC+(5+1*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2+1]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+2*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2+1]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2+1]

v_fma_f32 v[vgprValuC+(3+2*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2+1]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2+1]

v_fma_f32 v[vgprValuC+(4+2*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2+1]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2+1]

v_fma_f32 v[vgprValuC+(5+2*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2+1]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+3*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2+1]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2+1]

v_fma_f32 v[vgprValuC+(3+3*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2+1]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2+1]

v_fma_f32 v[vgprValuC+(4+3*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2+1]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2+1]

v_fma_f32 v[vgprValuC+(5+3*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2+1]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
s_setprio 0 // Reset Priority
.endm

.macro MAC_6x4_X0_unprio_0
v_fma_f32 v[vgprValuC+(0+0*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2+1]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(1+0*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2+1]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2+1]

v_fma_f32 v[vgprValuC+(2+0*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2+1]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2+1]

v_fma_f32 v[vgprValuC+(3+0*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2+1]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2+1]

v_fma_f32 v[vgprValuC+(4+0*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2+1]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2+1]

v_fma_f32 v[vgprValuC+(5+0*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2+1]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+1*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2+1]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2+1]

v_fma_f32 v[vgprValuC+(1+1*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2+1]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2+1]

v_fma_f32 v[vgprValuC+(2+1*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2+1]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2+1]

v_fma_f32 v[vgprValuC+(3+1*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2+1]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2+1]

v_fma_f32 v[vgprValuC+(4+1*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2+1]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2+1]

v_fma_f32 v[vgprValuC+(5+1*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2+1]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+2*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2+1]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2+1]

v_fma_f32 v[vgprValuC+(1+2*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2+1]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2+1]

v_fma_f32 v[vgprValuC+(2+2*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2+1]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2+1]

v_fma_f32 v[vgprValuC+(3+2*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2+1]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2+1]

v_fma_f32 v[vgprValuC+(4+2*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2+1]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2+1]

v_fma_f32 v[vgprValuC+(5+2*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2+1]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+3*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2+1]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2+1]

v_fma_f32 v[vgprValuC+(1+3*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2+1]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2+1]

v_fma_f32 v[vgprValuC+(2+3*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2+1]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2+1]

v_fma_f32 v[vgprValuC+(3+3*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2+1]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2+1]

v_fma_f32 v[vgprValuC+(4+3*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2+1]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2+1]

v_fma_f32 v[vgprValuC+(5+3*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2+1]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
.endm


// New pattern
.macro MAC_6x4_X0_part1
v_fma_f32 v[vgprValuC+(0+0*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+0*6)*2+1]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+0*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(1+0*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+0*6)*2+1]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+1*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+1*6)*2+1]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+1*6)*2+1]

v_fma_f32 v[vgprValuC+(1+1*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+1*6)*2+1]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+0*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+0*6)*2]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+0*6)*2+1]
v_fma_f32 v[vgprValuC+(0+0*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+0*6)*2+1]

v_fma_f32 v[vgprValuC+(1+0*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+0*6)*2]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+0*6)*2+1]
v_fma_f32 v[vgprValuC+(1+0*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+1*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+1*6)*2]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+1*6)*2+1]
v_fma_f32 v[vgprValuC+(0+1*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+1*6)*2+1]

v_fma_f32 v[vgprValuC+(1+1*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+1*6)*2]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+1*6)*2+1]
v_fma_f32 v[vgprValuC+(1+1*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

s_setprio 0
.endm


.macro MAC_6x4_X0_part2
v_fma_f32 v[vgprValuC+(2+0*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+0*6)*2+1]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+0*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(3+0*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+0*6)*2+1]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+1*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+1*6)*2+1]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+1*6)*2+1]

v_fma_f32 v[vgprValuC+(3+1*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+1*6)*2+1]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+0*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+0*6)*2]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+0*6)*2+1]
v_fma_f32 v[vgprValuC+(2+0*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+0*6)*2+1]

v_fma_f32 v[vgprValuC+(3+0*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+0*6)*2]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+0*6)*2+1]
v_fma_f32 v[vgprValuC+(3+0*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+1*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+1*6)*2]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+1*6)*2+1]
v_fma_f32 v[vgprValuC+(2+1*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+1*6)*2+1]

v_fma_f32 v[vgprValuC+(3+1*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+1*6)*2]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+1*6)*2+1]
v_fma_f32 v[vgprValuC+(3+1*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

s_setprio 0
.endm

.macro MAC_6x4_X0_part3
v_fma_f32 v[vgprValuC+(4+0*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+0*6)*2+1]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+0*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(5+0*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+0*6)*2+1]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(4+1*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+1*6)*2+1]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+1*6)*2+1]

v_fma_f32 v[vgprValuC+(5+1*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+1*6)*2+1]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(4+0*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+0*6)*2]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+0*6)*2+1]
v_fma_f32 v[vgprValuC+(4+0*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+0*6)*2+1]

v_fma_f32 v[vgprValuC+(5+0*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+0*6)*2]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+0*6)*2+1]
v_fma_f32 v[vgprValuC+(5+0*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+0*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(4+1*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+1*6)*2]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+1*6)*2+1]
v_fma_f32 v[vgprValuC+(4+1*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+1*6)*2+1]

v_fma_f32 v[vgprValuC+(5+1*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+1*6)*2]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+1*6)*2+1]
v_fma_f32 v[vgprValuC+(5+1*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+1*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
s_setprio 0
.endm

.macro MAC_6x4_X0_part4
v_fma_f32 v[vgprValuC+(0+2*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(0+2*6)*2+1]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(0+2*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(1+2*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(1+2*6)*2+1]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(1+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+3*6)*2], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2], -v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(0+3*6)*2+1]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+0*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(0+3*6)*2+1]

v_fma_f32 v[vgprValuC+(1+3*6)*2], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2], -v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(1+3*6)*2+1]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+1*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(1+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+2*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+2*6)*2]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(0+2*6)*2+1]
v_fma_f32 v[vgprValuC+(0+2*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(0+2*6)*2+1]

v_fma_f32 v[vgprValuC+(1+2*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+2*6)*2]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(1+2*6)*2+1]
v_fma_f32 v[vgprValuC+(1+2*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(1+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(0+3*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+3*6)*2]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(0+3*6)*2+1]
v_fma_f32 v[vgprValuC+(0+3*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(0+3*6)*2+1]

v_fma_f32 v[vgprValuC+(1+3*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+3*6)*2]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(1+3*6)*2+1]
v_fma_f32 v[vgprValuC+(1+3*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(1+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//vnop_4 
s_setprio 0
.endm


.macro MAC_6x4_X0_part5
v_fma_f32 v[vgprValuC+(2+2*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(2+2*6)*2+1]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(2+2*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(3+2*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(3+2*6)*2+1]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(3+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+3*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(2+3*6)*2+1]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(2+3*6)*2+1]

v_fma_f32 v[vgprValuC+(3+3*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(3+3*6)*2+1]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(3+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+2*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+2*6)*2]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(2+2*6)*2+1]
v_fma_f32 v[vgprValuC+(2+2*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(2+2*6)*2+1]

v_fma_f32 v[vgprValuC+(3+2*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+2*6)*2]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(3+2*6)*2+1]
v_fma_f32 v[vgprValuC+(3+2*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(3+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(2+3*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+3*6)*2]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(2+3*6)*2+1]
v_fma_f32 v[vgprValuC+(2+3*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(2+3*6)*2+1]

v_fma_f32 v[vgprValuC+(3+3*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+3*6)*2]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(3+3*6)*2+1]
v_fma_f32 v[vgprValuC+(3+3*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(3+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//vnop_4 
s_setprio 0
.endm


.macro MAC_6x4_X0_part6
v_fma_f32 v[vgprValuC+(4+2*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(4+2*6)*2+1]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(4+2*6)*2+1]

s_setprio 1 // Raise priority while processing macs 

v_fma_f32 v[vgprValuC+(5+2*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+2*2+1], v[vgprValuC+(5+2*6)*2+1]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+2*2], v[vgprValuC+(5+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(4+3*6)*2], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2], -v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(4+3*6)*2+1]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+4*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(4+3*6)*2+1]

v_fma_f32 v[vgprValuC+(5+3*6)*2], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2], -v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2], v[vgprValuB_X0_I0+3*2+1], v[vgprValuC+(5+3*6)*2+1]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+5*2+1], v[vgprValuB_X0_I0+3*2], v[vgprValuC+(5+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(4+2*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+2*6)*2]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(4+2*6)*2+1]
v_fma_f32 v[vgprValuC+(4+2*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(4+2*6)*2+1]

v_fma_f32 v[vgprValuC+(5+2*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+2*6)*2]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+0*2+1], v[vgprValuC+(5+2*6)*2+1]
v_fma_f32 v[vgprValuC+(5+2*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+0*2], v[vgprValuC+(5+2*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

v_fma_f32 v[vgprValuC+(4+3*6)*2], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2], -v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+3*6)*2]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+2*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(4+3*6)*2+1]
v_fma_f32 v[vgprValuC+(4+3*6)*2+1], v[vgprValuA_X0_I0+2*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(4+3*6)*2+1]

v_fma_f32 v[vgprValuC+(5+3*6)*2], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2], -v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+3*6)*2]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+3*2], v[vgprValuB_X0_I0+1*2+1], v[vgprValuC+(5+3*6)*2+1]
v_fma_f32 v[vgprValuC+(5+3*6)*2+1], v[vgprValuA_X0_I0+3*2+1], v[vgprValuB_X0_I0+1*2], v[vgprValuC+(5+3*6)*2+1]
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
s_setprio 0
.endm

/******************************************/
/* Allocate Resources                     */
/******************************************/

s_mov_b32 m0, 0x1e00                               // LDS clamp at 7680 bytes
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
s_load_dword s[sgprAlpha+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x38 // 
s_load_dword s[sgprAlpha+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x3c // 
s_load_dword s[sgprBeta+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40 // 
s_load_dword s[sgprBeta+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x44 // 
s_load_dword s[sgprStridesD+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x48 // 
s_load_dword s[sgprStridesD+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x4c // 
s_load_dword s[sgprStridesC+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x50 // 
s_load_dword s[sgprStridesC+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x54 // 
s_load_dword s[sgprStridesA+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x58 // 
s_load_dword s[sgprStridesA+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x5c // 
s_load_dword s[sgprStridesB+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x60 // 
s_load_dword s[sgprStridesB+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 // 
s_load_dword s[sgprSizesFree+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x68 // 
s_load_dword s[sgprSizesFree+1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c // 
s_load_dword s[sgprSizesFree+2], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x70 // 
s_load_dword s[sgprSizesSum+0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x74 // 
s_load_dword s[sgprNumWorkGroups0], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x7c // 
s_load_dword s[sgprNumWorkGroups1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x80 // 
s_load_dword s[sgprNumFullBlocks], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8c // 
s_load_dword s[sgprWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x90 // 
s_load_dword s[sgprMagicNumberWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x94 // 
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
v_lshrrev_b32 v2, 4, v0                            // vectorStaticDiv: v2 = v0 / 16
v_and_b32 v3, 15, v0                               // vectorStaticDiv: v3 = v0 % 16


/* local read addresses: final offsets a */

v_lshrrev_b32 v0, 7, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 128
v_and_b32 v2, 127, v[vgprSerial]                   // vectorStaticDiv: v2 = v[vgprSerial] % 128
s_mov_b32 s65, 0x30                                // MT0+PAD
v_mul_lo_u32 v0, s65, v0                           // sgid=sgid*(MT0+PAD)
v_lshlrev_b32 v1, 1, v1                            // staticMultiply: v1 = v1 * 2
_v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v1, 0x3 // o = (lroA*VW+sgid*MT0)*bpe


/* local read addresses: final offsets b */

v_lshrrev_b32 v0, 7, v[vgprSerial]                 // vectorStaticDiv: v0 = v[vgprSerial] / 128
v_and_b32 v1, 127, v[vgprSerial]                   // vectorStaticDiv: v1 = v[vgprSerial] % 128
s_mov_b32 s65, 0x40                                // MT1+PAD
v_mul_lo_u32 v0, s65, v0                           // sgid=sgid*(MT1+PAD)
v_lshlrev_b32 v3, 1, v3                            // staticMultiply: v3 = v3 * 2
_v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v3, 0x3 // o = (lroB*VW+sgid*MT1)*bpe


/* local read addresses: declare addresses a */

/* N/A */


/* local read addresses: declare addresses b */

_v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x600, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)


s_load_dword s[sgprNumWorkGroups1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x80 // 
s_load_dword s[sgprNumFullBlocks], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8c // 
s_load_dword s[sgprWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x90 // 
s_load_dword s[sgprMagicNumberWgmRemainder1], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x94 // 
/******************************************/
/* Global Read Addresses                  */
/******************************************/


/* global read addresses: work-group */

/* graWorkGroup mapping */
s_mov_b32 s69, 0x20000001L                         // magic number for WGM==4
s_mul_hi_u32 s67, s[sgprWorkGroup1], s69           // s_magic mul
s_mul_i32 s66, s[sgprWorkGroup1], s69              // s_magic mul
s_lshr_b64 s[66:67], s[66:67], 31                  // sMagicDiv
s_mul_i32 s67, s66, 4                              // quotient * non-magic divisor
s_sub_u32 s67, s[sgprWorkGroup1], s67              // WorkGroup1=remainder
s_mul_i32 s67, s67, s[sgprNumWorkGroups0]          // (wg1 % WGM)*nwg0
s_add_u32 s67, s67, s[sgprWorkGroup0]              // wgSerial = wg0 + (wg1 % WGM)*nwg0
s_cmp_ge_u32 s66, s[sgprNumFullBlocks]             // blockId >= numFullBlocks ?
s_cmov_b32 s69, s[sgprMagicNumberWgmRemainder1]    // 
s_cselect_b32 s68, s[sgprWgmRemainder1], 4         // 
s_mul_hi_u32 s3, s67, s69                          // s_magic mul
s_mul_i32 s2, s67, s69                             // s_magic mul
s_lshr_b64 s[2:3], s[2:3], 31                      // sMagicDiv
s_mul_i32 s[sgprWorkGroup1], s[sgprWorkGroup0], s68 // quotient * non-magic divisor
s_sub_u32 s[sgprWorkGroup1], s67, s[sgprWorkGroup1] // WorkGroup1=remainder
s_mul_i32 s66, s66, 4                              // blockId * WGM
s_add_u32 s[sgprWorkGroup1], s[sgprWorkGroup1], s66 // wg1 += blockId * WGM


/* global read addresses: tile offset assignment a */

/* LVCA = 24 */
/* v0 = (local)groA-tile = serial%LVCA (note (wgA*MTA) will be added to SRD) */
/* v1 = groA-unroll = serial/LVCA */
s_mov_b32 s65, 0x15555556                          // 
v_mul_hi_u32 v3, v[vgprSerial], s65                // 
v_mul_lo_u32 v2, v[vgprSerial], s65                // 
v_lshrrev_b64 v[2:3], 0x21, v[2:3]                 // 
v_mov_b32 v1, v2                                   // vectorStaticDiv: quotient
s_mov_b32 s65, 0x18                                // divisor
v_mul_lo_u32 v2, v1, s65                           // vectorStaticDiv: product = quotient * divisor
_v_sub_co_u32 v0, vcc, v[vgprSerial], v2           // vectorStaticDiv: remainder = dividend - product
/* gro-tile *= glvw */
v_lshlrev_b32 v0, 1, v0                            // staticMultiply: v0 = v0 * 2


/* global read addresses: tile offset assignment b */

/* LVCB = 32 */
/* v2 = (local)groB-tile = serial%LVCB (note (wgB*MTB) will be added to SRD) */
/* v3 = groB-unroll = serial/LVCB */
v_lshrrev_b32 v3, 5, v[vgprSerial]                 // vectorStaticDiv: v3 = v[vgprSerial] / 32
v_and_b32 v2, 31, v[vgprSerial]                    // vectorStaticDiv: v2 = v[vgprSerial] % 32
/* gro-tile *= glvw */
v_lshlrev_b32 v2, 1, v2                            // staticMultiply: v2 = v2 * 2


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


/* global read addresses: unroll offsets a */

v_mov_b32 v6, v1                                   // groAL_0


/* global read addresses: unroll offsets b */

v_mov_b32 v7, v3                                   // groBL_0


/* global read addresses: shift a */

s_mul_i32 s65, s[sgprWorkGroup0], 48               // WorkGroup[01] * MT
s_sub_u32 s65, s[sgprSizesFree+0], s65             // edge = Size0I - WG*MT
s_sub_u32 s65, s65, 2                              // edge -= margin
v_mov_b32 v8, s65                                  // edge vgpr = Size0I-2
_v_add_co_u32 v9, vcc, v8, 2                       // add srdShiftLift
_v_add_co_u32 v10, vcc, v4, 2                      // 
v_cmp_lt_u32 s[66:67], v10, v9                     // offset < edge
v_cndmask_b32 v4, v8, v4, s[66:67]                 // offset = (offset < edge) ? offset : edge


/* global read addresses: shift b */

s_mul_i32 s65, s[sgprWorkGroup1], 64               // WorkGroup[01] * MT
s_sub_u32 s65, s[sgprSizesFree+1], s65             // edge = Size1J - WG*MT
s_sub_u32 s65, s65, 2                              // edge -= margin
v_mov_b32 v8, s65                                  // edge vgpr = Size1J-2
_v_add_co_u32 v9, vcc, v8, 2                       // add srdShiftLift
_v_add_co_u32 v10, vcc, v5, 2                      // 
v_cmp_lt_u32 s[66:67], v10, v9                     // offset < edge
v_cndmask_b32 v5, v8, v5, s[66:67]                 // offset = (offset < edge) ? offset : edge


/* global read addresses: final offsets a */

GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  4,  6, 8 // gROA_0_0_0_0
// Offset only valid for 96/128 threads inside the PerLoadTile
s_mov_b32 s66, 96                                  // 
v_cmp_lt_u32 vcc, v[vgprSerial], s66               // tid < valid-tid
s_mov_b32 s66, BufferOOB                           // 
v_mov_b32 v11, s66                                 // 
v_cndmask_b32 v[vgprGlobalReadOffsetA+0], v11, v[vgprGlobalReadOffsetA+0], vcc // Mask load so OOB will return 0


/* global read addresses: final offsets b */

GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  5,  7, 8 // gROB_0_0_0_0


/* global read addresses: addresses a */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s69, s[sgprWorkGroup0], 48            // WorkGroup[01] * MT
s_mul_i32 s68, s[sgprWorkGroup0], 48               // WorkGroup[01] * MT
s_sub_u32 s[sgprShadowLimitA+0], s[sgprTensor2dSizeA], s68 // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s[sgprTensor2dSizeA+1], s69 // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x3 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 16 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s67, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s66, s[sgprStridesA+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s68, s68, s66                            // accum wg term to tilestart
s_addc_u32 s69, s69, s67                           // accum wg term to tilestart
s_lshl_b64 s[68:69], s[68:69], 3                   // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s68    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s69   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdA+0], s[sgprSrdA+0], 16         // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: addresses b */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s69, s[sgprWorkGroup1], 64            // WorkGroup[01] * MT
s_mul_i32 s68, s[sgprWorkGroup1], 64               // WorkGroup[01] * MT
s_sub_u32 s[sgprShadowLimitB+0], s[sgprTensor2dSizeB], s68 // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s[sgprTensor2dSizeB+1], s69 // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x3 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 16 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s67, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s66, s[sgprStridesB+1], s[sgprWorkGroup2] // Stride*WG
s_add_u32 s68, s68, s66                            // accum wg term to tilestart
s_addc_u32 s69, s69, s67                           // accum wg term to tilestart
s_lshl_b64 s[68:69], s[68:69], 3                   // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s68    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s69   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdB+0], s[sgprSrdB+0], 16         // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD


/* global read addresses: increments a */

s_mul_i32 s[sgprGlobalReadIncsA+0], 0x20, s[sgprStridesA] // incr = stride*4*bytes


/* global read addresses: increments b */

s_mul_i32 s[sgprGlobalReadIncsB+0], 0x20, s[sgprStridesB] // incr = stride*4*bytes


/******************************************/
/* Local Write Addresses                  */
/******************************************/


/* local write addresses: tile assignment a */

/* lwaTileA = v0 */


/* local write addresses: tile assignment b */

/* lwaTileB = v2 */


/* local write addresses: unroll assignment a */

/* lwaUnrollA = v1 */


/* local write addresses: unroll assignment b */

/* lwaUnrollB = v3 */


/* local write addresses: first offset a */

v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x30, v1     // lwAL**(MTA + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x3 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe
s_mov_b32 s65, 96                                  // lsc*lsp=48*4
v_cmp_lt_u32 vcc, v[vgprSerial], s65               // fractional: ensure tid < global read tile elements
v_mov_b32 v0, 0xf00000                             // 
v_cndmask_b32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], vcc // Mask load so out-of-gr-tile bounds returns 0


/* local write addresses: first offset b */

v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x40, v3     // lwBL**(MTB + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrB], v2, v[vgprLocalWriteAddrB], 0x3 // lwFOB = (lwBB + lwBL*(MT1J+PAD))*bpe
_v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x600, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=192*8


/* local write addresses: final offsets a */


/* N/A */


/* local write addresses: final offsets b */


/* N/A */


/* local write addresses: declare addresses a */

/* N/A */


/* local write addresses: declare addresses b */

/* N/A */


/* local write addresses: init pointers a */

/* N/A */


/* local write addresses: init pointers b */

/* N/A */


/* declare loop num iterations */


s_lshr_b32 s[sgprLoopCounters+0], s[sgprSizesSum+0], 2 // s[sgprLoopCounters+0] = s[sgprSizesSum+0] / 4
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounters+0] // copy loop counter
s_sub_u32 s[sgprLoopCounters+0], 0x0, s[sgprLoopCounters+0] // counterL = -sizeL


/* local read addresses: init pointers a */



/* local read addresses: init pointers b */



/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_mov_b32 s91, 0x0                                 // STATIC_DIV: divisior=48
s_mul_i32 s90, 0xaaa, s[sgprSizesFree+0]           // tmp1 = dividend * magic hi
s_lshl_b64 s[90:91], s[90:91], 0x10                // left shift 16 bits
s_mul_i32 s82, s[sgprSizesFree+0], 0xaaab          // tmp0 = dividend * magic lo
s_add_u32 s90, s82, s90                            // add lo
s_addc_u32 s91, s91, 0x0                           // add hi
s_lshr_b64 s[90:91], s[90:91], 0x21                // tmp1 = (dividend * magic) << shift
s_mov_b32 s82, s90                                 // quotient
s_mul_i32 s90, s82, 0x30                           // quotient*divisor
s_sub_u32 s[sgprEdgeSelMask0], s[sgprSizesFree+0], s90             // rReg = dividend - quotient*divisor
s_lshr_b32 s82, s[sgprSizesFree+1], 6              // s58 = s[sgprSizesFree+1] / 64
s_and_b32 s[sgprEdgeSelMask1], 63, s[sgprSizesFree+1]         


/* prefetch: global -> local */

s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIter0I == 0
s_cbranch_scc1 label_0008                          // skip to ShadowInitStart iter b/c numIter==0

buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0

buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0


/* global read inc A */
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32


/* global read inc B */
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

label_0008: // ShadowInitStart 

s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000                // 
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in SRD
s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000                // 
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in SRD

s_mul_i32 s[sgprTMP1], 0x40, s[sgprWorkGroup1]             // <- wg1*MT1
s_mul_i32 s[sgprTMP0], 0x30, s[sgprWorkGroup1]             // <- wg1*MT1
s_mul_hi_u32 s67, s[sgprTMP1], s[sgprStridesC+0]           // Scale s68 by Stride
s_mul_i32 s66, s[sgprTMP1], s[sgprStridesC+0]              // Scale s68 by Stride
s_lshl_b64 s[66:67], s[66:67], 3                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s66        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s67       // add hi to SRD
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s66        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s67       // add hi to SRD

s_mul_hi_u32 s67, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s66, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[66:67], s[66:67], 3                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s66        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s67       // add hi to SRD
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s66        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s67       // add hi to SRD


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
s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIter0I == 0
s_cbranch_scc1 label_0004                          // after InitC, skip to end of prefetch last iter b/c numIter==0

s_waitcnt vmcnt(0)                                 // 8wait for global read


/* local write a */

ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0


/* local write b */

ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:0 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 0


/* local write swap a */



/* local write swap b */



/* local write init pointers a */

/* N/A */


/* local write init pointers b */

/* N/A */

/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/

s_cmp_ge_i32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0004                          // don't enter LoopL
label_0001:


/******************************************/
/* Unroll Loop 1/2 - Begin                */
/******************************************/

s_barrier //4sync for global read

s_cmp_eq_i32 s[sgprLoopCounters+0], -1             // is this the last iteration
s_cmov_b32 s[sgprSrdA+2], 0                        // Set limit to 0 for last iteration
s_cmov_b32 s[sgprSrdB+2], 0                        // Set limit to 0 for last iteration

s_waitcnt lgkmcnt(0)                               // 1wait for local write




/* iter 0 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=0 new=0
//MAC_6x4_X0
MAC_6x4_X0_part_1

s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3


/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0

ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* global read inc A */
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=0 new=0
//MAC_6x4_X0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* global read inc B */
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 2 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:4096 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 4096

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(3)                               // wait for prior local read old=0 new=0
//MAC_6x4_X0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(1)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3

/* iter 3 (last) */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 3 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:4096 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 4096

/* local write swap offsets a */

/* local write swap offsets b */

/* local write init pointers a */
/* N/A */

/* local write init pointers b */
/* N/A */

/* local read swap offsets a */

/* local read swap internal offset -> 4096 */

/* local read swap offsets b */

/* local read swap internal offset -> 4096 */

/* local read init pointers a */

/* local read init pointers b */
s_waitcnt lgkmcnt(3)                               // 6wait for local read old=2 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(1)                               // 6wait for local read old=2 new=0
MAC_6x4_X0_part_3

/******************************************/
/* Unrolled Loop - End 1/2                */
/******************************************/

s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0],  -2            // counterL==0
s_cbranch_scc1 label_0003                          // exit LoopL


/******************************************/
/* Unroll Loop 2/2 - Begin                */
/******************************************/

s_barrier //4sync for global read

s_cmp_eq_i32 s[sgprLoopCounters+0], -1             // is this the last iteration
s_cmov_b32 s[sgprSrdA+2], 0                        // Set limit to 0 for last iteration
s_cmov_b32 s[sgprSrdB+2], 0                        // Set limit to 0 for last iteration

s_waitcnt lgkmcnt(0)                               // 1wait for local write




/* iter 0 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0

ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* global read inc A */
s_add_u32  s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* global read inc B */
s_add_u32  s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5120 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 2 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(3)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(1)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:5248 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=192 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=192 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5376 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5504 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 3 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:0 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 0

/* local write swap offsets a */

/* local write swap offsets b */

/* local write init pointers a */
/* N/A */

/* local write init pointers b */
/* N/A */

/* local read swap offsets a */

/* local read swap internal offset -> 0 */

/* local read swap offsets b */

/* local read swap internal offset -> 0 */

/* local read init pointers a */

/* local read init pointers b */
s_waitcnt lgkmcnt(3)                               // 6wait for local read old=3 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(1)                               // 6wait for local read old=1 new=0
MAC_6x4_X0_part_3

/******************************************/
/* Unrolled Loop - End 2/2 (final)        */
/******************************************/

s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], -2              // counterL==0
s_cbranch_scc0 label_0001                          // restart LoopL
s_cbranch_scc1 label_0002                          // restart LoopL

label_0003: // unroll loop odditer exit

//check edge Batch calculation needed
//for Batch edge jump to different beta loop optimization code
s_add_u32      s83,-0x1, s[sgprNumWorkGroups0]       // 
s_cmp_lt_u32   s[sgprWorkGroup0], s83                // wg0 < nwg0-1
s_cmov_b32     s[sgprEdgeSelMask0], 0x0
s_cmpk_gt_u32  s[sgprEdgeSelMask0], 0x0  
s_cbranch_scc1 label_1003                            // wg1 < nwg1-1 so skip rMT1 = Size1 % MT1
s_add_u32      s83, -0x1, s[sgprNumWorkGroups1]      // 
s_cmp_lt_u32   s[sgprWorkGroup1], s83                // wg1 < nwg1-1
s_cmov_b32     s[sgprEdgeSelMask1], 0x0
s_cmpk_gt_u32  s[sgprEdgeSelMask1], 0x0  
s_cbranch_scc1 label_1003                            // wg1 < nwg1-1 so skip rMT1 = Size1 % MT1


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5120 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 4096

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(1)                               // wait for prior local read old=0 new=0
MAC_6x4_X0



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:5248 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5376 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5504 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_mul_i32 s56, 0x30, s[sgprWorkGroup0]             // s56 = wg0*MT0
s_mul_i32 s58, 0x40, s[sgprWorkGroup1]             // s56 = wg0*MT0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 3 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:0 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 4096

s_waitcnt lgkmcnt(1)                               // 6wait for local read old=2 new=0
MAC_6x4_X0_unprio_0
v_lshrrev_b32 v[vgprLocalWriteAddrB], 3, v[vgprSerial]                // vectorStaticDiv: v49 = v[vgprSerial] / 8
v_and_b32 v[vgprLocalWriteAddrA], 7, v[vgprSerial]                    // vectorStaticDiv: v48 = v[vgprSerial] % 8
v_lshlrev_b32 v[vgprLocalWriteAddrA], 1, v[vgprLocalWriteAddrA]       // staticMultiply: v48 = v48 * 2
v_lshlrev_b32 v[vgprLocalWriteAddrB], 1, v[vgprLocalWriteAddrB]       // staticMultiply: v49 = v49 * 2
v_mul_lo_u32 v[vgprGlobalReadOffsetB], v[vgprLocalWriteAddrB], s[sgprStridesC+0]           // rowStart vgpr
_v_add_co_u32 v[vgprLocalWriteAddrA], vcc, s56, v[vgprLocalWriteAddrA]                   // coord0 = tid0*VW + wg0*MT0
_v_add_lshl_u32 v[vgprGlobalReadOffsetA], v[vgprGlobalReadOffsetB], v[vgprLocalWriteAddrA], 0x3                 // init cb addr <-  rowStart + coord0, scaled by BPE
s_setprio 0

s_add_u32       s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL
s_cmp_eq_i32    s[sgprLoopCounters+0], -1             // is this the last iteration
s_cmov_b32 	s[sgprSrdA+2], 0                        // Set limit to 0 for last iteration
s_cmov_b32 	s[sgprSrdB+2], 0                        // Set limit to 0 for last iteration
s_mov_b32 	s85, s[sgprSrdC+0]
s_mov_b32 	s86, s[sgprSrdC+1]
s_mov_b32       s87, s[sgprSrdD+0]
s_mov_b32       s88, s[sgprSrdD+1]


s_waitcnt lgkmcnt(0)                               // 1wait for local write
s_barrier //4sync for global read

/* iter 0,1 */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part1

/* iter 1 */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:768  // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part1


ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)


v_mov_b32 v[83], v[vgprValuC+0]
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_fma_f32 v[vgprValuC+0], -s[sgprAlpha+1], v[vgprValuC+1], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_fma_f32 v[vgprValuC+1], s[sgprAlpha+1], v[83], v[vgprValuC+1] // *= alpha

v_mov_b32 v[83], v[vgprValuC+2]
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_fma_f32 v[vgprValuC+2], -s[sgprAlpha+1], v[vgprValuC+3], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_fma_f32 v[vgprValuC+3], s[sgprAlpha+1], v[83], v[vgprValuC+3] // *= alpha

v_fma_f32 v[vgprValuC+0], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+0], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+1] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+1] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+2], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+2], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+3] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+3] // finalSum = sum*alpha + C*beta


buffer_store_dwordx4 v[0:3], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+12]
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_fma_f32 v[vgprValuC+12], -s[sgprAlpha+1], v[vgprValuC+13], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_fma_f32 v[vgprValuC+13], s[sgprAlpha+1], v[83], v[vgprValuC+13] // *= alpha

v_mov_b32 v[83], v[vgprValuC+14]
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_fma_f32 v[vgprValuC+14], -s[sgprAlpha+1], v[vgprValuC+15], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_fma_f32 v[vgprValuC+15], s[sgprAlpha+1], v[83], v[vgprValuC+15] // *= alpha

v_fma_f32 v[vgprValuC+12], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+12], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+13] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+13] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+14], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+14], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+15] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+15] // finalSum = sum*alpha + C*beta


buffer_store_dwordx4 v[12:15], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part2


/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part2

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+4]
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_fma_f32 v[vgprValuC+4], -s[sgprAlpha+1], v[vgprValuC+5], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_fma_f32 v[vgprValuC+5], s[sgprAlpha+1], v[83], v[vgprValuC+5] // *= alpha

v_mov_b32 v[83], v[vgprValuC+6]
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_fma_f32 v[vgprValuC+6], -s[sgprAlpha+1], v[vgprValuC+7], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_fma_f32 v[vgprValuC+7], s[sgprAlpha+1], v[83], v[vgprValuC+7] // *= alpha

v_fma_f32 v[vgprValuC+4], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+4], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+5] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+5] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+6], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+6], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+7] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+7] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[4:7], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+16]
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_fma_f32 v[vgprValuC+16], -s[sgprAlpha+1], v[vgprValuC+17], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_fma_f32 v[vgprValuC+17], s[sgprAlpha+1], v[83], v[vgprValuC+17] // *= alpha

v_mov_b32 v[83], v[vgprValuC+18]
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_fma_f32 v[vgprValuC+18], -s[sgprAlpha+1], v[vgprValuC+19], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_fma_f32 v[vgprValuC+19], s[sgprAlpha+1], v[83], v[vgprValuC+19] // *= alpha

v_fma_f32 v[vgprValuC+16], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+16], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+17] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+17] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+18], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+18], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+19] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+19] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[16:19], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part3


/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part3

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+8]
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_fma_f32 v[vgprValuC+8], -s[sgprAlpha+1], v[vgprValuC+9], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_fma_f32 v[vgprValuC+9], s[sgprAlpha+1], v[83], v[vgprValuC+9] // *= alpha

v_mov_b32 v[83], v[vgprValuC+10]
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_fma_f32 v[vgprValuC+10], -s[sgprAlpha+1], v[vgprValuC+11], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_fma_f32 v[vgprValuC+11], s[sgprAlpha+1], v[83], v[vgprValuC+11] // *= alpha

v_fma_f32 v[vgprValuC+8], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+8], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+9] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+9] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+10], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+10], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+11] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+11] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[8:11], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+20]
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_fma_f32 v[vgprValuC+20], -s[sgprAlpha+1], v[vgprValuC+21], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_fma_f32 v[vgprValuC+21], s[sgprAlpha+1], v[83], v[vgprValuC+21] // *= alpha

v_mov_b32 v[83], v[vgprValuC+22]
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_fma_f32 v[vgprValuC+22], -s[sgprAlpha+1], v[vgprValuC+23], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_fma_f32 v[vgprValuC+23], s[sgprAlpha+1], v[83], v[vgprValuC+23] // *= alpha

v_fma_f32 v[vgprValuC+20], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+20], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+21] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+21] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+22], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+22], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+23] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+23] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[20:23], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_mul_i32  s56, s[sgprStridesC+0], 248              // Scale by BPE
s_add_u32   s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
s_mov_b32   s85, s[sgprSrdC+0]
s_mov_b32   s86, s[sgprSrdC+1]                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part4

/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
s_lshl_b32   s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32   s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part4

ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
s_mul_i32   s56, s[sgprStridesD+0], 248              // Scale by BPE
s_add_u32   s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+24]
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_fma_f32 v[vgprValuC+24], -s[sgprAlpha+1], v[vgprValuC+25], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_fma_f32 v[vgprValuC+25], s[sgprAlpha+1], v[83], v[vgprValuC+25] // *= alpha

v_mov_b32 v[83], v[vgprValuC+26]
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_fma_f32 v[vgprValuC+26], -s[sgprAlpha+1], v[vgprValuC+27], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_fma_f32 v[vgprValuC+27], s[sgprAlpha+1], v[83], v[vgprValuC+27] // *= alpha

v_fma_f32 v[vgprValuC+24], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+24], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+25] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+25] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+26], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+26], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+27] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+27] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[24:27], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_mov_b32       s87, s[sgprSrdD+0]
s_mov_b32       s88, s[sgprSrdD+1]                 /* local read init pointers b */
s_lshl_b32      s56, s[sgprStridesD+0], 3         // Scale     s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_add_u32       s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32      s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+36]
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_fma_f32 v[vgprValuC+36], -s[sgprAlpha+1], v[vgprValuC+37], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_fma_f32 v[vgprValuC+37], s[sgprAlpha+1], v[83], v[vgprValuC+37] // *= alpha

v_mov_b32 v[83], v[vgprValuC+38]
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_fma_f32 v[vgprValuC+38], -s[sgprAlpha+1], v[vgprValuC+39], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_fma_f32 v[vgprValuC+39], s[sgprAlpha+1], v[83], v[vgprValuC+39] // *= alpha

v_fma_f32 v[vgprValuC+36], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+36], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+37] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+37] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+38], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+38], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+39] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+39] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[36:39], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0
MAC_6x4_X0_part5

/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part5

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+28]
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_fma_f32 v[vgprValuC+28], -s[sgprAlpha+1], v[vgprValuC+29], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_fma_f32 v[vgprValuC+29], s[sgprAlpha+1], v[83], v[vgprValuC+29] // *= alpha

v_mov_b32 v[83], v[vgprValuC+30]
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_fma_f32 v[vgprValuC+30], -s[sgprAlpha+1], v[vgprValuC+31], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_fma_f32 v[vgprValuC+31], s[sgprAlpha+1], v[83], v[vgprValuC+31] // *= alpha

v_fma_f32 v[vgprValuC+28], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+28], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+29] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+29] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+30], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+30], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+31] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+31] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[28:31], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+40]
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_fma_f32 v[vgprValuC+40], -s[sgprAlpha+1], v[vgprValuC+41], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_fma_f32 v[vgprValuC+41], s[sgprAlpha+1], v[83], v[vgprValuC+41] // *= alpha

v_mov_b32 v[83], v[vgprValuC+42]
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_fma_f32 v[vgprValuC+42], -s[sgprAlpha+1], v[vgprValuC+43], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_fma_f32 v[vgprValuC+43], s[sgprAlpha+1], v[83], v[vgprValuC+43] // *= alpha

v_fma_f32 v[vgprValuC+40], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+40], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+41] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+41] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+42], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+42], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+43] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+43] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[40:43], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part6

/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part6

s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+32]
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_fma_f32 v[vgprValuC+32], -s[sgprAlpha+1], v[vgprValuC+33], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_fma_f32 v[vgprValuC+33], s[sgprAlpha+1], v[83], v[vgprValuC+33] // *= alpha

v_mov_b32 v[83], v[vgprValuC+34]
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_fma_f32 v[vgprValuC+34], -s[sgprAlpha+1], v[vgprValuC+35], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_fma_f32 v[vgprValuC+35], s[sgprAlpha+1], v[83], v[vgprValuC+35] // *= alpha

v_fma_f32 v[vgprValuC+32], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+32], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+33] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+33] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+34], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+34], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+35] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+35] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[32:35], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_lshl_b32  s56, 	   s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32   s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)


v_mov_b32 v[83], v[vgprValuC+44]
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_fma_f32 v[vgprValuC+44], -s[sgprAlpha+1], v[vgprValuC+45], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_fma_f32 v[vgprValuC+45], s[sgprAlpha+1], v[83], v[vgprValuC+45] // *= alpha

v_mov_b32 v[83], v[vgprValuC+46]
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_fma_f32 v[vgprValuC+46], -s[sgprAlpha+1], v[vgprValuC+47], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_fma_f32 v[vgprValuC+47], s[sgprAlpha+1], v[83], v[vgprValuC+47] // *= alpha

v_fma_f32 v[vgprValuC+44], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+44], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+45] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+45] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+46], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+46], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+47] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+47] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[44:47], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_add_u32            s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL


s_endpgm

label_0002:

/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
//s_mov_b32 s91, 0x0                                 // STATIC_DIV: divisior=48
//s_mul_i32 s90, 0xaaa, s[sgprSizesFree+0]           // tmp1 = dividend * magic hi
//s_lshl_b64 s[90:91], s[90:91], 0x10                // left shift 16 bits
//s_mul_i32 s82, s[sgprSizesFree+0], 0xaaab          // tmp0 = dividend * magic lo
//s_add_u32 s90, s82, s90                            // add lo
//s_addc_u32 s91, s91, 0x0                           // add hi
//s_lshr_b64 s[90:91], s[90:91], 0x21                // tmp1 = (dividend * magic) << shift
//s_mov_b32 s82, s90                                 // quotient
//s_mul_i32 s90, s82, 0x30                           // quotient*divisor
//s_sub_u32 s[sgprEdgeSelMask0], s[sgprSizesFree+0], s90             // rReg = dividend - quotient*divisor
//s_lshr_b32 s82, s[sgprSizesFree+1], 6              // s58 = s[sgprSizesFree+1] / 64
//s_and_b32 s[sgprEdgeSelMask1], 63, s[sgprSizesFree+1]         

//check edge Batch calculation needed
//for Batch edge jump to different beta loop optimization code
s_add_u32      s83,-0x1, s[sgprNumWorkGroups0]       // 
s_cmp_lt_u32   s[sgprWorkGroup0], s83                // wg0 < nwg0-1
s_cmov_b32     s[sgprEdgeSelMask0], 0x0
s_cmpk_gt_u32  s[sgprEdgeSelMask0], 0x0  
s_cbranch_scc1 label_1002                            // wg1 < nwg1-1 so skip rMT1 = Size1 % MT1
s_add_u32      s83, -0x1, s[sgprNumWorkGroups1]      // 
s_cmp_lt_u32   s[sgprWorkGroup1], s83                // wg1 < nwg1-1
s_cmov_b32     s[sgprEdgeSelMask1], 0x0
s_cmpk_gt_u32  s[sgprEdgeSelMask1], 0x0  
s_cbranch_scc1 label_1002                            // wg1 < nwg1-1 so skip rMT1 = Size1 % MT1

/******************************************/

s_waitcnt lgkmcnt(0)                                 // 1wait for local write
s_barrier //4sync for global read

/* iter 0 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0

ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(2)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:4096 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 4096

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(3)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_1
s_waitcnt lgkmcnt(1)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part_3



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
s_mul_i32 s56, 0x30, s[sgprWorkGroup0]             // s56 = wg0*MT0
s_mul_i32 s58, 0x40, s[sgprWorkGroup1]             // s56 = wg0*MT0
/* sched write - iter 3 writesPerItem=1 */
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:4096 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 4096

s_waitcnt lgkmcnt(1)                               // 6wait for local read old=2 new=0
MAC_6x4_X0_unprio_0
v_lshrrev_b32 v[vgprLocalWriteAddrB], 3, v[vgprSerial]                // vectorStaticDiv: v49 = v[vgprSerial] / 8
v_and_b32 v[vgprLocalWriteAddrA], 7, v[vgprSerial]                    // vectorStaticDiv: v48 = v[vgprSerial] % 8
v_lshlrev_b32 v[vgprLocalWriteAddrA], 1, v[vgprLocalWriteAddrA]       // staticMultiply: v48 = v48 * 2
v_lshlrev_b32 v[vgprLocalWriteAddrB], 1, v[vgprLocalWriteAddrB]       // staticMultiply: v49 = v49 * 2
v_mul_lo_u32 v[vgprGlobalReadOffsetB], v[vgprLocalWriteAddrB], s[sgprStridesC+0]           // rowStart vgpr
_v_add_co_u32 v[vgprLocalWriteAddrA], vcc, s56, v[vgprLocalWriteAddrA]                   // coord0 = tid0*VW + wg0*MT0
_v_add_lshl_u32 v[vgprGlobalReadOffsetA], v[vgprGlobalReadOffsetB], v[vgprLocalWriteAddrA], 0x3                 // init cb addr <-  rowStart + coord0, scaled by BPE
s_setprio 0

s_add_u32       s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL
s_cmp_eq_i32    s[sgprLoopCounters+0], -1             // is this the last iteration
s_cmov_b32 	s[sgprSrdA+2], 0                        // Set limit to 0 for last iteration
s_cmov_b32 	s[sgprSrdB+2], 0                        // Set limit to 0 for last iteration
s_mov_b32 	s85, s[sgprSrdC+0]
s_mov_b32 	s86, s[sgprSrdC+1]
s_mov_b32       s87, s[sgprSrdD+0]
s_mov_b32       s88, s[sgprSrdD+1]


s_waitcnt lgkmcnt(0)                               // 1wait for local write
s_barrier //4sync for global read

/* iter 0,1 */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part1

/* iter 1 */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5248 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0_part1


ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)


v_mov_b32 v[83], v[vgprValuC+0]
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_fma_f32 v[vgprValuC+0], -s[sgprAlpha+1], v[vgprValuC+1], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_fma_f32 v[vgprValuC+1], s[sgprAlpha+1], v[83], v[vgprValuC+1] // *= alpha

v_mov_b32 v[83], v[vgprValuC+2]
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_fma_f32 v[vgprValuC+2], -s[sgprAlpha+1], v[vgprValuC+3], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_fma_f32 v[vgprValuC+3], s[sgprAlpha+1], v[83], v[vgprValuC+3] // *= alpha

v_fma_f32 v[vgprValuC+0], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+0], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+1] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+1] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+2], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+2], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+3] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+3] // finalSum = sum*alpha + C*beta


buffer_store_dwordx4 v[0:3], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+12]
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_fma_f32 v[vgprValuC+12], -s[sgprAlpha+1], v[vgprValuC+13], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_fma_f32 v[vgprValuC+13], s[sgprAlpha+1], v[83], v[vgprValuC+13] // *= alpha

v_mov_b32 v[83], v[vgprValuC+14]
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_fma_f32 v[vgprValuC+14], -s[sgprAlpha+1], v[vgprValuC+15], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_fma_f32 v[vgprValuC+15], s[sgprAlpha+1], v[83], v[vgprValuC+15] // *= alpha

v_fma_f32 v[vgprValuC+12], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+12], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+13] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+13] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+14], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+14], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+15] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+15] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[12:15], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part2


/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5376 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part2

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+4]
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_fma_f32 v[vgprValuC+4], -s[sgprAlpha+1], v[vgprValuC+5], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_fma_f32 v[vgprValuC+5], s[sgprAlpha+1], v[83], v[vgprValuC+5] // *= alpha

v_mov_b32 v[83], v[vgprValuC+6]
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_fma_f32 v[vgprValuC+6], -s[sgprAlpha+1], v[vgprValuC+7], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_fma_f32 v[vgprValuC+7], s[sgprAlpha+1], v[83], v[vgprValuC+7] // *= alpha

v_fma_f32 v[vgprValuC+4], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+4], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+5] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+5] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+6], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+6], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+7] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+7] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[4:7], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+16]
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_fma_f32 v[vgprValuC+16], -s[sgprAlpha+1], v[vgprValuC+17], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_fma_f32 v[vgprValuC+17], s[sgprAlpha+1], v[83], v[vgprValuC+17] // *= alpha

v_mov_b32 v[83], v[vgprValuC+18]
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_fma_f32 v[vgprValuC+18], -s[sgprAlpha+1], v[vgprValuC+19], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_fma_f32 v[vgprValuC+19], s[sgprAlpha+1], v[83], v[vgprValuC+19] // *= alpha

v_fma_f32 v[vgprValuC+16], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+16], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+17] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+17] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+18], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+18], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+19] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+19] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[16:19], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part3


/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5120 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:5504 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part3

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+8]
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_fma_f32 v[vgprValuC+8], -s[sgprAlpha+1], v[vgprValuC+9], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_fma_f32 v[vgprValuC+9], s[sgprAlpha+1], v[83], v[vgprValuC+9] // *= alpha

v_mov_b32 v[83], v[vgprValuC+10]
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_fma_f32 v[vgprValuC+10], -s[sgprAlpha+1], v[vgprValuC+11], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_fma_f32 v[vgprValuC+11], s[sgprAlpha+1], v[83], v[vgprValuC+11] // *= alpha

v_fma_f32 v[vgprValuC+8], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+8], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+9] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+9] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+10], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+10], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+11] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+11] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[8:11], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+20]
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_fma_f32 v[vgprValuC+20], -s[sgprAlpha+1], v[vgprValuC+21], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_fma_f32 v[vgprValuC+21], s[sgprAlpha+1], v[83], v[vgprValuC+21] // *= alpha

v_mov_b32 v[83], v[vgprValuC+22]
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_fma_f32 v[vgprValuC+22], -s[sgprAlpha+1], v[vgprValuC+23], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_fma_f32 v[vgprValuC+23], s[sgprAlpha+1], v[83], v[vgprValuC+23] // *= alpha

v_fma_f32 v[vgprValuC+20], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+20], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+21] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+21] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+22], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+22], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+23] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+23] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[20:23], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_mul_i32  s56, s[sgprStridesC+0], 248              // Scale by BPE
s_add_u32   s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
s_mov_b32   s85, s[sgprSrdC+0]
s_mov_b32   s86, s[sgprSrdC+1]                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part4

/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
s_lshl_b32   s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32   s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5248 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part4

ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
s_mul_i32   s56, s[sgprStridesD+0], 248              // Scale by BPE
s_add_u32   s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+24]
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_fma_f32 v[vgprValuC+24], -s[sgprAlpha+1], v[vgprValuC+25], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_fma_f32 v[vgprValuC+25], s[sgprAlpha+1], v[83], v[vgprValuC+25] // *= alpha

v_mov_b32 v[83], v[vgprValuC+26]
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_fma_f32 v[vgprValuC+26], -s[sgprAlpha+1], v[vgprValuC+27], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_fma_f32 v[vgprValuC+27], s[sgprAlpha+1], v[83], v[vgprValuC+27] // *= alpha

v_fma_f32 v[vgprValuC+24], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+24], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+25] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+25] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+26], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+26], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+27] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+27] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[24:27], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_mov_b32       s87, s[sgprSrdD+0]
s_mov_b32       s88, s[sgprSrdD+1]                 /* local read init pointers b */
s_lshl_b32      s56, s[sgprStridesD+0], 3         // Scale     s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_add_u32       s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32      s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+36]
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_fma_f32 v[vgprValuC+36], -s[sgprAlpha+1], v[vgprValuC+37], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_fma_f32 v[vgprValuC+37], s[sgprAlpha+1], v[83], v[vgprValuC+37] // *= alpha

v_mov_b32 v[83], v[vgprValuC+38]
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_fma_f32 v[vgprValuC+38], -s[sgprAlpha+1], v[vgprValuC+39], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_fma_f32 v[vgprValuC+39], s[sgprAlpha+1], v[83], v[vgprValuC+39] // *= alpha

v_fma_f32 v[vgprValuC+36], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+36], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+37] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+37] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+38], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+38], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+39] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+39] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[36:39], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0
MAC_6x4_X0_part5

/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5376 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part5

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+28]
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_fma_f32 v[vgprValuC+28], -s[sgprAlpha+1], v[vgprValuC+29], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_fma_f32 v[vgprValuC+29], s[sgprAlpha+1], v[83], v[vgprValuC+29] // *= alpha

v_mov_b32 v[83], v[vgprValuC+30]
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_fma_f32 v[vgprValuC+30], -s[sgprAlpha+1], v[vgprValuC+31], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_fma_f32 v[vgprValuC+31], s[sgprAlpha+1], v[83], v[vgprValuC+31] // *= alpha

v_fma_f32 v[vgprValuC+28], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+28], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+29] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+29] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+30], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+30], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+31] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+31] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[28:31], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+40]
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_fma_f32 v[vgprValuC+40], -s[sgprAlpha+1], v[vgprValuC+41], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_fma_f32 v[vgprValuC+41], s[sgprAlpha+1], v[83], v[vgprValuC+41] // *= alpha

v_mov_b32 v[83], v[vgprValuC+42]
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_fma_f32 v[vgprValuC+42], -s[sgprAlpha+1], v[vgprValuC+43], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_fma_f32 v[vgprValuC+43], s[sgprAlpha+1], v[83], v[vgprValuC+43] // *= alpha

v_fma_f32 v[vgprValuC+40], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+40], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+41] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+41] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+42], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+42], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+43] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+43] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[40:43], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_mov_b32       s[sgprSrdC+0], s85
s_mov_b32       s[sgprSrdC+1], s86                 /* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part6

/* local read b */
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5120 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA:vgprG2LA+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5504 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0

MAC_6x4_X0_part6

s_mov_b32       s[sgprSrdD+0], s87
s_mov_b32       s[sgprSrdD+1], s88                 
buffer_load_dwordx4 v[vgprG2LB:vgprG2LB+3], v[vgprGlobalReadOffsetA], s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
s_waitcnt vmcnt(1)

v_mov_b32 v[83], v[vgprValuC+32]
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_fma_f32 v[vgprValuC+32], -s[sgprAlpha+1], v[vgprValuC+33], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_fma_f32 v[vgprValuC+33], s[sgprAlpha+1], v[83], v[vgprValuC+33] // *= alpha

v_mov_b32 v[83], v[vgprValuC+34]
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_fma_f32 v[vgprValuC+34], -s[sgprAlpha+1], v[vgprValuC+35], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_fma_f32 v[vgprValuC+35], s[sgprAlpha+1], v[83], v[vgprValuC+35] // *= alpha

v_fma_f32 v[vgprValuC+32], v[vgprG2LA], s[sgprBeta+0], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+32], -v[vgprG2LA+1], s[sgprBeta+1], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[vgprG2LA], s[sgprBeta+1], v[vgprValuC+33] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[vgprG2LA+1], s[sgprBeta+0], v[vgprValuC+33] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+34], v[vgprG2LA+2], s[sgprBeta+0], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+34], -v[vgprG2LA+3], s[sgprBeta+1], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[vgprG2LA+2], s[sgprBeta+1], v[vgprValuC+35] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[vgprG2LA+3], s[sgprBeta+0], v[vgprValuC+35] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[32:35], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_lshl_b32  s56, 	   s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32   s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
s_waitcnt vmcnt(1)


v_mov_b32 v[83], v[vgprValuC+44]
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_fma_f32 v[vgprValuC+44], -s[sgprAlpha+1], v[vgprValuC+45], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_fma_f32 v[vgprValuC+45], s[sgprAlpha+1], v[83], v[vgprValuC+45] // *= alpha

v_mov_b32 v[83], v[vgprValuC+46]
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_fma_f32 v[vgprValuC+46], -s[sgprAlpha+1], v[vgprValuC+47], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_fma_f32 v[vgprValuC+47], s[sgprAlpha+1], v[83], v[vgprValuC+47] // *= alpha

v_fma_f32 v[vgprValuC+44], v[vgprG2LB], s[sgprBeta+0], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+44], -v[vgprG2LB+1], s[sgprBeta+1], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[vgprG2LB], s[sgprBeta+1], v[vgprValuC+45] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[vgprG2LB+1], s[sgprBeta+0], v[vgprValuC+45] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+46], v[vgprG2LB+2], s[sgprBeta+0], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+46], -v[vgprG2LB+3], s[sgprBeta+1], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[vgprG2LB+2], s[sgprBeta+1], v[vgprValuC+47] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[vgprG2LB+3], s[sgprBeta+0], v[vgprValuC+47] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[44:47], v[vgprGlobalReadOffsetA], s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_add_u32            s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL


s_endpgm

label_1002:

/******************************************/
//branch logic gets executed for edge MT to use legacy alph_beta code

s_waitcnt lgkmcnt(0)                                 // 1wait for local write
s_barrier //4sync for global read

/* iter 0 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:4096 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 4096
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 3 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:4096 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 4096
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0
MAC_6x4_X0


s_waitcnt lgkmcnt(0)                               // 1wait for local write
s_barrier //4sync for global read


/* iter 0 */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5120 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:5248 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5376 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5504 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=192 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=192 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0
MAC_6x4_X0
s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL

s_branch label_0004

label_1003:

s_waitcnt lgkmcnt(0)                               // 1wait for local write
s_barrier //4sync for global read


/* iter 0 */

/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
buffer_load_dwordx4 v[vgprG2LA+0:vgprG2LA+0+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dwordx4 v[vgprG2LB+0:vgprG2LB+0+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // G -> Reg 0_0_0_0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=0 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4096 // L -> Reg lro=0 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4352 // L -> Reg lro=0 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=48 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:4608 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:4864 // L -> Reg lro=64 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* sched write - iter 2 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5120 // L -> Reg lro=96 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5120 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5376 // L -> Reg lro=128 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:5248 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:5376 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
/* sched write - iter 3 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:0 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:5504 // L -> Reg lro=144 swapByteOffset=4096 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:5632 // L -> Reg lro=192 swapByteOffset=4096 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:5888 // L -> Reg lro=192 swapByteOffset=4096 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read init pointers b */
s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0
MAC_6x4_X0

s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], -1             // is this the last iteration
s_cmov_b32 s[sgprSrdA+2], 0                        // Set limit to 0 for last iteration
s_cmov_b32 s[sgprSrdB+2], 0                        // Set limit to 0 for last iteration

s_waitcnt lgkmcnt(0)                               // 1wait for local write

s_barrier //4sync for global read

/* iter 0 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->48 */

/* local read increment b */
/* N/A, lro->64 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 1 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=48 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:512 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:768 // L -> Reg lro=64 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->96 */

/* local read increment b */
/* N/A, lro->128 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0

/* iter 2 */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=96 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1024 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1280 // L -> Reg lro=128 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read increment a */
/* N/A, lro->144 */

/* local read increment b */
/* N/A, lro->192 */
s_waitcnt lgkmcnt(0)                               // wait for prior local read old=0 new=0
MAC_6x4_X0



/* iter 3 (last) */


/* local read a */
ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:1152 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:1280 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:1408 // L -> Reg lro=144 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:1536 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:1792 // L -> Reg lro=192 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0

s_waitcnt lgkmcnt(0)                               // 6wait for local read old=2 new=0
MAC_6x4_X0
s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL

label_0004:


/******************************************/
/* Tail Loop                              */
/******************************************/


/* local write reset offsets a */



/* local write reset offsets b */



s_cmp_eq_u32 s[sgprOrigLoopCounter], 0             // completely skipped unroll loop?
s_cselect_b32 s66, 0, s[sgprGlobalReadIncsA]       // force to 0?
s_cselect_b32 s67, 0, s[sgprGlobalReadIncsB]       // force to 0?
s_sub_u32  s[sgprSrdA+0], s[sgprSrdA+0], s66       // gra SRD -= inc(lower)
s_subb_u32  s[sgprSrdA+1], s[sgprSrdA+1], 0        // gra SRD -= inc(upper)
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s66 // limit -= inc)
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

s_sub_u32  s[sgprSrdB+0], s[sgprSrdB+0], s67       // gra SRD -= inc(lower)
s_subb_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD -= inc(upper)
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s67 // limit -= inc)
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

//numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_lshr_b32 s66, s[sgprSizesSum+0], 2               // s66 = s[sgprSizesSum+0] / 4
s_and_b32 s[sgprLoopCounters+0], 3, s[sgprSizesSum+0] // s[sgprLoopCounters+0] = s[sgprSizesSum+0] % 4
s_cmp_eq_u32 s[sgprLoopCounters+0], 0x0            // numIterL == 0
s_cbranch_scc1 label_0006                          // skip to end of tail loop b/c numIter==0
s_sub_u32 s[sgprLoopCounters+0], 0x0, s[sgprLoopCounters+0] // counterL = -sizeL


/* global read a */

/* g2l=0, load component 0 */
buffer_load_dwordx2 v[vgprG2LA+0+0:vgprG2LA+0+0+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_dwordx2 v[vgprG2LA+0+2:vgprG2LA+0+2+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:8 // load one buffer value
_v_add_co_u32 v[vgprGlobalReadOffsetA+0], vcc, v[vgprGlobalReadOffsetA+0], 8 // graOffset += 1 * bpe


/* global read b */

/* g2l=0, load component 0 */
buffer_load_dwordx2 v[vgprG2LB+0+0:vgprG2LB+0+0+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_dwordx2 v[vgprG2LB+0+2:vgprG2LB+0+2+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:8 // load one buffer value
_v_add_co_u32 v[vgprGlobalReadOffsetB+0], vcc, v[vgprGlobalReadOffsetB+0], 8 // graOffset += 1 * bpe

s_waitcnt vmcnt(0)                                 // 2wait for global read

s_barrier //

/* local write init pointers a */

/* N/A */


/* local write init pointers b */

/* N/A */


/* local write a */

ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0


/* local write b */

ds_write_b128 v[vgprLocalWriteAddrB], v[vgprG2LB+0:vgprG2LB+0+3] offset:0 // lwoB_0_0_0_0 = (0*LSCB) + (0*LSPB)(*MT1J+PAD) = 0

s_waitcnt lgkmcnt(0)                               // 5wait for local write

s_barrier //


/* local read reset offsets a */

/* handled internally */
v_and_b32 v[vgprLocalReadAddrA], 0xfff, v[vgprLocalReadAddrA] // reset Red,Blk -> Red


/* local read reset offsets b */

/* handled internally */
v_and_b32 v[vgprLocalReadAddrB], 0xfff, v[vgprLocalReadAddrB] // reset Red,Blk -> Red


/* local read init pointers a */



/* local read init pointers b */



/* tail loop: macs */

s_cmp_ge_i32 s[sgprLoopCounters+0], 0x0            // LoopCounterL < EndCounter
s_cbranch_scc1 label_0006                          // don't enter LoopL
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
label_0005:


/* local read a */

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+4+3], v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+8+3], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=8 vIdx=2 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read b */

ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+4+3], v[vgprLocalReadAddrB] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 oIdx=0 buffer=0 iui=0


/* local read inc a */

s_mov_b32 s65, 0x180                               // inc
_v_add_co_u32 v[vgprLocalReadAddrA], vcc, s65, v[vgprLocalReadAddrA] // lrA += 384 (LSU*(MT+PAD)*bpe)


/* local read inc b */

s_mov_b32 s65, 0x200                               // inc
_v_add_co_u32 v[vgprLocalReadAddrB], vcc, s65, v[vgprLocalReadAddrB] // lrB += 512 (LSU*(MT+PAD)*bpe)

s_waitcnt lgkmcnt(0)                               // 4wait for local read

MAC_6x4_X0
s_add_u32 s[sgprLoopCounters+0], s[sgprLoopCounters+0], 0x1 // inc counterL
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x1 // inc counterL
s_cmp_eq_i32 s[sgprLoopCounters+0], 0x0            // counterL==0
s_cbranch_scc0 label_0005                          // restart LoopL
label_0006:

s_waitcnt lgkmcnt(0) & vmcnt(0)                    // wait for all summation activity


/* shift vector components d0 */

v_mov_b32 v50, s[sgprWorkGroup0]                   // 
v_mul_i32_i24 v50, -0x30, v50                      // wg*MT
_v_add_co_u32 v50, vcc, s[sgprSizesFree+0], v50    // wgMT = Size - wg*MT
v_mov_b32 v48, 0x30                                // MT
v_cmp_lt_u32 s[56:57], v50, v48                    // wgMT < MT
v_cndmask_b32 v50, v48, v50, s[56:57]              // wgMT = (wgMT < MT) ? wgMT : MT
v_lshrrev_b32 v52, 1, v50                          // vectorStaticDiv: v52 = v50 / 2
v_and_b32 v53, 1, v50                              // vectorStaticDiv: v53 = v50 % 2
v_lshrrev_b32 v54, 3, v52                          // vectorStaticDiv: v54 = v52 / 8
v_and_b32 v55, 7, v52                              // vectorStaticDiv: v55 = v52 % 8
v_and_b32 v56, 7, v[vgprSerial]                    // vectorStaticDiv: v56 = v[vgprSerial] % 8
v_lshrrev_b32 v57, 4, v50                          // vectorStaticDiv: v57 = v50 / 16
v_and_b32 v58, 1, v50                              // vectorStaticDiv: v58 = v50 % 2
v_mov_b32 v59, v58                                 // duplicate
v_lshrrev_b32 v58, 1, v59                          // vectorStaticDiv: v58 = v59 / 2
_v_add_co_u32 v58, vcc, v57, v58                   // vId = 2 components
v_cmp_eq_u32 s[56:57], v56, v55                    // mask
v_mov_b32 v48, s56                                 // 
v_mov_b32 v49, s57                                 // 
v_cmp_eq_u32 vcc, v53, 0x1                         // wgMT%VW == 1
s_cbranch_vccnz label_0010                         // shift d0 r=1
s_branch label_0014                                // no shifting

/******************************************/
/* shift d0 r=1                           */
/******************************************/
label_0010:
v_cmp_eq_u32 vcc, v58, 0x0                         // wgMT/(SG*VW) == 0
s_cbranch_vccnz label_0011                         // shift d0, r=1, v=0
v_cmp_eq_u32 vcc, v58, 0x1                         // wgMT/(SG*VW) == 1
s_cbranch_vccnz label_0012                         // shift d0, r=1, v=1
v_cmp_eq_u32 vcc, v58, 0x2                         // wgMT/(SG*VW) == 2
s_cbranch_vccnz label_0013                         // shift d0, r=1, v=2

/* shift d0 r=1 v=0 */
label_0011:
v_cmpx_eq_u32 s[56:57], v56, v55                   // serial % SG == (wgMT/VECTOR_WIDTH)%SG
// src=1, dst=0
v_mov_b32 v0, v2                                   // rC[0+0*VW+0*TT0I] = rC[1+0*VW+0*TT0I]
v_mov_b32 v1, v3                                   // rC[0+0*VW+0*TT0I] = rC[1+0*VW+0*TT0I]
// src=7, dst=6
v_mov_b32 v12, v14                                 // rC[0+0*VW+1*TT0I] = rC[1+0*VW+1*TT0I]
v_mov_b32 v13, v15                                 // rC[0+0*VW+1*TT0I] = rC[1+0*VW+1*TT0I]
// src=13, dst=12
v_mov_b32 v24, v26                                 // rC[0+0*VW+2*TT0I] = rC[1+0*VW+2*TT0I]
v_mov_b32 v25, v27                                 // rC[0+0*VW+2*TT0I] = rC[1+0*VW+2*TT0I]
// src=19, dst=18
v_mov_b32 v36, v38                                 // rC[0+0*VW+3*TT0I] = rC[1+0*VW+3*TT0I]
v_mov_b32 v37, v39                                 // rC[0+0*VW+3*TT0I] = rC[1+0*VW+3*TT0I]
s_mov_b64 s[56:57], 0xFFFFFFFFFFFFFFFF             // to restore all threads active
s_or_saveexec_b64 vcc, s[56:57]                    // all threads active
s_branch label_0014                                // done shifting

/* shift d0 r=1 v=1 */
label_0012:
v_cmpx_eq_u32 s[56:57], v56, v55                   // serial % SG == (wgMT/VECTOR_WIDTH)%SG
// src=3, dst=2
v_mov_b32 v4, v6                                   // rC[0+1*VW+0*TT0I] = rC[1+1*VW+0*TT0I]
v_mov_b32 v5, v7                                   // rC[0+1*VW+0*TT0I] = rC[1+1*VW+0*TT0I]
// src=9, dst=8
v_mov_b32 v16, v18                                 // rC[0+1*VW+1*TT0I] = rC[1+1*VW+1*TT0I]
v_mov_b32 v17, v19                                 // rC[0+1*VW+1*TT0I] = rC[1+1*VW+1*TT0I]
// src=15, dst=14
v_mov_b32 v28, v30                                 // rC[0+1*VW+2*TT0I] = rC[1+1*VW+2*TT0I]
v_mov_b32 v29, v31                                 // rC[0+1*VW+2*TT0I] = rC[1+1*VW+2*TT0I]
// src=21, dst=20
v_mov_b32 v40, v42                                 // rC[0+1*VW+3*TT0I] = rC[1+1*VW+3*TT0I]
v_mov_b32 v41, v43                                 // rC[0+1*VW+3*TT0I] = rC[1+1*VW+3*TT0I]
s_mov_b64 s[56:57], 0xFFFFFFFFFFFFFFFF             // to restore all threads active
s_or_saveexec_b64 vcc, s[56:57]                    // all threads active
s_branch label_0014                                // done shifting

/* shift d0 r=1 v=2 */
label_0013:
v_cmpx_eq_u32 s[56:57], v56, v55                   // serial % SG == (wgMT/VECTOR_WIDTH)%SG
// src=5, dst=4
v_mov_b32 v8, v10                                  // rC[0+2*VW+0*TT0I] = rC[1+2*VW+0*TT0I]
v_mov_b32 v9, v11                                  // rC[0+2*VW+0*TT0I] = rC[1+2*VW+0*TT0I]
// src=11, dst=10
v_mov_b32 v20, v22                                 // rC[0+2*VW+1*TT0I] = rC[1+2*VW+1*TT0I]
v_mov_b32 v21, v23                                 // rC[0+2*VW+1*TT0I] = rC[1+2*VW+1*TT0I]
// src=17, dst=16
v_mov_b32 v32, v34                                 // rC[0+2*VW+2*TT0I] = rC[1+2*VW+2*TT0I]
v_mov_b32 v33, v35                                 // rC[0+2*VW+2*TT0I] = rC[1+2*VW+2*TT0I]
// src=23, dst=22
v_mov_b32 v44, v46                                 // rC[0+2*VW+3*TT0I] = rC[1+2*VW+3*TT0I]
v_mov_b32 v45, v47                                 // rC[0+2*VW+3*TT0I] = rC[1+2*VW+3*TT0I]
s_mov_b64 s[56:57], 0xFFFFFFFFFFFFFFFF             // to restore all threads active
s_or_saveexec_b64 vcc, s[56:57]                    // all threads active
s_branch label_0014                                // done shifting
label_0014: // end shift0


/* shift vector components d1 */

v_mov_b32 v50, s[sgprWorkGroup1]                   // 
v_mul_i32_i24 v50, -0x40, v50                      // wg*MT
_v_add_co_u32 v50, vcc, s[sgprSizesFree+1], v50    // wgMT = Size - wg*MT
v_mov_b32 v48, 0x40                                // MT
v_cmp_lt_u32 s[56:57], v50, v48                    // wgMT < MT
v_cndmask_b32 v50, v48, v50, s[56:57]              // wgMT = (wgMT < MT) ? wgMT : MT
v_lshrrev_b32 v52, 1, v50                          // vectorStaticDiv: v52 = v50 / 2
v_and_b32 v53, 1, v50                              // vectorStaticDiv: v53 = v50 % 2
v_lshrrev_b32 v54, 4, v52                          // vectorStaticDiv: v54 = v52 / 16
v_and_b32 v55, 15, v52                             // vectorStaticDiv: v55 = v52 % 16
v_lshrrev_b32 v56, 3, v[vgprSerial]                // vectorStaticDiv: v56 = v[vgprSerial] / 8
v_and_b32 v57, 15, v56                             // vectorStaticDiv: v57 = v56 % 16
v_lshrrev_b32 v56, 5, v50                          // vectorStaticDiv: v56 = v50 / 32
v_and_b32 v58, 1, v50                              // vectorStaticDiv: v58 = v50 % 2
v_mov_b32 v59, v58                                 // duplicate
v_lshrrev_b32 v58, 1, v59                          // vectorStaticDiv: v58 = v59 / 2
_v_add_co_u32 v58, vcc, v56, v58                   // vId = 2 components
v_cmp_eq_u32 s[56:57], v57, v55                    // mask
v_mov_b32 v48, s56                                 // 
v_mov_b32 v49, s57                                 // 
v_cmp_eq_u32 vcc, v53, 0x1                         // wgMT%VW == 1
s_cbranch_vccnz label_0018                         // shift d1 r=1
s_branch label_0021                                // no shifting

/******************************************/
/* shift d1 r=1                           */
/******************************************/
label_0018:
v_cmp_eq_u32 vcc, v58, 0x0                         // wgMT/(SG*VW) == 0
s_cbranch_vccnz label_0019                         // shift d1, r=1, v=0
v_cmp_eq_u32 vcc, v58, 0x1                         // wgMT/(SG*VW) == 1
s_cbranch_vccnz label_0020                         // shift d1, r=1, v=1

/* shift d1 r=1 v=0 */
label_0019:
v_cmpx_eq_u32 s[56:57], v57, v55                   // serial % SG == (wgMT/VECTOR_WIDTH)%SG
// src=6, dst=0
v_mov_b32 v0, v12                                  // rC[0+0*TT0I*VW+0*TT0I] = rC[0+0*TT0I*VW+1*TT0I]
v_mov_b32 v1, v13                                  // rC[0+0*TT0I*VW+0*TT0I] = rC[0+0*TT0I*VW+1*TT0I]
// src=7, dst=1
v_mov_b32 v2, v14                                  // rC[1+0*TT0I*VW+0*TT0I] = rC[1+0*TT0I*VW+1*TT0I]
v_mov_b32 v3, v15                                  // rC[1+0*TT0I*VW+0*TT0I] = rC[1+0*TT0I*VW+1*TT0I]
// src=8, dst=2
v_mov_b32 v4, v16                                  // rC[2+0*TT0I*VW+0*TT0I] = rC[2+0*TT0I*VW+1*TT0I]
v_mov_b32 v5, v17                                  // rC[2+0*TT0I*VW+0*TT0I] = rC[2+0*TT0I*VW+1*TT0I]
// src=9, dst=3
v_mov_b32 v6, v18                                  // rC[3+0*TT0I*VW+0*TT0I] = rC[3+0*TT0I*VW+1*TT0I]
v_mov_b32 v7, v19                                  // rC[3+0*TT0I*VW+0*TT0I] = rC[3+0*TT0I*VW+1*TT0I]
// src=10, dst=4
v_mov_b32 v8, v20                                  // rC[4+0*TT0I*VW+0*TT0I] = rC[4+0*TT0I*VW+1*TT0I]
v_mov_b32 v9, v21                                  // rC[4+0*TT0I*VW+0*TT0I] = rC[4+0*TT0I*VW+1*TT0I]
// src=11, dst=5
v_mov_b32 v10, v22                                 // rC[5+0*TT0I*VW+0*TT0I] = rC[5+0*TT0I*VW+1*TT0I]
v_mov_b32 v11, v23                                 // rC[5+0*TT0I*VW+0*TT0I] = rC[5+0*TT0I*VW+1*TT0I]
s_mov_b64 s[56:57], 0xFFFFFFFFFFFFFFFF             // to restore all threads active
s_or_saveexec_b64 vcc, s[56:57]                    // all threads active
s_branch label_0021                                // done shifting

/* shift d1 r=1 v=1 */
label_0020:
v_cmpx_eq_u32 s[56:57], v57, v55                   // serial % SG == (wgMT/VECTOR_WIDTH)%SG
// src=18, dst=12
v_mov_b32 v24, v36                                 // rC[0+1*TT0I*VW+0*TT0I] = rC[0+1*TT0I*VW+1*TT0I]
v_mov_b32 v25, v37                                 // rC[0+1*TT0I*VW+0*TT0I] = rC[0+1*TT0I*VW+1*TT0I]
// src=19, dst=13
v_mov_b32 v26, v38                                 // rC[1+1*TT0I*VW+0*TT0I] = rC[1+1*TT0I*VW+1*TT0I]
v_mov_b32 v27, v39                                 // rC[1+1*TT0I*VW+0*TT0I] = rC[1+1*TT0I*VW+1*TT0I]
// src=20, dst=14
v_mov_b32 v28, v40                                 // rC[2+1*TT0I*VW+0*TT0I] = rC[2+1*TT0I*VW+1*TT0I]
v_mov_b32 v29, v41                                 // rC[2+1*TT0I*VW+0*TT0I] = rC[2+1*TT0I*VW+1*TT0I]
// src=21, dst=15
v_mov_b32 v30, v42                                 // rC[3+1*TT0I*VW+0*TT0I] = rC[3+1*TT0I*VW+1*TT0I]
v_mov_b32 v31, v43                                 // rC[3+1*TT0I*VW+0*TT0I] = rC[3+1*TT0I*VW+1*TT0I]
// src=22, dst=16
v_mov_b32 v32, v44                                 // rC[4+1*TT0I*VW+0*TT0I] = rC[4+1*TT0I*VW+1*TT0I]
v_mov_b32 v33, v45                                 // rC[4+1*TT0I*VW+0*TT0I] = rC[4+1*TT0I*VW+1*TT0I]
// src=23, dst=17
v_mov_b32 v34, v46                                 // rC[5+1*TT0I*VW+0*TT0I] = rC[5+1*TT0I*VW+1*TT0I]
v_mov_b32 v35, v47                                 // rC[5+1*TT0I*VW+0*TT0I] = rC[5+1*TT0I*VW+1*TT0I]
s_mov_b64 s[56:57], 0xFFFFFFFFFFFFFFFF             // to restore all threads active
s_or_saveexec_b64 vcc, s[56:57]                    // all threads active
label_0021: // end shift0



/* not-LocalSplitU: global write indices */

s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000                // 
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in SRD
s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000                // 
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in SRD

s_mul_i32 s58, 0x40, s[sgprWorkGroup1]             // <- wg1*MT1
s_mul_hi_u32 s57, s58, s[sgprStridesC+0]           // Scale s58 by Stride
s_mul_i32 s56, s58, s[sgprStridesC+0]              // Scale s58 by Stride
s_lshl_b64 s[56:57], s[56:57], 3                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s57       // add hi to SRD
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s57       // add hi to SRD

s_mul_hi_u32 s57, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s56, s[sgprWorkGroup2], s[sgprStridesC+1] // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[56:57], s[56:57], 3                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s57       // add hi to SRD
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s56        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s57       // add hi to SRD

v_lshrrev_b32 v49, 3, v[vgprSerial]                // vectorStaticDiv: v49 = v[vgprSerial] / 8
v_and_b32 v48, 7, v[vgprSerial]                    // vectorStaticDiv: v48 = v[vgprSerial] % 8
v_lshlrev_b32 v48, 1, v48                          // staticMultiply: v48 = v48 * 2
v_lshlrev_b32 v49, 1, v49                          // staticMultiply: v49 = v49 * 2
v_mul_lo_u32 v50, v49, s[sgprStridesC+0]           // rowStart vgpr

s_mul_i32 s56, 0x30, s[sgprWorkGroup0]             // s56 = wg0*MT0
_v_add_co_u32 v48, vcc, s56, v48                   // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s58, 0x40, s[sgprWorkGroup1]             // <- wg1*MT1
_v_add_co_u32 v49, vcc, s58, v49                   // coord1 = tid1*VW + wg1*MT1

//v_mov_b32 v48,v[vgprLocalWriteAddrA]
//v_mov_b32 v49,v[vgprLocalWriteAddrB]
//v_mov_b32 v50,v[vgprGlobalReadOffsetB]           // rowStart vgpr
//_v_add_lshl_u32 v[vgprGlobalReadOffsetA], v[vgprGlobalReadOffsetB], v[vgprLocalWriteAddrA], 0x3                 // init cb addr <-  rowStart + coord0, scaled by BPE

/* not-LocalSplitU: global write */

s_mov_b32 s56, s[sgprBeta+0]                       // tmp = Beta[0]
s_or_b32 s56, s[sgprBeta+1], s56                   // tmp |= Beta[1] 
s_cmpk_eq_u32 s56, 0x0                             // Beta == 0
s_cbranch_scc0 label_0030                          // Beta is not zero; so jump to B nonzero

s_mov_b32 s56, 0x0                                 // rMT0=0
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_lt_u32 s[sgprWorkGroup0], s58                // wg0 < nwg0-1
s_cbranch_scc1 label_0027                          // wg0 < nwg0-1 so skip rMT0 = Size0 % MT0
/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_mov_b32 s61, 0x0                                 // STATIC_DIV: divisior=48
s_mul_i32 s60, 0xaaa, s[sgprSizesFree+0]           // tmp1 = dividend * magic hi
s_lshl_b64 s[60:61], s[60:61], 0x10                // left shift 16 bits
s_mul_i32 s58, s[sgprSizesFree+0], 0xaaab          // tmp0 = dividend * magic lo
s_add_u32 s60, s58, s60                            // add lo
s_addc_u32 s61, s61, 0x0                           // add hi
s_lshr_b64 s[60:61], s[60:61], 0x21                // tmp1 = (dividend * magic) << shift
s_mov_b32 s58, s60                                 // quotient
s_mul_i32 s60, s58, 0x30                           // quotient*divisor
s_sub_u32 s56, s[sgprSizesFree+0], s60             // rReg = dividend - quotient*divisor
label_0027:
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_0029                          // edges required so jump to E1
s_mov_b32 s56, 0x0                                 // rMT1=0
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_lt_u32 s[sgprWorkGroup1], s58                // wg1 < nwg1-1
s_cbranch_scc1 label_0028                          // wg1 < nwg1-1 so skip rMT1 = Size1 % MT1
s_lshr_b32 s58, s[sgprSizesFree+1], 6              // s58 = s[sgprSizesFree+1] / 64
s_and_b32 s56, 63, s[sgprSizesFree+1]              // s56 = s[sgprSizesFree+1] % 64
label_0028:
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_0029                          // edges required so jump to E1
label_0026:

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw2); (0,1,0,0:vw2); (0,2,0,0:vw2); (0,0,1,0:vw2); (0,1,1,0:vw2); (0,2,1,0:vw2); (1,0,0,0:vw2); (1,1,0,0:vw2); (1,2,0,0:vw2); (1,0,1,0:vw2); (1,1,1,0:vw2); (1,2,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) coordOffset1=0 element-rows coordOffset0=0 rows */
_v_add_lshl_u32 v54, v50, v48, 0x3                 // init cb addr <-  rowStart + coord0, scaled by BPE
/* (d1,vc1,d0,vc0)=(0,0,1,0) coordOffset1=0 element-rows coordOffset0=16 rows */
/* (d1,vc1,d0,vc0)=(0,0,2,0) coordOffset1=0 element-rows coordOffset0=32 rows */
/* (d1,vc1,d0,vc0)=(0,1,0,0) coordOffset1=1 element-rows coordOffset0=0 rows */
/* (d1,vc1,d0,vc0)=(0,1,1,0) coordOffset1=1 element-rows coordOffset0=16 rows */
/* (d1,vc1,d0,vc0)=(0,1,2,0) coordOffset1=1 element-rows coordOffset0=32 rows */
/* (d1,vc1,d0,vc0)=(1,0,0,0) coordOffset1=32 element-rows coordOffset0=0 rows */
/* (d1,vc1,d0,vc0)=(1,0,1,0) coordOffset1=32 element-rows coordOffset0=16 rows */
/* (d1,vc1,d0,vc0)=(1,0,2,0) coordOffset1=32 element-rows coordOffset0=32 rows */
/* (d1,vc1,d0,vc0)=(1,1,0,0) coordOffset1=33 element-rows coordOffset0=0 rows */
/* (d1,vc1,d0,vc0)=(1,1,1,0) coordOffset1=33 element-rows coordOffset0=16 rows */
/* (d1,vc1,d0,vc0)=(1,1,2,0) coordOffset1=33 element-rows coordOffset0=32 rows */

/* apply mask, calc new C and issue write */
buffer_store_dwordx4 v[0:3], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx4 v[4:7], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
buffer_store_dwordx4 v[8:11], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
buffer_store_dwordx4 v[12:15], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx4 v[16:19], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
buffer_store_dwordx4 v[20:23], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_mul_i32 s56, s[sgprStridesC+0], 248              // scale StrideC *= 31 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
buffer_store_dwordx4 v[24:27], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx4 v[28:31], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
buffer_store_dwordx4 v[32:35], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
buffer_store_dwordx4 v[36:39], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx4 v[40:43], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C
buffer_store_dwordx4 v[44:47], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_branch label_0037                                // jump to end
label_0029:

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,0,0,1:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,2,0,0:vw1); (0,2,0,1:vw1); (0,0,1,0:vw1); (0,0,1,1:vw1); (0,1,1,0:vw1); (0,1,1,1:vw1); (0,2,1,0:vw1); (0,2,1,1:vw1); (1,0,0,0:vw1); (1,0,0,1:vw1); (1,1,0,0:vw1); (1,1,0,1:vw1); (1,2,0,0:vw1); (1,2,0,1:vw1) */
/******************************************/


/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) coordOffset1=0 element-rows coordOffset0=0 rows */
v_mov_b32 v51, v50                                 // rowPtr <- rowStart (first row)
_v_add_lshl_u32 v54, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v54, -1, v54, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,1) coordOffset1=0 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v55, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v55, -1, v55, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,0) coordOffset1=0 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v56, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v56, -1, v56, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,1) coordOffset1=0 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v57, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v57, -1, v57, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,0) coordOffset1=0 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v58, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v58, -1, v58, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,2,1) coordOffset1=0 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v59, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v59, -1, v59, s[72:73]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,0) coordOffset1=1 element-rows coordOffset0=0 rows */
_v_add_co_u32 v53, vcc, v49, 1                     // coord1 += d1*sg1*VW + vc1
_v_add_co_u32 v51, vcc, v51, s[sgprStridesC+0]     // rowPtr <- move to start of new row
_v_add_lshl_u32 v60, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v60, -1, v60, s[74:75]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,1) coordOffset1=1 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v61, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v61, -1, v61, s[76:77]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,0) coordOffset1=1 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v62, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[78:79], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v62, -1, v62, s[78:79]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,1) coordOffset1=1 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v63, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[80:81], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v63, -1, v63, s[80:81]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,2,0) coordOffset1=1 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v64, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[82:83], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v64, -1, v64, s[82:83]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,2,1) coordOffset1=1 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v65, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[84:85], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v65, -1, v65, s[84:85]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,0) coordOffset1=32 element-rows coordOffset0=0 rows */
_v_add_co_u32 v53, vcc, v49, 32                    // coord1 += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 32               // scale StrideC *= coordOffset1(32)
_v_add_co_u32 v51, vcc, v50, s56                   // rowPtr <- inc for non-0 (tt1+vc1))
_v_add_lshl_u32 v66, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[86:87], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v66, -1, v66, s[86:87]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,0,1) coordOffset1=32 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v67, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[88:89], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v67, -1, v67, s[88:89]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,0) coordOffset1=32 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v68, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[90:91], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v68, -1, v68, s[90:91]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,1,1) coordOffset1=32 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v69, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[92:93], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v69, -1, v69, s[92:93]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,0) coordOffset1=32 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v70, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[94:95], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v70, -1, v70, s[94:95]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,0,2,1) coordOffset1=32 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v71, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[96:97], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v71, -1, v71, s[96:97]               // clip if OOB. offset

/* apply mask, calc new C and issue write */
buffer_store_dwordx2 v[0:1], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[2:3], v55, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[4:5], v56, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[6:7], v57, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[8:9], v58, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[10:11], v59, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[12:13], v60, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[14:15], v61, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[16:17], v62, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[18:19], v63, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[20:21], v64, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[22:23], v65, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[24:25], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[26:27], v67, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[28:29], v68, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[30:31], v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[32:33], v70, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[34:35], v71, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

/******************************************/
/* Global Write Edge Batch #1 (d1,d0,vc1,vc0) =
   (1,0,1,0:vw1); (1,0,1,1:vw1); (1,1,1,0:vw1); (1,1,1,1:vw1); (1,2,1,0:vw1); (1,2,1,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,1,0,0) coordOffset1=33 element-rows coordOffset0=0 rows */
_v_add_co_u32 v53, vcc, v49, 33                    // coord1 += d1*sg1*VW + vc1
_v_add_co_u32 v51, vcc, v51, s[sgprStridesC+0]     // rowPtr <- move to start of new row
_v_add_lshl_u32 v54, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v54, -1, v54, s[62:63]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,1,0,1) coordOffset1=33 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v55, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v55, -1, v55, s[64:65]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,1,1,0) coordOffset1=33 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v56, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v56, -1, v56, s[66:67]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,1,1,1) coordOffset1=33 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v57, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v57, -1, v57, s[68:69]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,1,2,0) coordOffset1=33 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v58, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v58, -1, v58, s[70:71]               // clip if OOB. offset
/* (d1,vc1,d0,vc0)=(1,1,2,1) coordOffset1=33 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v59, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v59, -1, v59, s[72:73]               // clip if OOB. offset

/* apply mask, calc new C and issue write */
buffer_store_dwordx2 v[36:37], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[38:39], v55, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[40:41], v56, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[42:43], v57, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[44:45], v58, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
buffer_store_dwordx2 v[46:47], v59, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_branch label_0037                                // jump to end
label_0030:
s_mov_b32 s56, 0x0                                 // rMT0=0
s_add_u32 s58, -0x1, s[sgprNumWorkGroups0]         // 
s_cmp_lt_u32 s[sgprWorkGroup0], s58                // wg0 < nwg0-1
s_cbranch_scc1 label_0034                          // wg0 < nwg0-1 so skip rMT0 = Size0 % MT0
/* TODO-packed- compare against product of all packed C0 sizes not just SizesFree+0 */
s_mov_b32 s61, 0x0                                 // STATIC_DIV: divisior=48
s_mul_i32 s60, 0xaaa, s[sgprSizesFree+0]           // tmp1 = dividend * magic hi
s_lshl_b64 s[60:61], s[60:61], 0x10                // left shift 16 bits
s_mul_i32 s58, s[sgprSizesFree+0], 0xaaab          // tmp0 = dividend * magic lo
s_add_u32 s60, s58, s60                            // add lo
s_addc_u32 s61, s61, 0x0                           // add hi
s_lshr_b64 s[60:61], s[60:61], 0x21                // tmp1 = (dividend * magic) << shift
s_mov_b32 s58, s60                                 // quotient
s_mul_i32 s60, s58, 0x30                           // quotient*divisor
s_sub_u32 s56, s[sgprSizesFree+0], s60             // rReg = dividend - quotient*divisor
label_0034:
s_cmpk_gt_u32 s56, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_0036                          // edges required so jump to E1
s_mov_b32 s56, 0x0                                 // rMT1=0
s_add_u32 s58, -0x1, s[sgprNumWorkGroups1]         // 
s_cmp_lt_u32 s[sgprWorkGroup1], s58                // wg1 < nwg1-1
s_cbranch_scc1 label_0035                          // wg1 < nwg1-1 so skip rMT1 = Size1 % MT1
s_lshr_b32 s58, s[sgprSizesFree+1], 6              // s58 = s[sgprSizesFree+1] / 64
s_and_b32 s56, 63, s[sgprSizesFree+1]              // s56 = s[sgprSizesFree+1] % 64
label_0035:
s_cmpk_gt_u32 s56, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_0036                          // edges required so jump to E1
label_0033:

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw2); (0,1,0,0:vw2); (0,2,0,0:vw2); (0,0,1,0:vw2); (0,1,1,0:vw2); (0,2,1,0:vw2) */
/******************************************/
/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) coordOffset1=0 element-rows coordOffset0=0 rows */
_v_add_lshl_u32 v54, v[vgprGlobalReadOffsetB], v48, 0x3                 // init cb addr <-  rowStart + coord0, scaled by BPE
buffer_load_dwordx4 v[55:58], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) coordOffset1=0 element-rows coordOffset0=16 rows */
buffer_load_dwordx4 v[59:62], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) coordOffset1=0 element-rows coordOffset0=32 rows */
buffer_load_dwordx4 v[63:66], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,0) coordOffset1=1 element-rows coordOffset0=0 rows */
s_lshl_b32  s56, s[sgprStridesC+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
buffer_load_dwordx4 v[67:70], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,0) coordOffset1=1 element-rows coordOffset0=16 rows */
buffer_load_dwordx4 v[71:74], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,2,0) coordOffset1=1 element-rows coordOffset0=32 rows */
buffer_load_dwordx4 v[75:78], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 1, 0, 0), (0, 2, 0, 0), (0, 0, 1, 0), (0, 1, 1, 0), (0, 2, 1, 0)] */
v_mov_b32 v[83], v[vgprValuC+0]
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_fma_f32 v[vgprValuC+0], -s[sgprAlpha+1], v[vgprValuC+1], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_fma_f32 v[vgprValuC+1], s[sgprAlpha+1], v[83], v[vgprValuC+1] // *= alpha

v_mov_b32 v[83], v[vgprValuC+2]
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_fma_f32 v[vgprValuC+2], -s[sgprAlpha+1], v[vgprValuC+3], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_fma_f32 v[vgprValuC+3], s[sgprAlpha+1], v[83], v[vgprValuC+3] // *= alpha

v_mov_b32 v[83], v[vgprValuC+4]
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_fma_f32 v[vgprValuC+4], -s[sgprAlpha+1], v[vgprValuC+5], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_fma_f32 v[vgprValuC+5], s[sgprAlpha+1], v[83], v[vgprValuC+5] // *= alpha

v_mov_b32 v[83], v[vgprValuC+6]
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_fma_f32 v[vgprValuC+6], -s[sgprAlpha+1], v[vgprValuC+7], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_fma_f32 v[vgprValuC+7], s[sgprAlpha+1], v[83], v[vgprValuC+7] // *= alpha

v_mov_b32 v[83], v[vgprValuC+8]
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_fma_f32 v[vgprValuC+8], -s[sgprAlpha+1], v[vgprValuC+9], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_fma_f32 v[vgprValuC+9], s[sgprAlpha+1], v[83], v[vgprValuC+9] // *= alpha

v_mov_b32 v[83], v[vgprValuC+10]
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_fma_f32 v[vgprValuC+10], -s[sgprAlpha+1], v[vgprValuC+11], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_fma_f32 v[vgprValuC+11], s[sgprAlpha+1], v[83], v[vgprValuC+11] // *= alpha

v_mov_b32 v[83], v[vgprValuC+12]
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_fma_f32 v[vgprValuC+12], -s[sgprAlpha+1], v[vgprValuC+13], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_fma_f32 v[vgprValuC+13], s[sgprAlpha+1], v[83], v[vgprValuC+13] // *= alpha

v_mov_b32 v[83], v[vgprValuC+14]
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_fma_f32 v[vgprValuC+14], -s[sgprAlpha+1], v[vgprValuC+15], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_fma_f32 v[vgprValuC+15], s[sgprAlpha+1], v[83], v[vgprValuC+15] // *= alpha

v_mov_b32 v[83], v[vgprValuC+16]
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_fma_f32 v[vgprValuC+16], -s[sgprAlpha+1], v[vgprValuC+17], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_fma_f32 v[vgprValuC+17], s[sgprAlpha+1], v[83], v[vgprValuC+17] // *= alpha

v_mov_b32 v[83], v[vgprValuC+18]
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_fma_f32 v[vgprValuC+18], -s[sgprAlpha+1], v[vgprValuC+19], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_fma_f32 v[vgprValuC+19], s[sgprAlpha+1], v[83], v[vgprValuC+19] // *= alpha

v_mov_b32 v[83], v[vgprValuC+20]
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_fma_f32 v[vgprValuC+20], -s[sgprAlpha+1], v[vgprValuC+21], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_fma_f32 v[vgprValuC+21], s[sgprAlpha+1], v[83], v[vgprValuC+21] // *= alpha

v_mov_b32 v[83], v[vgprValuC+22]
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_fma_f32 v[vgprValuC+22], -s[sgprAlpha+1], v[vgprValuC+23], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_fma_f32 v[vgprValuC+23], s[sgprAlpha+1], v[83], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+0], v[55], s[sgprBeta+0], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+0], -v[56], s[sgprBeta+1], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[55], s[sgprBeta+1], v[vgprValuC+1] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[56], s[sgprBeta+0], v[vgprValuC+1] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+2], v[57], s[sgprBeta+0], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+2], -v[58], s[sgprBeta+1], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[57], s[sgprBeta+1], v[vgprValuC+3] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[58], s[sgprBeta+0], v[vgprValuC+3] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[0:3], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+4], v[59], s[sgprBeta+0], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+4], -v[60], s[sgprBeta+1], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[59], s[sgprBeta+1], v[vgprValuC+5] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[60], s[sgprBeta+0], v[vgprValuC+5] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+6], v[61], s[sgprBeta+0], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+6], -v[62], s[sgprBeta+1], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[61], s[sgprBeta+1], v[vgprValuC+7] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[62], s[sgprBeta+0], v[vgprValuC+7] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[4:7], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+8], v[63], s[sgprBeta+0], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+8], -v[64], s[sgprBeta+1], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[63], s[sgprBeta+1], v[vgprValuC+9] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[64], s[sgprBeta+0], v[vgprValuC+9] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+10], v[65], s[sgprBeta+0], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+10], -v[66], s[sgprBeta+1], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[65], s[sgprBeta+1], v[vgprValuC+11] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[66], s[sgprBeta+0], v[vgprValuC+11] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[8:11], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+12], v[67], s[sgprBeta+0], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+12], -v[68], s[sgprBeta+1], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[67], s[sgprBeta+1], v[vgprValuC+13] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[68], s[sgprBeta+0], v[vgprValuC+13] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+14], v[69], s[sgprBeta+0], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+14], -v[70], s[sgprBeta+1], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[69], s[sgprBeta+1], v[vgprValuC+15] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[70], s[sgprBeta+0], v[vgprValuC+15] // finalSum = sum*alpha + C*beta

s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
buffer_store_dwordx4 v[12:15], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+16], v[71], s[sgprBeta+0], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+16], -v[72], s[sgprBeta+1], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[71], s[sgprBeta+1], v[vgprValuC+17] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[72], s[sgprBeta+0], v[vgprValuC+17] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+18], v[73], s[sgprBeta+0], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+18], -v[74], s[sgprBeta+1], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[73], s[sgprBeta+1], v[vgprValuC+19] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[74], s[sgprBeta+0], v[vgprValuC+19] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[16:19], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+20], v[75], s[sgprBeta+0], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+20], -v[76], s[sgprBeta+1], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[75], s[sgprBeta+1], v[vgprValuC+21] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[76], s[sgprBeta+0], v[vgprValuC+21] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+22], v[77], s[sgprBeta+0], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+22], -v[78], s[sgprBeta+1], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[77], s[sgprBeta+1], v[vgprValuC+23] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[78], s[sgprBeta+0], v[vgprValuC+23] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[20:23], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C

/******************************************/
/* Global Write Beta Batch #1 (d1,d0,vc1,vc0) =
   (1,0,0,0:vw2); (1,1,0,0:vw2); (1,2,0,0:vw2); (1,0,1,0:vw2); (1,1,1,0:vw2); (1,2,1,0:vw2) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,0,0) coordOffset1=32 element-rows coordOffset0=0 rows */
s_mul_i32 s56, s[sgprStridesD+0], 248              // scale StrideC *= 31 * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
buffer_load_dwordx4 v[55:58], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) coordOffset1=32 element-rows coordOffset0=16 rows */
buffer_load_dwordx4 v[59:62], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,0) coordOffset1=32 element-rows coordOffset0=32 rows */
buffer_load_dwordx4 v[63:66], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,0,0) coordOffset1=33 element-rows coordOffset0=0 rows */
s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // gra SRD += inc(upper)
buffer_load_dwordx4 v[67:70], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,1,0) coordOffset1=33 element-rows coordOffset0=16 rows */
buffer_load_dwordx4 v[71:74], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:128 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,2,0) coordOffset1=33 element-rows coordOffset0=32 rows */
buffer_load_dwordx4 v[75:78], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:256 // load C for beta calc

/* rC *= alpha batchEements=[(1, 0, 0, 0), (1, 1, 0, 0), (1, 2, 0, 0), (1, 0, 1, 0), (1, 1, 1, 0), (1, 2, 1, 0)] */
v_mov_b32 v[83], v[vgprValuC+24]
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_fma_f32 v[vgprValuC+24], -s[sgprAlpha+1], v[vgprValuC+25], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_fma_f32 v[vgprValuC+25], s[sgprAlpha+1], v[83], v[vgprValuC+25] // *= alpha

v_mov_b32 v[83], v[vgprValuC+26]
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_fma_f32 v[vgprValuC+26], -s[sgprAlpha+1], v[vgprValuC+27], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_fma_f32 v[vgprValuC+27], s[sgprAlpha+1], v[83], v[vgprValuC+27] // *= alpha

v_mov_b32 v[83], v[vgprValuC+28]
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_fma_f32 v[vgprValuC+28], -s[sgprAlpha+1], v[vgprValuC+29], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_fma_f32 v[vgprValuC+29], s[sgprAlpha+1], v[83], v[vgprValuC+29] // *= alpha

v_mov_b32 v[83], v[vgprValuC+30]
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_fma_f32 v[vgprValuC+30], -s[sgprAlpha+1], v[vgprValuC+31], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_fma_f32 v[vgprValuC+31], s[sgprAlpha+1], v[83], v[vgprValuC+31] // *= alpha

v_mov_b32 v[83], v[vgprValuC+32]
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_fma_f32 v[vgprValuC+32], -s[sgprAlpha+1], v[vgprValuC+33], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_fma_f32 v[vgprValuC+33], s[sgprAlpha+1], v[83], v[vgprValuC+33] // *= alpha

v_mov_b32 v[83], v[vgprValuC+34]
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_fma_f32 v[vgprValuC+34], -s[sgprAlpha+1], v[vgprValuC+35], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_fma_f32 v[vgprValuC+35], s[sgprAlpha+1], v[83], v[vgprValuC+35] // *= alpha

v_mov_b32 v[83], v[vgprValuC+36]
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_fma_f32 v[vgprValuC+36], -s[sgprAlpha+1], v[vgprValuC+37], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_fma_f32 v[vgprValuC+37], s[sgprAlpha+1], v[83], v[vgprValuC+37] // *= alpha

v_mov_b32 v[83], v[vgprValuC+38]
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_fma_f32 v[vgprValuC+38], -s[sgprAlpha+1], v[vgprValuC+39], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_fma_f32 v[vgprValuC+39], s[sgprAlpha+1], v[83], v[vgprValuC+39] // *= alpha

v_mov_b32 v[83], v[vgprValuC+40]
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_fma_f32 v[vgprValuC+40], -s[sgprAlpha+1], v[vgprValuC+41], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_fma_f32 v[vgprValuC+41], s[sgprAlpha+1], v[83], v[vgprValuC+41] // *= alpha

v_mov_b32 v[83], v[vgprValuC+42]
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_fma_f32 v[vgprValuC+42], -s[sgprAlpha+1], v[vgprValuC+43], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_fma_f32 v[vgprValuC+43], s[sgprAlpha+1], v[83], v[vgprValuC+43] // *= alpha

v_mov_b32 v[83], v[vgprValuC+44]
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_fma_f32 v[vgprValuC+44], -s[sgprAlpha+1], v[vgprValuC+45], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_fma_f32 v[vgprValuC+45], s[sgprAlpha+1], v[83], v[vgprValuC+45] // *= alpha

v_mov_b32 v[83], v[vgprValuC+46]
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_fma_f32 v[vgprValuC+46], -s[sgprAlpha+1], v[vgprValuC+47], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_fma_f32 v[vgprValuC+47], s[sgprAlpha+1], v[83], v[vgprValuC+47] // *= alpha

/* apply mask, calc new C and issue write */

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+24], v[55], s[sgprBeta+0], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+24], -v[56], s[sgprBeta+1], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[55], s[sgprBeta+1], v[vgprValuC+25] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[56], s[sgprBeta+0], v[vgprValuC+25] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+26], v[57], s[sgprBeta+0], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+26], -v[58], s[sgprBeta+1], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[57], s[sgprBeta+1], v[vgprValuC+27] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[58], s[sgprBeta+0], v[vgprValuC+27] // finalSum = sum*alpha + C*beta

s_mul_i32 s56, s[sgprStridesD+0], 248              // scale StrideC *= 31 * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
buffer_store_dwordx4 v[24:27], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+28], v[59], s[sgprBeta+0], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+28], -v[60], s[sgprBeta+1], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[59], s[sgprBeta+1], v[vgprValuC+29] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[60], s[sgprBeta+0], v[vgprValuC+29] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+30], v[61], s[sgprBeta+0], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+30], -v[62], s[sgprBeta+1], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[61], s[sgprBeta+1], v[vgprValuC+31] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[62], s[sgprBeta+0], v[vgprValuC+31] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[28:31], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+32], v[63], s[sgprBeta+0], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+32], -v[64], s[sgprBeta+1], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[63], s[sgprBeta+1], v[vgprValuC+33] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[64], s[sgprBeta+0], v[vgprValuC+33] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+34], v[65], s[sgprBeta+0], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+34], -v[66], s[sgprBeta+1], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[65], s[sgprBeta+1], v[vgprValuC+35] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[66], s[sgprBeta+0], v[vgprValuC+35] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[32:35], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+36], v[67], s[sgprBeta+0], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+36], -v[68], s[sgprBeta+1], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[67], s[sgprBeta+1], v[vgprValuC+37] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[68], s[sgprBeta+0], v[vgprValuC+37] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+38], v[69], s[sgprBeta+0], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+38], -v[70], s[sgprBeta+1], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[69], s[sgprBeta+1], v[vgprValuC+39] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[70], s[sgprBeta+0], v[vgprValuC+39] // finalSum = sum*alpha + C*beta

s_lshl_b32  s56, s[sgprStridesD+0], 3              // Scale by BPE
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s56       // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // gra SRD += inc(upper)
buffer_store_dwordx4 v[36:39], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+40], v[71], s[sgprBeta+0], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+40], -v[72], s[sgprBeta+1], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[71], s[sgprBeta+1], v[vgprValuC+41] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[72], s[sgprBeta+0], v[vgprValuC+41] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+42], v[73], s[sgprBeta+0], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+42], -v[74], s[sgprBeta+1], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[73], s[sgprBeta+1], v[vgprValuC+43] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[74], s[sgprBeta+0], v[vgprValuC+43] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[40:43], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:128,  // store C

s_waitcnt vmcnt(5)                                 // wait C (interleaved)
v_fma_f32 v[vgprValuC+44], v[75], s[sgprBeta+0], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+44], -v[76], s[sgprBeta+1], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[75], s[sgprBeta+1], v[vgprValuC+45] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[76], s[sgprBeta+0], v[vgprValuC+45] // finalSum = sum*alpha + C*beta

v_fma_f32 v[vgprValuC+46], v[77], s[sgprBeta+0], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+46], -v[78], s[sgprBeta+1], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[77], s[sgprBeta+1], v[vgprValuC+47] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[78], s[sgprBeta+0], v[vgprValuC+47] // finalSum = sum*alpha + C*beta

buffer_store_dwordx4 v[44:47], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:256,  // store C
s_branch label_0037                                // jump to end
label_0036:

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) =
   (0,0,0,0:vw1); (0,0,0,1:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,2,0,0:vw1); (0,2,0,1:vw1); (0,0,1,0:vw1); (0,0,1,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) coordOffset1=0 element-rows coordOffset0=0 rows */
v_mov_b32 v51, v50                                 // rowPtr <- rowStart (first row)
_v_add_lshl_u32 v54, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v54, -1, v54, s[62:63]               // clip if OOB. offset
buffer_load_dwordx2 v[55:56], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,1) coordOffset1=0 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v57, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v57, -1, v57, s[64:65]               // clip if OOB. offset
buffer_load_dwordx2 v[58:59], v57, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) coordOffset1=0 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v60, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v60, -1, v60, s[66:67]               // clip if OOB. offset
buffer_load_dwordx2 v[61:62], v60, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,1) coordOffset1=0 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v63, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v63, -1, v63, s[68:69]               // clip if OOB. offset
buffer_load_dwordx2 v[64:65], v63, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,0) coordOffset1=0 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v66, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v66, -1, v66, s[70:71]               // clip if OOB. offset
buffer_load_dwordx2 v[67:68], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,2,1) coordOffset1=0 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v69, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v49, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v69, -1, v69, s[72:73]               // clip if OOB. offset
buffer_load_dwordx2 v[70:71], v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,0) coordOffset1=1 element-rows coordOffset0=0 rows */
_v_add_co_u32 v53, vcc, v49, 1                     // coord1 += d1*sg1*VW + vc1
_v_add_co_u32 v51, vcc, v51, s[sgprStridesC+0]     // rowPtr <- move to start of new row
_v_add_lshl_u32 v72, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v72, -1, v72, s[74:75]               // clip if OOB. offset
buffer_load_dwordx2 v[73:74], v72, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,1) coordOffset1=1 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v75, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v75, -1, v75, s[76:77]               // clip if OOB. offset
buffer_load_dwordx2 v[76:77], v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 1, 0, 0), (0, 1, 0, 1), (0, 2, 0, 0), (0, 2, 0, 1), (0, 0, 1, 0), (0, 0, 1, 1)] */
v_mov_b32 v[83], v[vgprValuC+0]
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_fma_f32 v[vgprValuC+0], -s[sgprAlpha+1], v[vgprValuC+1], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_fma_f32 v[vgprValuC+1], s[sgprAlpha+1], v[83], v[vgprValuC+1] // *= alpha

v_mov_b32 v[83], v[vgprValuC+2]
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_fma_f32 v[vgprValuC+2], -s[sgprAlpha+1], v[vgprValuC+3], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_fma_f32 v[vgprValuC+3], s[sgprAlpha+1], v[83], v[vgprValuC+3] // *= alpha

v_mov_b32 v[83], v[vgprValuC+4]
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_fma_f32 v[vgprValuC+4], -s[sgprAlpha+1], v[vgprValuC+5], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_fma_f32 v[vgprValuC+5], s[sgprAlpha+1], v[83], v[vgprValuC+5] // *= alpha

v_mov_b32 v[83], v[vgprValuC+6]
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_fma_f32 v[vgprValuC+6], -s[sgprAlpha+1], v[vgprValuC+7], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_fma_f32 v[vgprValuC+7], s[sgprAlpha+1], v[83], v[vgprValuC+7] // *= alpha

v_mov_b32 v[83], v[vgprValuC+8]
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_fma_f32 v[vgprValuC+8], -s[sgprAlpha+1], v[vgprValuC+9], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_fma_f32 v[vgprValuC+9], s[sgprAlpha+1], v[83], v[vgprValuC+9] // *= alpha

v_mov_b32 v[83], v[vgprValuC+10]
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_fma_f32 v[vgprValuC+10], -s[sgprAlpha+1], v[vgprValuC+11], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_fma_f32 v[vgprValuC+11], s[sgprAlpha+1], v[83], v[vgprValuC+11] // *= alpha

v_mov_b32 v[83], v[vgprValuC+12]
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_fma_f32 v[vgprValuC+12], -s[sgprAlpha+1], v[vgprValuC+13], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_fma_f32 v[vgprValuC+13], s[sgprAlpha+1], v[83], v[vgprValuC+13] // *= alpha

v_mov_b32 v[83], v[vgprValuC+14]
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_fma_f32 v[vgprValuC+14], -s[sgprAlpha+1], v[vgprValuC+15], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_fma_f32 v[vgprValuC+15], s[sgprAlpha+1], v[83], v[vgprValuC+15] // *= alpha

s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_fma_f32 v[vgprValuC+0], v[55], s[sgprBeta+0], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+0], -v[56], s[sgprBeta+1], v[vgprValuC+0] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[55], s[sgprBeta+1], v[vgprValuC+1] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+1], v[56], s[sgprBeta+0], v[vgprValuC+1] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[0:1], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+2], v[58], s[sgprBeta+0], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+2], -v[59], s[sgprBeta+1], v[vgprValuC+2] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[58], s[sgprBeta+1], v[vgprValuC+3] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+3], v[59], s[sgprBeta+0], v[vgprValuC+3] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[2:3], v57, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+4], v[61], s[sgprBeta+0], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+4], -v[62], s[sgprBeta+1], v[vgprValuC+4] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[61], s[sgprBeta+1], v[vgprValuC+5] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+5], v[62], s[sgprBeta+0], v[vgprValuC+5] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[4:5], v60, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+6], v[64], s[sgprBeta+0], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+6], -v[65], s[sgprBeta+1], v[vgprValuC+6] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[64], s[sgprBeta+1], v[vgprValuC+7] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+7], v[65], s[sgprBeta+0], v[vgprValuC+7] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[6:7], v63, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+8], v[67], s[sgprBeta+0], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+8], -v[68], s[sgprBeta+1], v[vgprValuC+8] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[67], s[sgprBeta+1], v[vgprValuC+9] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+9], v[68], s[sgprBeta+0], v[vgprValuC+9] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[8:9], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+10], v[70], s[sgprBeta+0], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+10], -v[71], s[sgprBeta+1], v[vgprValuC+10] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[70], s[sgprBeta+1], v[vgprValuC+11] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+11], v[71], s[sgprBeta+0], v[vgprValuC+11] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[10:11], v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+12], v[73], s[sgprBeta+0], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+12], -v[74], s[sgprBeta+1], v[vgprValuC+12] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[73], s[sgprBeta+1], v[vgprValuC+13] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+13], v[74], s[sgprBeta+0], v[vgprValuC+13] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[12:13], v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+14], v[76], s[sgprBeta+0], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+14], -v[77], s[sgprBeta+1], v[vgprValuC+14] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[76], s[sgprBeta+1], v[vgprValuC+15] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+15], v[77], s[sgprBeta+0], v[vgprValuC+15] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[14:15], v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

/******************************************/
/* Global Write Beta Edge Batch #1 (d1,d0,vc1,vc0) =
   (0,1,1,0:vw1); (0,1,1,1:vw1); (0,2,1,0:vw1); (0,2,1,1:vw1); (1,0,0,0:vw1); (1,0,0,1:vw1); (1,1,0,0:vw1); (1,1,0,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,1,1,0) coordOffset1=1 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v54, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v54, -1, v54, s[62:63]               // clip if OOB. offset
buffer_load_dwordx2 v[55:56], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,1) coordOffset1=1 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v57, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v57, -1, v57, s[64:65]               // clip if OOB. offset
buffer_load_dwordx2 v[58:59], v57, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,2,0) coordOffset1=1 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v60, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v60, -1, v60, s[66:67]               // clip if OOB. offset
buffer_load_dwordx2 v[61:62], v60, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,2,1) coordOffset1=1 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v63, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v63, -1, v63, s[68:69]               // clip if OOB. offset
buffer_load_dwordx2 v[64:65], v63, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,0) coordOffset1=32 element-rows coordOffset0=0 rows */
_v_add_co_u32 v53, vcc, v49, 32                    // coord1 += d1*sg1*VW + vc1
s_mul_i32 s56, s[sgprStridesC+0], 32               // scale StrideC *= coordOffset1(32)
_v_add_co_u32 v51, vcc, v50, s56                   // rowPtr <- inc for non-0 (tt1+vc1))
_v_add_lshl_u32 v66, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v66, -1, v66, s[70:71]               // clip if OOB. offset
buffer_load_dwordx2 v[67:68], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,0,1) coordOffset1=32 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v69, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v69, -1, v69, s[72:73]               // clip if OOB. offset
buffer_load_dwordx2 v[70:71], v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,0) coordOffset1=32 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v72, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v72, -1, v72, s[74:75]               // clip if OOB. offset
buffer_load_dwordx2 v[73:74], v72, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,1,1) coordOffset1=32 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v75, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v75, -1, v75, s[76:77]               // clip if OOB. offset
buffer_load_dwordx2 v[76:77], v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(0, 1, 1, 0), (0, 1, 1, 1), (0, 2, 1, 0), (0, 2, 1, 1), (1, 0, 0, 0), (1, 0, 0, 1), (1, 1, 0, 0), (1, 1, 0, 1)] */
v_mov_b32 v[83], v[vgprValuC+16]
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_fma_f32 v[vgprValuC+16], -s[sgprAlpha+1], v[vgprValuC+17], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_fma_f32 v[vgprValuC+17], s[sgprAlpha+1], v[83], v[vgprValuC+17] // *= alpha

v_mov_b32 v[83], v[vgprValuC+18]
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_fma_f32 v[vgprValuC+18], -s[sgprAlpha+1], v[vgprValuC+19], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_fma_f32 v[vgprValuC+19], s[sgprAlpha+1], v[83], v[vgprValuC+19] // *= alpha

v_mov_b32 v[83], v[vgprValuC+20]
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_fma_f32 v[vgprValuC+20], -s[sgprAlpha+1], v[vgprValuC+21], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_fma_f32 v[vgprValuC+21], s[sgprAlpha+1], v[83], v[vgprValuC+21] // *= alpha

v_mov_b32 v[83], v[vgprValuC+22]
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_fma_f32 v[vgprValuC+22], -s[sgprAlpha+1], v[vgprValuC+23], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_fma_f32 v[vgprValuC+23], s[sgprAlpha+1], v[83], v[vgprValuC+23] // *= alpha

v_mov_b32 v[83], v[vgprValuC+24]
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_fma_f32 v[vgprValuC+24], -s[sgprAlpha+1], v[vgprValuC+25], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_fma_f32 v[vgprValuC+25], s[sgprAlpha+1], v[83], v[vgprValuC+25] // *= alpha

v_mov_b32 v[83], v[vgprValuC+26]
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_fma_f32 v[vgprValuC+26], -s[sgprAlpha+1], v[vgprValuC+27], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_fma_f32 v[vgprValuC+27], s[sgprAlpha+1], v[83], v[vgprValuC+27] // *= alpha

v_mov_b32 v[83], v[vgprValuC+28]
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_fma_f32 v[vgprValuC+28], -s[sgprAlpha+1], v[vgprValuC+29], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_fma_f32 v[vgprValuC+29], s[sgprAlpha+1], v[83], v[vgprValuC+29] // *= alpha

v_mov_b32 v[83], v[vgprValuC+30]
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_fma_f32 v[vgprValuC+30], -s[sgprAlpha+1], v[vgprValuC+31], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_fma_f32 v[vgprValuC+31], s[sgprAlpha+1], v[83], v[vgprValuC+31] // *= alpha

s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_fma_f32 v[vgprValuC+16], v[55], s[sgprBeta+0], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+16], -v[56], s[sgprBeta+1], v[vgprValuC+16] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[55], s[sgprBeta+1], v[vgprValuC+17] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+17], v[56], s[sgprBeta+0], v[vgprValuC+17] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[16:17], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+18], v[58], s[sgprBeta+0], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+18], -v[59], s[sgprBeta+1], v[vgprValuC+18] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[58], s[sgprBeta+1], v[vgprValuC+19] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+19], v[59], s[sgprBeta+0], v[vgprValuC+19] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[18:19], v57, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+20], v[61], s[sgprBeta+0], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+20], -v[62], s[sgprBeta+1], v[vgprValuC+20] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[61], s[sgprBeta+1], v[vgprValuC+21] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+21], v[62], s[sgprBeta+0], v[vgprValuC+21] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[20:21], v60, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+22], v[64], s[sgprBeta+0], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+22], -v[65], s[sgprBeta+1], v[vgprValuC+22] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[64], s[sgprBeta+1], v[vgprValuC+23] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+23], v[65], s[sgprBeta+0], v[vgprValuC+23] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[22:23], v63, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+24], v[67], s[sgprBeta+0], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+24], -v[68], s[sgprBeta+1], v[vgprValuC+24] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[67], s[sgprBeta+1], v[vgprValuC+25] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+25], v[68], s[sgprBeta+0], v[vgprValuC+25] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[24:25], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+26], v[70], s[sgprBeta+0], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+26], -v[71], s[sgprBeta+1], v[vgprValuC+26] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[70], s[sgprBeta+1], v[vgprValuC+27] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+27], v[71], s[sgprBeta+0], v[vgprValuC+27] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[26:27], v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+28], v[73], s[sgprBeta+0], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+28], -v[74], s[sgprBeta+1], v[vgprValuC+28] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[73], s[sgprBeta+1], v[vgprValuC+29] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+29], v[74], s[sgprBeta+0], v[vgprValuC+29] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[28:29], v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+30], v[76], s[sgprBeta+0], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+30], -v[77], s[sgprBeta+1], v[vgprValuC+30] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[76], s[sgprBeta+1], v[vgprValuC+31] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+31], v[77], s[sgprBeta+0], v[vgprValuC+31] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[30:31], v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

/******************************************/
/* Global Write Beta Edge Batch #2 (d1,d0,vc1,vc0) =
   (1,2,0,0:vw1); (1,2,0,1:vw1); (1,0,1,0:vw1); (1,0,1,1:vw1); (1,1,1,0:vw1); (1,1,1,1:vw1); (1,2,1,0:vw1); (1,2,1,1:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(1,0,2,0) coordOffset1=32 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v54, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[62:63], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v54, -1, v54, s[62:63]               // clip if OOB. offset
buffer_load_dwordx2 v[55:56], v54, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,0,2,1) coordOffset1=32 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v57, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[64:65], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v57, -1, v57, s[64:65]               // clip if OOB. offset
buffer_load_dwordx2 v[58:59], v57, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,0,0) coordOffset1=33 element-rows coordOffset0=0 rows */
_v_add_co_u32 v53, vcc, v49, 33                    // coord1 += d1*sg1*VW + vc1
_v_add_co_u32 v51, vcc, v51, s[sgprStridesC+0]     // rowPtr <- move to start of new row
_v_add_lshl_u32 v60, v51, v48, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v48, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[66:67], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v60, -1, v60, s[66:67]               // clip if OOB. offset
buffer_load_dwordx2 v[61:62], v60, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,0,1) coordOffset1=33 element-rows coordOffset0=1 rows */
_v_add_co_u32 v52, vcc, v48, 1                     // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v63, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[68:69], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v63, -1, v63, s[68:69]               // clip if OOB. offset
buffer_load_dwordx2 v[64:65], v63, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,1,0) coordOffset1=33 element-rows coordOffset0=16 rows */
_v_add_co_u32 v52, vcc, v48, 16                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v66, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[70:71], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v66, -1, v66, s[70:71]               // clip if OOB. offset
buffer_load_dwordx2 v[67:68], v66, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,1,1) coordOffset1=33 element-rows coordOffset0=17 rows */
_v_add_co_u32 v52, vcc, v48, 17                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v69, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[72:73], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v69, -1, v69, s[72:73]               // clip if OOB. offset
buffer_load_dwordx2 v[70:71], v69, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,2,0) coordOffset1=33 element-rows coordOffset0=32 rows */
_v_add_co_u32 v52, vcc, v48, 32                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v72, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[74:75], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v72, -1, v72, s[74:75]               // clip if OOB. offset
buffer_load_dwordx2 v[73:74], v72, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(1,1,2,1) coordOffset1=33 element-rows coordOffset0=33 rows */
_v_add_co_u32 v52, vcc, v48, 33                    // coord0 += d0*sg0*VW + vc0
_v_add_lshl_u32 v75, v51, v52, 0x3                 // accumulate d0 lower and *= bpe into addr
/* TODO-packed: compare against product of packed sizes */
v_cmp_lt_u32 s[56:57], v52, s[sgprSizesFree+0]     // coord0 < size0
v_cmp_lt_u32 s[58:59], v53, s[sgprSizesFree+1]     // coord1 < size1
s_and_b64 s[76:77], s[56:57], s[58:59]             // in0 && in1
v_cndmask_b32 v75, -1, v75, s[76:77]               // clip if OOB. offset
buffer_load_dwordx2 v[76:77], v75, s[sgprSrdC:sgprSrdC+3], 0, offen offset:0 // load C for beta calc

/* rC *= alpha batchEements=[(1, 2, 0, 0), (1, 2, 0, 1), (1, 0, 1, 0), (1, 0, 1, 1), (1, 1, 1, 0), (1, 1, 1, 1), (1, 2, 1, 0), (1, 2, 1, 1)] */
v_mov_b32 v[83], v[vgprValuC+32]
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_fma_f32 v[vgprValuC+32], -s[sgprAlpha+1], v[vgprValuC+33], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_fma_f32 v[vgprValuC+33], s[sgprAlpha+1], v[83], v[vgprValuC+33] // *= alpha

v_mov_b32 v[83], v[vgprValuC+34]
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_fma_f32 v[vgprValuC+34], -s[sgprAlpha+1], v[vgprValuC+35], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_fma_f32 v[vgprValuC+35], s[sgprAlpha+1], v[83], v[vgprValuC+35] // *= alpha

v_mov_b32 v[83], v[vgprValuC+36]
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_fma_f32 v[vgprValuC+36], -s[sgprAlpha+1], v[vgprValuC+37], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_fma_f32 v[vgprValuC+37], s[sgprAlpha+1], v[83], v[vgprValuC+37] // *= alpha

v_mov_b32 v[83], v[vgprValuC+38]
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_fma_f32 v[vgprValuC+38], -s[sgprAlpha+1], v[vgprValuC+39], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_fma_f32 v[vgprValuC+39], s[sgprAlpha+1], v[83], v[vgprValuC+39] // *= alpha

v_mov_b32 v[83], v[vgprValuC+40]
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_fma_f32 v[vgprValuC+40], -s[sgprAlpha+1], v[vgprValuC+41], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_fma_f32 v[vgprValuC+41], s[sgprAlpha+1], v[83], v[vgprValuC+41] // *= alpha

v_mov_b32 v[83], v[vgprValuC+42]
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_fma_f32 v[vgprValuC+42], -s[sgprAlpha+1], v[vgprValuC+43], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_fma_f32 v[vgprValuC+43], s[sgprAlpha+1], v[83], v[vgprValuC+43] // *= alpha

v_mov_b32 v[83], v[vgprValuC+44]
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_fma_f32 v[vgprValuC+44], -s[sgprAlpha+1], v[vgprValuC+45], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_fma_f32 v[vgprValuC+45], s[sgprAlpha+1], v[83], v[vgprValuC+45] // *= alpha

v_mov_b32 v[83], v[vgprValuC+46]
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_fma_f32 v[vgprValuC+46], -s[sgprAlpha+1], v[vgprValuC+47], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_fma_f32 v[vgprValuC+47], s[sgprAlpha+1], v[83], v[vgprValuC+47] // *= alpha

s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue write */
v_fma_f32 v[vgprValuC+32], v[55], s[sgprBeta+0], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+32], -v[56], s[sgprBeta+1], v[vgprValuC+32] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[55], s[sgprBeta+1], v[vgprValuC+33] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+33], v[56], s[sgprBeta+0], v[vgprValuC+33] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[32:33], v54, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+34], v[58], s[sgprBeta+0], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+34], -v[59], s[sgprBeta+1], v[vgprValuC+34] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[58], s[sgprBeta+1], v[vgprValuC+35] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+35], v[59], s[sgprBeta+0], v[vgprValuC+35] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[34:35], v57, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+36], v[61], s[sgprBeta+0], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+36], -v[62], s[sgprBeta+1], v[vgprValuC+36] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[61], s[sgprBeta+1], v[vgprValuC+37] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+37], v[62], s[sgprBeta+0], v[vgprValuC+37] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[36:37], v60, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+38], v[64], s[sgprBeta+0], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+38], -v[65], s[sgprBeta+1], v[vgprValuC+38] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[64], s[sgprBeta+1], v[vgprValuC+39] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+39], v[65], s[sgprBeta+0], v[vgprValuC+39] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[38:39], v63, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+40], v[67], s[sgprBeta+0], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+40], -v[68], s[sgprBeta+1], v[vgprValuC+40] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[67], s[sgprBeta+1], v[vgprValuC+41] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+41], v[68], s[sgprBeta+0], v[vgprValuC+41] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[40:41], v66, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+42], v[70], s[sgprBeta+0], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+42], -v[71], s[sgprBeta+1], v[vgprValuC+42] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[70], s[sgprBeta+1], v[vgprValuC+43] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+43], v[71], s[sgprBeta+0], v[vgprValuC+43] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[42:43], v69, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+44], v[73], s[sgprBeta+0], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+44], -v[74], s[sgprBeta+1], v[vgprValuC+44] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[73], s[sgprBeta+1], v[vgprValuC+45] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+45], v[74], s[sgprBeta+0], v[vgprValuC+45] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[44:45], v72, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C

v_fma_f32 v[vgprValuC+46], v[76], s[sgprBeta+0], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+46], -v[77], s[sgprBeta+1], v[vgprValuC+46] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[76], s[sgprBeta+1], v[vgprValuC+47] // finalSum = sum*alpha + C*beta
v_fma_f32 v[vgprValuC+47], v[77], s[sgprBeta+0], v[vgprValuC+47] // finalSum = sum*alpha + C*beta

buffer_store_dwordx2 v[46:47], v75, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0,  // store C
s_branch label_0037                                // jump to end
label_0037:

label_0038:  /// KernelEnd
s_endpgm                                           // Kernel End

