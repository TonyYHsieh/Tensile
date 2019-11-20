

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU" 
.text
.p2align 8
.amdgpu_hsa_kernel Cijk_Alik_Bljk_BBH_MT64x128x32_SE_K1
Cijk_Alik_Bljk_BBH_MT64x128x32_SE_K1:
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
/* ThreadTile= 4 x 8 */
/* SubGroup= 16 x 16 */
/* VectorWidth=4 */
/* GlobalLoadVectorWidthA=4, GlobalLoadVectorWidthB=4 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=False */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Alik_Bljk_BBH_MT64x128x32_SE_K1
    SymbolName: 'Cijk_Alik_Bljk_BBH_MT64x128x32_SE_K1@kd'
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
    CodeProps:
      KernargSegmentSize: 148
      GroupSegmentFixedSize: 28672
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign:  8
      WavefrontSize:        64
      NumSGPRs:             98
      NumVGPRs:             108
      MaxFlatWorkGroupSize: 256
.end_amd_amdgpu_hsa_metadata

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
.set vgprValuA_X0_I0, 32
.set vgprValuA_X1_I0, 34
.set vgprG2LA, 36
.set vgprValuB_X0_I0, 40
.set vgprValuB_X1_I0, 44
.set vgprG2LB, 48
.set vgprLocalWriteAddrA, 56
.set vgprLocalWriteAddrB, 57
.set vgprGlobalReadOffsetA, 58
.set vgprGlobalReadOffsetB, 60
.set vgprLocalReadAddrA, 64
.set vgprLocalReadAddrB, 65
.set vgprSerial, 66
/* Num VGPR=67 */

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
.set sgprSizesFree, 41
.set sgprSizesSum, 44
.set sgprLoopCounters, 45
.set sgprOrigLoopCounter, 46
.set sgprStridesA, 47
.set sgprStridesB, 49
.set sgprAddressA, 51
.set sgprAddressB, 53
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
.macro GLOBAL_OFFSET_A vgprAddr vgprOffsetL vgprOffset0I vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStridesA+0], v[\vgprOffset0I] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprTmp+0], v[\vgprOffsetL] // accumulate d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, 0x4, v[\vgprAddr+0] // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffset1J vgprOffsetL vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStridesB+0], v[\vgprOffsetL] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprTmp+0], v[\vgprOffset1J] // accumulate d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, 0x4, v[\vgprAddr+0] // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm
 //****************
 // start kernel

.long 0xC00A0D00, 0x00000028
.long 0xC00A0C00, 0x00000050
.long 0xC00A0600, 0x00000008
.long 0xC0020B40, 0x0000006C
.long 0xBEFC00FF, 0x00003000
.long 0x7EC80300
.long 0x26CA00BF
.long 0x2004C886
.long 0xB8D0F804
.long 0xD1130004, 0x0000A0B0
.long 0x20CC0884
.long 0x7EA40566
.long 0xD1130067, 0x0000A08F
.long 0x7EA20567
.long 0xBF068151
.long 0xBF840114
.long 0xBF8CC07F
.long 0xBE880034
.long 0xBE890035
.long 0xBE8B00FF, 0x00020000
.long 0x80B85418
.long 0x80B95518
.long 0x8EB88138
.long 0x80388438
.long 0x82398039
.long 0xBF068039
.long 0x850AFF38, 0x80000000
.long 0xBE8A00FF, 0x80000000
.long 0x9254C030
.long 0x92545402
.long 0x8E558452
.long 0x92533055
.long 0x81545354
.long 0x2000CA84
.long 0xD2850004, 0x00020030
.long 0x2602CA8F
.long 0x24020281
.long 0x32A40304
.long 0x68A4A454
.long 0x24A4A481
.long 0x8E478330
.long 0x80C7FF47, 0x00000108
.long 0x68A6A447
.long 0x68A8A647
.long 0x68AAA847
.long 0xBECC00FF, 0x00000420
.long 0x924C4C52
.long 0xBE8C0036
.long 0xBE8D0037
.long 0xBE8F00FF, 0x00020000
.long 0x80BA541A
.long 0x80BB551A
.long 0x8EBA813A
.long 0x803A843A
.long 0x823B803B
.long 0xBF06803B
.long 0x850EFF3A, 0x80000000
.long 0xBE8E00FF, 0x80000000
.long 0x9254FF32, 0x00000080
.long 0x92545403
.long 0x925532A0
.long 0x92555552
.long 0x81545554
.long 0x2004CA84
.long 0x2606CA8F
.long 0x24060681
.long 0xD2850004, 0x00020432
.long 0x32AC0704
.long 0x68ACAC54
.long 0x24ACAC81
.long 0x8E4A8332
.long 0x80CAFF4A, 0x00000108
.long 0x68AEAC4A
.long 0x68B0AE4A
.long 0x68B2B04A
.long 0x68B4B24A
.long 0x68B6B44A
.long 0x68B8B64A
.long 0x68BAB84A
.long 0xBECE00FF, 0x00000840
.long 0x924E4E52
.long 0x814EFF4E, 0x00002100
.long 0xBF8A0000
.long 0xBEFC004C
.long 0x814DFF4C, 0x00001080
.long 0xE0511000, 0x80023052
.long 0xE0511108, 0x80023153
.long 0xE0511210, 0x80023254
.long 0xE0511318, 0x80023355
.long 0xBEFC004E
.long 0x814FFF4E, 0x00002100
.long 0xE0511000, 0x80034456
.long 0xE0511108, 0x80034557
.long 0xE0511210, 0x80034658
.long 0xE0511318, 0x80034759
.long 0xE0511420, 0x8003485A
.long 0xE0511528, 0x8003495B
.long 0xE0511630, 0x80034A5C
.long 0xE0511738, 0x80034B5D
.long 0xBEFC004D
.long 0x68A4A4C0
.long 0x68A6A6C0
.long 0x68A8A8C0
.long 0x68AAAAC0
.long 0x68ACACC0
.long 0x68AEAEC0
.long 0x68B0B0C0
.long 0x68B2B2C0
.long 0x68B4B4C0
.long 0x68B6B6C0
.long 0x68B8B8C0
.long 0x68BABAC0
.long 0xE0511000, 0x80023052
.long 0xE0511108, 0x80023153
.long 0xE0511210, 0x80023254
.long 0xE0511318, 0x80023355
.long 0xBEFC004F
.long 0xBF800000
.long 0xE0511000, 0x80034456
.long 0xE0511108, 0x80034557
.long 0xE0511210, 0x80034658
.long 0xE0511318, 0x80034759
.long 0xE0511420, 0x8003485A
.long 0xE0511528, 0x8003495B
.long 0xE0511630, 0x80034A5C
.long 0xE0511738, 0x80034B5D
.long 0x68A4A4C0
.long 0x68A6A6C0
.long 0x68A8A8C0
.long 0x68AAAAC0
.long 0x68ACACC0
.long 0x68AEAEC0
.long 0x68B0B0C0
.long 0x68B2B2C0
.long 0x68B4B4C0
.long 0x68B6B6C0
.long 0x68B8B8C0
.long 0x68BABAC0
.long 0xBEFC004C
.long 0xBF8C4F74
.long 0xBF8A0000
.long 0xBF8C0F7C
.long 0xBF8A0000
.long 0x8F2E852D
.long 0x80AE2E80
.long 0xBF06802E
.long 0xBF850064
.long 0xBF8A0000
.long 0xE0511000, 0x80023052
.long 0xE0511108, 0x80023153
.long 0xE0511210, 0x80023254
.long 0xE0511318, 0x80023355
.long 0xBEFC004E
.long 0xBF800000
.long 0xE0511000, 0x80034456
.long 0xE0511108, 0x80034557
.long 0xE0511210, 0x80034658
.long 0xE0511318, 0x80034759
.long 0xE0511420, 0x8003485A
.long 0xE0511528, 0x8003495B
.long 0xE0511630, 0x80034A5C
.long 0xE0511738, 0x80034B5D
.long 0xBF8C4F74
.long 0xBF8F0001
.long 0xBF8A0000
.long 0x68A4A4C0
.long 0x68A6A6C0
.long 0x68A8A8C0
.long 0x68AAAAC0
.long 0x68ACACC0
.long 0x68AEAEC0
.long 0x68B0B0C0
.long 0x68B2B2C0
.long 0xBF8F0000
.long 0xBF8C0F7C
.long 0xBF8F0001
.long 0xBF8A0000
.long 0x68B4B4C0
.long 0x68B6B6C0
.long 0x68B8B8C0
.long 0x68BABAC0
.long 0xBF8F0000
.long 0xBEFC004D
.long 0x802E812E
.long 0xBF8A0000
.long 0xE0511000, 0x80023052
.long 0xE0511108, 0x80023153
.long 0xE0511210, 0x80023254
.long 0xE0511318, 0x80023355
.long 0xBEFC004F
.long 0xBF800000
.long 0xE0511000, 0x80034456
.long 0xE0511108, 0x80034557
.long 0xE0511210, 0x80034658
.long 0xE0511318, 0x80034759
.long 0xE0511420, 0x8003485A
.long 0xE0511528, 0x8003495B
.long 0xE0511630, 0x80034A5C
.long 0xE0511738, 0x80034B5D
.long 0xBF8C4F74
.long 0xBF8A0000
.long 0xBF8F0001
.long 0x68A4A4C0
.long 0x68A6A6C0
.long 0x68A8A8C0
.long 0x68AAAAC0
.long 0x68ACACC0
.long 0x68AEAEC0
.long 0x68B0B0C0
.long 0x68B2B2C0
.long 0xBF8F0000
.long 0xBF8C0F7C
.long 0xBF8A0000
.long 0xBF8F0001
.long 0x68B4B4C0
.long 0x68B6B6C0
.long 0x68B8B8C0
.long 0x68BABAC0
.long 0xBF8F0000
.long 0xBEFC004C
.long 0x802E812E
.long 0xBF00C22E
.long 0xBF84FF9C
.long 0xBF8C0F78
.long 0xBF8A0000
.long 0xBF8C0F70
.long 0xBF8A0000
.long 0xBF810000
.long 0xD3D94000, 0x18000080
.long 0xD3D94001, 0x18000080
.long 0xD3D94002, 0x18000080
.long 0xD3D94003, 0x18000080
.long 0xD3D94004, 0x18000080
.long 0xD3D94005, 0x18000080
.long 0xD3D94006, 0x18000080
.long 0xD3D94007, 0x18000080
.long 0xD3D94008, 0x18000080
.long 0xD3D94009, 0x18000080
.long 0xD3D9400A, 0x18000080
.long 0xD3D9400B, 0x18000080
.long 0xD3D9400C, 0x18000080
.long 0xD3D9400D, 0x18000080
.long 0xD3D9400E, 0x18000080
.long 0xD3D9400F, 0x18000080
.long 0xD3D94010, 0x18000080
.long 0xD3D94011, 0x18000080
.long 0xD3D94012, 0x18000080
.long 0xD3D94013, 0x18000080
.long 0xD3D94014, 0x18000080
.long 0xD3D94015, 0x18000080
.long 0xD3D94016, 0x18000080
.long 0xD3D94017, 0x18000080
.long 0xD3D94018, 0x18000080
.long 0xD3D94019, 0x18000080
.long 0xD3D9401A, 0x18000080
.long 0xD3D9401B, 0x18000080
.long 0xD3D9401C, 0x18000080
.long 0xD3D9401D, 0x18000080
.long 0xD3D9401E, 0x18000080
.long 0xD3D9401F, 0x18000080
.long 0xC0060700, 0x00000000
.long 0xC00A0A00, 0x00000038
.long 0xC00A0900, 0x00000040
.long 0xC00A0800, 0x00000018
.long 0xD1130001, 0x00013F65
.long 0xD285005E, 0x00020290
.long 0x20020282
.long 0xD2850001, 0x00020282
.long 0x68BCBD01
.long 0x2002CA85
.long 0x68BCBD01
.long 0x24BCBC82
.long 0x68BCBC80
.long 0x68BEBCFF, 0x00001080
.long 0xBF8A0000
.long 0xD1130001, 0x00013F65
.long 0xD2850060, 0x00020290
.long 0x20020282
.long 0xD2850001, 0x00020282
.long 0x68C0C101
.long 0x2002CA85
.long 0x68C0C101
.long 0x24C0C082
.long 0x9254FF52, 0x00000840
.long 0x68C0C054
.long 0x68C0C0FF, 0x00002100
.long 0x68C2C0FF, 0x00002100
.long 0xBF8CC07F
.long 0xBE900022
.long 0xBE910023
.long 0xBE9200FF, 0x80000000
.long 0xBE9300FF, 0x00020000
.long 0xBE940020
.long 0xBE950021
.long 0xBE9600FF, 0x80000000
.long 0xBE9700FF, 0x00020000
.long 0x925603FF, 0x00000080
.long 0x96552656
.long 0x92542656
.long 0x8ED48154
.long 0x80105410
.long 0x82115511
.long 0x80145414
.long 0x82155515
.long 0x96552704
.long 0x92542704
.long 0x8ED48154
.long 0x80105410
.long 0x82115511
.long 0x80145414
.long 0x82155515
.long 0x24C8CC86
.long 0x68C8C965
.long 0xD2850004, 0x0002CCA0
.long 0xD2850003, 0x00004D04
.long 0x2608C89F
.long 0xD2850005, 0x00004D04
.long 0x2608C8BF
.long 0x200C0885
.long 0x240C0C82
.long 0x68D60B03
.long 0x925402C0
.long 0x32D40C54
.long 0xD1FE0068, 0x0206D76A
.long 0xBF8A0000
.long 0xD86C0000, 0x2000005E
.long 0xD86C0840, 0x2100005E
.long 0xD86C0008, 0x2200005E
.long 0xD86C0848, 0x2300005E
.long 0xD86C0010, 0x2400005E
.long 0xD86C0850, 0x2500005E
.long 0xD86C0018, 0x2600005E
.long 0xD86C0858, 0x2700005E
.long 0xD86C0020, 0x2800005E
.long 0xD86C0860, 0x2900005E
.long 0xD86C0028, 0x2A00005E
.long 0xD86C0868, 0x2B00005E
.long 0xD86C0030, 0x2C00005E
.long 0xD86C0870, 0x2D00005E
.long 0xD86C0038, 0x2E00005E
.long 0xD86C0878, 0x2F00005E
.long 0xBF8A0000
.long 0xD86C0000, 0x44000060
.long 0xD86C0008, 0x45000060
.long 0xD86C0010, 0x46000060
.long 0xD86C0018, 0x47000060
.long 0x8F2E852D
.long 0x80AE2E80
.long 0xBF06802E
.long 0xBF850276
.long 0xBF8CC37F
.long 0xD3EC0000, 0x04028920
.long 0xD86C0020, 0x48000060
.long 0xD86C0028, 0x49000060
.long 0xD86C0030, 0x4A000060
.long 0xD86C0038, 0x4B000060
.long 0xD3EC0010, 0x04428921
.long 0xBF8A0000
.long 0xBF8CC67F
.long 0xD3EC0000, 0x04028B22
.long 0xD3EC0010, 0x04428B23
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04028D24
.long 0xD3EC0010, 0x04428D25
.long 0xBF8CC47F
.long 0xD3EC0000, 0x04028F26
.long 0xD3EC0010, 0x04428F27
.long 0xBF8CC07F
.long 0xD3EC0000, 0x04029128
.long 0xD3EC0010, 0x04429129
.long 0xBF8F0000
.long 0xD3EC0000, 0x0402932A
.long 0xBF8A0000
.long 0xD86C0000, 0x3000005F
.long 0xD86C0840, 0x3100005F
.long 0xD3EC0010, 0x0442932B
.long 0xD86C0008, 0x3200005F
.long 0xD86C0848, 0x3300005F
.long 0xD86C0010, 0x3400005F
.long 0xD86C0850, 0x3500005F
.long 0xD3EC0000, 0x0402952C
.long 0xD86C0018, 0x3600005F
.long 0xD86C0858, 0x3700005F
.long 0xD86C0020, 0x3800005F
.long 0xD86C0860, 0x3900005F
.long 0xD86C0028, 0x3A00005F
.long 0xD3EC0010, 0x0442952D
.long 0xD86C0868, 0x3B00005F
.long 0xD86C0030, 0x3C00005F
.long 0xD86C0870, 0x3D00005F
.long 0xD86C0038, 0x3E00005F
.long 0xD86C0878, 0x3F00005F
.long 0xD3EC0000, 0x0402972E
.long 0xBF8A0000
.long 0xD86C0000, 0x4C000061
.long 0xD86C0008, 0x4D000061
.long 0xD3EC0010, 0x0442972F
.long 0xD86C0010, 0x4E000061
.long 0xD86C0018, 0x4F000061
.long 0xD86C0020, 0x50000061
.long 0xD86C0028, 0x51000061
.long 0xBF8F0001
.long 0x802E812E
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04029930
.long 0xD86C0030, 0x52000061
.long 0xD86C0038, 0x53000061
.long 0xD3EC0010, 0x04429931
.long 0xBF8A0000
.long 0xBF8CC67F
.long 0xD3EC0000, 0x04029B32
.long 0xD3EC0010, 0x04429B33
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04029D34
.long 0xD3EC0010, 0x04429D35
.long 0xBF8CC47F
.long 0xD3EC0000, 0x04029F36
.long 0xD3EC0010, 0x04429F37
.long 0xBF8CC07F
.long 0xD3EC0000, 0x0402A138
.long 0xD3EC0010, 0x0442A139
.long 0xBF8F0000
.long 0xD3EC0000, 0x0402A33A
.long 0xBF8A0000
.long 0xD86C0000, 0x2000005E
.long 0xD86C0840, 0x2100005E
.long 0xD3EC0010, 0x0442A33B
.long 0xD86C0008, 0x2200005E
.long 0xD86C0848, 0x2300005E
.long 0xD86C0010, 0x2400005E
.long 0xD86C0850, 0x2500005E
.long 0xD86C0018, 0x2600005E
.long 0xD3EC0000, 0x0402A53C
.long 0xD86C0858, 0x2700005E
.long 0xD86C0020, 0x2800005E
.long 0xD86C0860, 0x2900005E
.long 0xD86C0028, 0x2A00005E
.long 0xD3EC0010, 0x0442A53D
.long 0xD86C0868, 0x2B00005E
.long 0xD86C0030, 0x2C00005E
.long 0xD86C0870, 0x2D00005E
.long 0xD86C0038, 0x2E00005E
.long 0xD86C0878, 0x2F00005E
.long 0xD3EC0000, 0x0402A73E
.long 0xBF8A0000
.long 0xD86C0000, 0x44000060
.long 0xD86C0008, 0x45000060
.long 0xD3EC0010, 0x0442A73F
.long 0xD86C0018, 0x47000060
.long 0xD86C0020, 0x48000060
.long 0xD86C0028, 0x49000060
.long 0xD86C0010, 0x46000060
.long 0xBF8F0001
.long 0x802E812E
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04028920
.long 0xD86C0030, 0x4A000060
.long 0xD86C0038, 0x4B000060
.long 0xD3EC0010, 0x04428921
.long 0xBF8A0000
.long 0xBF8CC67F
.long 0xD3EC0000, 0x04028B22
.long 0xD3EC0010, 0x04428B23
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04028D24
.long 0xD3EC0010, 0x04428D25
.long 0xBF8CC47F
.long 0xD3EC0000, 0x04028F26
.long 0xD3EC0010, 0x04428F27
.long 0xBF8CC07F
.long 0xD3EC0000, 0x04029128
.long 0xD3EC0010, 0x04429129
.long 0xBF8F0000
.long 0xD3EC0000, 0x0402932A
.long 0xBF8A0000
.long 0xD86C0000, 0x3000005F
.long 0xD86C0840, 0x3100005F
.long 0xD3EC0010, 0x0442932B
.long 0xD86C0008, 0x3200005F
.long 0xD86C0848, 0x3300005F
.long 0xD86C0010, 0x3400005F
.long 0xD86C0850, 0x3500005F
.long 0xD3EC0000, 0x0402952C
.long 0xD86C0018, 0x3600005F
.long 0xD86C0858, 0x3700005F
.long 0xD86C0020, 0x3800005F
.long 0xD86C0860, 0x3900005F
.long 0xD86C0028, 0x3A00005F
.long 0xD3EC0010, 0x0442952D
.long 0xD86C0868, 0x3B00005F
.long 0xD86C0030, 0x3C00005F
.long 0xD86C0870, 0x3D00005F
.long 0xD86C0038, 0x3E00005F
.long 0xD86C0878, 0x3F00005F
.long 0xD3EC0000, 0x0402972E
.long 0xBF8A0000
.long 0xD86C0000, 0x4C000061
.long 0xD86C0008, 0x4D000061
.long 0xD3EC0010, 0x0442972F
.long 0xD86C0010, 0x4E000061
.long 0xD86C0018, 0x4F000061
.long 0xD86C0020, 0x50000061
.long 0xD86C0028, 0x51000061
.long 0xBF8F0001
.long 0x802E812E
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04029930
.long 0xD86C0030, 0x52000061
.long 0xD86C0038, 0x53000061
.long 0xD3EC0010, 0x04429931
.long 0xBF8A0000
.long 0xBF8CC67F
.long 0xD3EC0000, 0x04029B32
.long 0xD3EC0010, 0x04429B33
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04029D34
.long 0xD3EC0010, 0x04429D35
.long 0xBF8CC47F
.long 0xD3EC0000, 0x04029F36
.long 0xD3EC0010, 0x04429F37
.long 0xBF8CC07F
.long 0xD3EC0000, 0x0402A138
.long 0xD3EC0010, 0x0442A139
.long 0xBF8F0000
.long 0xD3EC0000, 0x0402A33A
.long 0xBF8A0000
.long 0xD86C0000, 0x2000005E
.long 0xD86C0840, 0x2100005E
.long 0xD3EC0010, 0x0442A33B
.long 0xD86C0008, 0x2200005E
.long 0xD86C0848, 0x2300005E
.long 0xD86C0010, 0x2400005E
.long 0xD86C0850, 0x2500005E
.long 0xD3EC0000, 0x0402A53C
.long 0xD86C0018, 0x2600005E
.long 0xD86C0858, 0x2700005E
.long 0xD86C0020, 0x2800005E
.long 0xD86C0860, 0x2900005E
.long 0xD86C0028, 0x2A00005E
.long 0xD3EC0010, 0x0442A53D
.long 0xD86C0868, 0x2B00005E
.long 0xD86C0030, 0x2C00005E
.long 0xD86C0870, 0x2D00005E
.long 0xD86C0038, 0x2E00005E
.long 0xD86C0878, 0x2F00005E
.long 0xD3EC0000, 0x0402A73E
.long 0xBF8A0000
.long 0xD86C0000, 0x44000060
.long 0xD86C0008, 0x45000060
.long 0xD3EC0010, 0x0442A73F
.long 0xD86C0010, 0x46000060
.long 0xD86C0018, 0x47000060
.long 0xD86C0020, 0x48000060
.long 0xD86C0028, 0x49000060
.long 0xBF8F0001
.long 0x802E812E
.long 0xBF00C22E
.long 0xBF84FF48
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04028920
.long 0xD86C0030, 0x4A000060
.long 0xD86C0038, 0x4B000060
.long 0xD3EC0010, 0x04428921
.long 0xBF8CC67F
.long 0xD3EC0000, 0x04028B22
.long 0xD3EC0010, 0x04428B23
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04028D24
.long 0xD3EC0010, 0x04428D25
.long 0xBF8CC47F
.long 0xD3EC0000, 0x04028F26
.long 0xD3EC0010, 0x04428F27
.long 0xBF8CC07F
.long 0xD3EC0000, 0x04029128
.long 0xD3EC0010, 0x04429129
.long 0xD3EC0000, 0x0402932A
.long 0xBF8A0000
.long 0xD86C0000, 0x3000005F
.long 0xD86C0840, 0x3100005F
.long 0xD3EC0010, 0x0442932B
.long 0xD86C0008, 0x3200005F
.long 0xD86C0848, 0x3300005F
.long 0xD86C0010, 0x3400005F
.long 0xD86C0850, 0x3500005F
.long 0xD3EC0000, 0x0402952C
.long 0xD86C0018, 0x3600005F
.long 0xD86C0858, 0x3700005F
.long 0xD86C0020, 0x3800005F
.long 0xD86C0860, 0x3900005F
.long 0xD86C0028, 0x3A00005F
.long 0xD3EC0010, 0x0442952D
.long 0xD86C0868, 0x3B00005F
.long 0xD86C0030, 0x3C00005F
.long 0xD86C0870, 0x3D00005F
.long 0xD86C0038, 0x3E00005F
.long 0xD86C0878, 0x3F00005F
.long 0xD3EC0000, 0x0402972E
.long 0xBF8A0000
.long 0xD86C0000, 0x4C000061
.long 0xD86C0008, 0x4D000061
.long 0xD3EC0010, 0x0442972F
.long 0xD86C0010, 0x4E000061
.long 0xD86C0018, 0x4F000061
.long 0xD86C0020, 0x50000061
.long 0xD86C0028, 0x51000061
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04029930
.long 0xD86C0030, 0x52000061
.long 0xD86C0038, 0x53000061
.long 0xD3EC0010, 0x04429931
.long 0xBF8CC67F
.long 0xD3EC0000, 0x04029B32
.long 0xD3EC0010, 0x04429B33
.long 0xBF8CC57F
.long 0xD3EC0000, 0x04029D34
.long 0xD3EC0010, 0x04429D35
.long 0xBF8CC47F
.long 0xD3EC0000, 0x04029F36
.long 0xD3EC0010, 0x04429F37
.long 0xBF8CC07F
.long 0xD3EC0000, 0x0402A138
.long 0xD3EC0000, 0x0402A33A
.long 0xD3EC0000, 0x0402A53C
.long 0xD3EC0000, 0x0402A73E
.long 0xBED400FF, 0xFFFF0000
.long 0x2AD6D56A
.long 0x28D6D654
.long 0xD3EC0010, 0x0442A139
.long 0xD3D84000, 0x18000100
.long 0xD3D84001, 0x18000101
.long 0xD3D84002, 0x18000102
.long 0xD3D84003, 0x18000103
.long 0xD3D84004, 0x18000104
.long 0xD3D84005, 0x18000105
.long 0xD3D84006, 0x18000106
.long 0xD3D84007, 0x18000107
.long 0x20000090
.long 0xD2010000, 0x0402D701
.long 0x20040490
.long 0xD2010001, 0x040AD703
.long 0x20080890
.long 0xD2010002, 0x0412D705
.long 0xD3EC0010, 0x0442A33B
.long 0xE0741000, 0x80050068
.long 0x200C0C90
.long 0xD2010003, 0x041AD707
.long 0xD3EC0010, 0x0442A53D
.long 0xE0741010, 0x80050268
.long 0xD3D84008, 0x18000108
.long 0xD3D84009, 0x18000109
.long 0xD3D8400A, 0x1800010A
.long 0xD3D8400B, 0x1800010B
.long 0xD3EC0010, 0x0442A73F
.long 0x20101090
.long 0xD2010004, 0x0422D709
.long 0x20141490
.long 0xD2010005, 0x042AD70B
.long 0xE0741020, 0x80050468
.long 0xD3D8400C, 0x1800010C
.long 0xD3D8400D, 0x1800010D
.long 0xD3D8400E, 0x1800010E
.long 0xD3D8400F, 0x1800010F
.long 0x20181890
.long 0xD2010006, 0x0432D70D
.long 0x201C1C90
.long 0xD2010007, 0x043AD70F
.long 0xE0741030, 0x80050668
.long 0xD3D84000, 0x18000110
.long 0xD3D84001, 0x18000111
.long 0xD3D84002, 0x18000112
.long 0xD3D84003, 0x18000113
.long 0xD3D84004, 0x18000114
.long 0xD3D84005, 0x18000115
.long 0xD3D84006, 0x18000116
.long 0xD3D84007, 0x18000117
.long 0x20000090
.long 0xD2010000, 0x0402D701
.long 0x20040490
.long 0xD2010001, 0x040AD703
.long 0x20080890
.long 0xD2010002, 0x0412D705
.long 0xE0741040, 0x80050068
.long 0x200C0C90
.long 0xD2010003, 0x041AD707
.long 0xD3D84008, 0x18000118
.long 0xD3D84009, 0x18000119
.long 0xD3D8400A, 0x1800011A
.long 0xD3D8400B, 0x1800011B
.long 0xE0741050, 0x80050268
.long 0x20101090
.long 0xD2010004, 0x0422D709
.long 0x20141490
.long 0xD2010005, 0x042AD70B
.long 0xD3D8400C, 0x1800011C
.long 0xD3D8400D, 0x1800011D
.long 0xD3D8400E, 0x1800011E
.long 0xD3D8400F, 0x1800011F
.long 0xE0741060, 0x80050468
.long 0x20181890
.long 0xD2010006, 0x0432D70D
.long 0x201C1C90
.long 0xD2010007, 0x043AD70F
.long 0xE0741070, 0x80050668
.long 0xBF8C0000
.long 0xBF810000
