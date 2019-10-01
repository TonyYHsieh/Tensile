/*******************************************************************************
* Copyright (C) 2016-2019 Advanced Micro Devices, Inc. All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell cop-
* ies of the Software, and to permit persons to whom the Software is furnished
* to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IM-
* PLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
* FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
* COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
* IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNE-
* CTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*******************************************************************************/

/**************************************************
* This file was generated by Tensile:             *
* https://github.com/ROCmSoftwarePlatform/Tensile *
**************************************************/


#include "Kernels.h"


  /******************************************/
  /* Function Prefix                        */
  /******************************************/


typedef float float16 __attribute__((ext_vector_type(16)));
extern "C" __device__ float16 __llvm_amdgcn_mfma_f32_32x32x2f32(float, float, float16, int, int, int) __asm("llvm.amdgcn.mfma.f32.32x32x2f32");


/* tile parameters */
#define NUM_THREADS 256
#define SG0I 8
#define SG1J 8
#define TT0I 4
#define TT1J 4
#define MT0I (SG0I*TT0I)
#define MT1J (SG1J*TT1J)
#define VECTOR_WIDTH 1
#define GLOBAL_LOAD_VECTOR_WIDTH_A 1
#define GLOBAL_LOAD_VECTOR_WIDTH_B 1
#define GLOBAL_WRITE_VECTOR_WIDTH 1

/* MFMA parameters */
#define MFMA_M_N 32
#define MFMA_K 2
#define MFMA_OUTPUT_VECTOR_WIDTH 4
#define MFMA_OUTPUT_STRIDE 8
#define WAVE_SIZE 64
#define WAVE0I (MT0I/MFMA_M_N)
#define WAVE1J (MT1J/MFMA_M_N)
#define MFMA_DATA_TYPE float
#define MFMA_DEST_DATA_TYPE float16

/* DepthU parameters*/
#define CPSV (NUM_THREADS / MT0I * VECTOR_WIDTH)
#define LOCAL_SPLITU 4
#define UNROLL 4
#define LOCAL_DEPTHU (LOCAL_SPLITU*UNROLL)

/* other */
#define PAD 0
#define WORK_GROUP_MAPPING 0

/* num loads parallel and perpendicular to coalesced */
#define NLCA 1
#define NLCB 1
#define NLPA 2
#define NLPB 2

/* load sizes parallel and perpendicular to coalesced */
#define LSCA (MT0I/NLCA)
#define LSPA (LOCAL_DEPTHU/NLPA)
#define LSCB (LOCAL_DEPTHU/NLCB)
#define LSPB (MT1J/NLPB)
#define LVCA (LSCA/GLOBAL_LOAD_VECTOR_WIDTH_A)
#define LVCB (LSCB/GLOBAL_LOAD_VECTOR_WIDTH_B)
#define LVPA (LSPA/GLOBAL_LOAD_VECTOR_WIDTH_A)
#define LVPB (LSPB/GLOBAL_LOAD_VECTOR_WIDTH_B)
#define LDS_OFFSET_B 512
#define LDS_NUM_ELEMENTS 4096

/* global memory indices */
#define GLOBAL_D(IDX0I, IDX1J, IDXK) (( (IDX0I)*strideD0I + (IDX1J)*strideD1J + (IDXK)*strideDK ))
#define GLOBAL_C(IDX0I, IDX1J, IDXK) (( (IDX0I)*strideC0I + (IDX1J)*strideC1J + (IDXK)*strideCK ))
#define GLOBAL_OFFSET_A(IDX0I, IDXL, IDXK) (( (IDX0I)*strideA0I + (IDXL)*strideAL + (IDXK)*strideAK ))
#define GLOBAL_OFFSET_B(IDXL, IDX1J, IDXK) (( (IDXL)*strideBL + (IDX1J)*strideB1J + (IDXK)*strideBK ))

/* data types */
#define DATA_TYPE float
#define DEST_DATA_TYPE float
#define COMPUTE_DATA_TYPE float
#define MAGIC_DIV(dividend, magicNumber, magicShift) ((uint64_t)(dividend) * magicNumber >> magicShift)

/* MAC's */
#define MAC(A,B,DST) DST += A*B
#define TYPE_MAC(MULA,MULB,DST) DST = MAC(MULA,MULB,DST);
#define TYPE_MAC_WRITE(DST,SRC,ALPHA,REG,BETA) DST = 0 != (BETA) ? (ALPHA)*(REG) + (BETA)*(SRC) : (ALPHA)*(REG);

/* 4x4 micro-tile */
#define MAC_4x4\
  TYPE_MAC(rA[0],rB[0],rC[0+0*TT0I]); \
  TYPE_MAC(rA[1],rB[0],rC[1+0*TT0I]); \
  TYPE_MAC(rA[2],rB[0],rC[2+0*TT0I]); \
  TYPE_MAC(rA[3],rB[0],rC[3+0*TT0I]); \
  TYPE_MAC(rA[0],rB[1],rC[0+1*TT0I]); \
  TYPE_MAC(rA[1],rB[1],rC[1+1*TT0I]); \
  TYPE_MAC(rA[2],rB[1],rC[2+1*TT0I]); \
  TYPE_MAC(rA[3],rB[1],rC[3+1*TT0I]); \
  TYPE_MAC(rA[0],rB[2],rC[0+2*TT0I]); \
  TYPE_MAC(rA[1],rB[2],rC[1+2*TT0I]); \
  TYPE_MAC(rA[2],rB[2],rC[2+2*TT0I]); \
  TYPE_MAC(rA[3],rB[2],rC[3+2*TT0I]); \
  TYPE_MAC(rA[0],rB[3],rC[0+3*TT0I]); \
  TYPE_MAC(rA[1],rB[3],rC[1+3*TT0I]); \
  TYPE_MAC(rA[2],rB[3],rC[2+3*TT0I]); \
  TYPE_MAC(rA[3],rB[3],rC[3+3*TT0I]); \

/* hard-coded initial strides */
#define strideD0I 1
#define strideC0I 1
#define strideA0I 1
#define strideBL 1


  /******************************************/
  /* Begin Kernel                           */
  /******************************************/

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"
extern "C"
__global__ void Cijk_Ailk_Bljk_SB_MT32x32x16_SE_K1(
  float *D,
  float const * __restrict__ C,
  float const * __restrict__ A,
  float const * __restrict__ B,
  float const alpha,
  float const beta,
  unsigned int const strideD1J,
  unsigned int const strideDK,
  unsigned int const strideC1J,
  unsigned int const strideCK,
  unsigned int const strideAL,
  unsigned int const strideAK,
  unsigned int const strideB1J,
  unsigned int const strideBK,
  unsigned int const size0I,
  unsigned int const size1J,
  unsigned int const sizeK,
  unsigned int const sizeL,
  unsigned int staggerUIterParm,
  unsigned int problemNumGroupTiles0,
  unsigned int problemNumGroupTiles1,
  unsigned int magicNumberProblemNumGroupTiles0 )
#pragma clang diagnostic pop

 {


  /******************************************/
  /* Allocate Resources                     */
  /******************************************/

  unsigned int serial = hc_get_workitem_id(0);
  unsigned int sgId = serial / (SG0I*SG1J);

  unsigned int waveId  = (serial % (SG0I * SG1J)) / WAVE_SIZE;
  unsigned int waveIdx = waveId % WAVE0I;
  unsigned int waveIdy = (waveId / WAVE0I) % WAVE1J;

#define SCALAR_ZERO (float)(0)
#define SCALAR_OOB_DATA SCALAR_ZERO
  /* registers for MAC's */
  DEST_DATA_TYPE rC[TT0I*TT1J];
  MFMA_DEST_DATA_TYPE* pRC = (MFMA_DEST_DATA_TYPE*)rC;
  DATA_TYPE rA[1];
  DATA_TYPE rB[1];

  /* registers for global->local */
  DATA_TYPE a_0_0_0_0;
  DATA_TYPE a_0_0_1_0;
  DATA_TYPE b_0_0_0_0;
  DATA_TYPE b_0_0_1_0;

  /* allocate local memory */
  __shared__ DATA_TYPE localMemory[LDS_NUM_ELEMENTS];


  /******************************************/
  /* Local Read Addresses                   */
  /******************************************/


  /* local read addresses: tile assignments a */

  unsigned int lr0I = (serial % MFMA_M_N);


  /* local read addresses: tile assignments b */

  unsigned int lr1J = (serial % MFMA_M_N);


  /* local read addresses: tile assignments l */

  unsigned int lrL = (serial / MFMA_M_N) % MFMA_K;


  /* local read addresses: final offsets a */

  unsigned int localReadOffsetA = lr0I + lrL * (MT0I+PAD) + waveIdx * MFMA_M_N + sgId * MFMA_K * (MT0I+PAD);


  /* local read addresses: final offsets b */

  unsigned int localReadOffsetB = lr1J + lrL * (MT1J+PAD) + waveIdy * MFMA_M_N + sgId * MFMA_K * (MT1J+PAD) + LDS_OFFSET_B;


  /* local read addresses: declare addresses a */

  DATA_TYPE *localReadA;


  /* local read addresses: declare addresses b */

  DATA_TYPE *localReadB;



  /******************************************/
  /* Begin setupNewTile                     */
  /******************************************/


  /* global read addresses: work-group */

  unsigned int wg0I = hc_get_group_id(0);
  unsigned int wg1J = hc_get_group_id(1);
  unsigned int nwg0I = hc_get_num_groups(0);
  unsigned int nwg1J = hc_get_num_groups(1);


  /* global read addresses: tile offset assignment a */

  unsigned int globalReadOffsetA0I = (serial%LVCA)*GLOBAL_LOAD_VECTOR_WIDTH_A + (wg0I)*MT0I;


  /* global read addresses: tile offset assignment b */

  unsigned int globalReadOffsetB1J = (serial/LVCB) + (wg1J)*MT1J;


  /* global read addresses: unroll assignment a */

  unsigned int globalReadOffsetAL = (serial/LVCA);


  /* global read addresses: unroll assignment b */

  unsigned int globalReadOffsetBL = (serial%LVCB)*GLOBAL_LOAD_VECTOR_WIDTH_B;


  /* global read addresses: other free assignments */

  unsigned int wgK = ( hc_get_group_id(2) ) % sizeK;


  /* global read addresses: tile offsets a */

  unsigned int flattenedOffsetA_0_0 = globalReadOffsetA0I + 0 + 0*LSCA;
  flattenedOffsetA_0_0 = (flattenedOffsetA_0_0 > (size0I-1)) ? (size0I-1):flattenedOffsetA_0_0;
  unsigned int globalReadOffsetA0I_0_0 = flattenedOffsetA_0_0;


  /* global read addresses: tile offsets b */

  unsigned int flattenedOffsetB_0_0 = globalReadOffsetB1J + 0 + 0*LSPB;
  flattenedOffsetB_0_0 = (flattenedOffsetB_0_0 > (size1J-1)) ? (size1J-1):flattenedOffsetB_0_0;
  unsigned int globalReadOffsetB1J_0_0 = flattenedOffsetB_0_0;
  unsigned int flattenedOffsetB_1_0 = globalReadOffsetB1J + 0 + 1*LSPB;
  flattenedOffsetB_1_0 = (flattenedOffsetB_1_0 > (size1J-1)) ? (size1J-1):flattenedOffsetB_1_0;
  unsigned int globalReadOffsetB1J_1_0 = flattenedOffsetB_1_0;


  /* global read addresses: unroll offsets a */

  unsigned int globalReadOffsetAL_0_0 = globalReadOffsetAL + 0 + 0*LSPA;
  unsigned int globalReadOffsetAL_1_0 = globalReadOffsetAL + 0 + 1*LSPA;


  /* global read addresses: unroll offsets b */

  unsigned int globalReadOffsetBL_0_0 = globalReadOffsetBL + 0 + 0*LSCB;


  /* global read addresses: shift a */

  globalReadOffsetA0I_0_0 = (  globalReadOffsetA0I_0_0 > size0I-GLOBAL_LOAD_VECTOR_WIDTH_A+0) ? size0I-GLOBAL_LOAD_VECTOR_WIDTH_A+0 : globalReadOffsetA0I_0_0;


  /* global read addresses: shift b */

  globalReadOffsetB1J_0_0 = (  globalReadOffsetB1J_0_0 > size1J-1) ? size1J-1 : globalReadOffsetB1J_0_0;
  globalReadOffsetB1J_1_0 = (  globalReadOffsetB1J_1_0 > size1J-1) ? size1J-1 : globalReadOffsetB1J_1_0;


  /* global read addresses: final offsets a */

  uint64_t globalReadOffsetA_0_0_0_0 = GLOBAL_OFFSET_A( globalReadOffsetA0I_0_0, globalReadOffsetAL_0_0, wgK );
  uint64_t globalReadOffsetA_0_0_1_0 = GLOBAL_OFFSET_A( globalReadOffsetA0I_0_0, globalReadOffsetAL_1_0, wgK );


  /* global read addresses: final offsets b */

  uint64_t globalReadOffsetB_0_0_0_0 = GLOBAL_OFFSET_B( globalReadOffsetBL_0_0, globalReadOffsetB1J_0_0, wgK );
  uint64_t globalReadOffsetB_0_0_1_0 = GLOBAL_OFFSET_B( globalReadOffsetBL_0_0, globalReadOffsetB1J_1_0, wgK );


  /* global read addresses: addresses a */

  DATA_TYPE const *globalReadA_0_0_0_0 = A + globalReadOffsetA_0_0_0_0;
  DATA_TYPE const *globalReadA_0_0_1_0 = A + globalReadOffsetA_0_0_1_0;


  /* global read addresses: addresses b */

  DATA_TYPE const *globalReadB_0_0_0_0 = B + globalReadOffsetB_0_0_0_0;
  DATA_TYPE const *globalReadB_0_0_1_0 = B + globalReadOffsetB_0_0_1_0;


  /* global read addresses: increments a */

  int64_t globalReadIncAL = (int64_t)strideAL*LOCAL_DEPTHU;


  /* global read addresses: increments b */

  int64_t globalReadIncBL = (int64_t)strideBL*LOCAL_DEPTHU;


  /******************************************/
  /* Local Write Addresses                  */
  /******************************************/


  /* local write addresses: tile assignment A */
  unsigned int lwA0I = (serial%LVCA)*GLOBAL_LOAD_VECTOR_WIDTH_A;


  /* local write addresses: tile assignment B */
  unsigned int lwB1J = (serial/LVCB);


  /* local write addresses: unroll assignment A */
  unsigned int lwAL = (serial/LVCA);


  /* local write addresses: unroll assignment B */
  unsigned int lwBL = (serial%LVCB)*GLOBAL_LOAD_VECTOR_WIDTH_B;


  /* local write addresses: first offset a */

  unsigned int localWriteFirstOffsetA = lwA0I + lwAL*(MT0I+PAD);


  /* local write addresses: first offset b */

  unsigned int localWriteFirstOffsetB = lwB1J + lwBL*(MT1J+PAD) + LDS_OFFSET_B;


  /* local write addresses: final offsets A */
  unsigned int localWriteOffsetA_0_0_0_0 = localWriteFirstOffsetA + (0 + 0*LSCA) + (0 + 0*LSPA)*(MT0I+PAD);
  unsigned int localWriteOffsetA_0_0_1_0 = localWriteFirstOffsetA + (0 + 0*LSCA) + (0 + 1*LSPA)*(MT0I+PAD);


  /* local write addresses: final offsets B */
  unsigned int localWriteOffsetB_0_0_0_0 = localWriteFirstOffsetB + (0 + 0*LSCB)*(MT1J+PAD) + (0 + 0*LSPB);
  unsigned int localWriteOffsetB_0_0_1_0 = localWriteFirstOffsetB + (0 + 0*LSCB)*(MT1J+PAD) + (0 + 1*LSPB);


  /* local write addresses: declare addresses A */
  DATA_TYPE *localWriteA_0_0_0_0;
  DATA_TYPE *localWriteA_0_0_1_0;


  /* local write addresses: declare addresses B */
  DATA_TYPE *localWriteB_0_0_0_0;
  DATA_TYPE *localWriteB_0_0_1_0;


  /* local write init pointers A */
  localWriteA_0_0_0_0 = (DATA_TYPE *)(localMemory + localWriteOffsetA_0_0_0_0);
  localWriteA_0_0_1_0 = (DATA_TYPE *)(localMemory + localWriteOffsetA_0_0_1_0);


  /* local write init pointers B */
  localWriteB_0_0_0_0 = (DATA_TYPE *)(localMemory + localWriteOffsetB_0_0_0_0);
  localWriteB_0_0_1_0 = (DATA_TYPE *)(localMemory + localWriteOffsetB_0_0_1_0);

  /* declare loop num iterations */

  unsigned int numIterL;
  int numIterL2;


  rC[0] = SCALAR_ZERO;
  rC[1] = SCALAR_ZERO;
  rC[2] = SCALAR_ZERO;
  rC[3] = SCALAR_ZERO;
  rC[4] = SCALAR_ZERO;
  rC[5] = SCALAR_ZERO;
  rC[6] = SCALAR_ZERO;
  rC[7] = SCALAR_ZERO;
  rC[8] = SCALAR_ZERO;
  rC[9] = SCALAR_ZERO;
  rC[10] = SCALAR_ZERO;
  rC[11] = SCALAR_ZERO;
  rC[12] = SCALAR_ZERO;
  rC[13] = SCALAR_ZERO;
  rC[14] = SCALAR_ZERO;
  rC[15] = SCALAR_ZERO;


  /* Compute unroll loop num iter */
  numIterL = sizeL / LOCAL_DEPTHU;

  const unsigned origNumIter = numIterL;
  unsigned staggerUIter = (wg0I & staggerUIterParm);
  staggerUIter = (staggerUIter << 2); // shift so each stagger has 256-byte stride

  globalReadA_0_0_0_0 += (staggerUIter * globalReadIncAL); // apply stagger offset
  globalReadA_0_0_1_0 += (staggerUIter * globalReadIncAL); // apply stagger offset


  globalReadB_0_0_0_0 += (staggerUIter * globalReadIncBL); // apply stagger offset
  globalReadB_0_0_1_0 += (staggerUIter * globalReadIncBL); // apply stagger offset

  staggerUIter += 0; // add PrefetchGlobalRead

  /* local read addresses: init pointers a */

  localReadA = (DATA_TYPE *)(localMemory + localReadOffsetA);

  /* local read addresses: init pointers b */

  localReadB = (DATA_TYPE *)(localMemory + localReadOffsetB);


  /******************************************/
  /* End setupNewTile                       */
  /******************************************/


  /******************************************/
  /* Unrolled Loop(s) - Begin               */
  /******************************************/

  while (numIterL-- > 0) {


    /******************************************/
    /* Unroll Loop 1/1 - Begin                */
    /******************************************/



    /* global read A */
    a_0_0_0_0 = *(globalReadA_0_0_0_0 + 0);
    a_0_0_1_0 = *(globalReadA_0_0_1_0 + 0);

    /* global read B */
    b_0_0_0_0 = *(globalReadB_0_0_0_0 + 0);
    b_0_0_1_0 = *(globalReadB_0_0_1_0 + 0);

    /* global read inc A */
    globalReadA_0_0_0_0 = (DATA_TYPE const *)( ((DATA_TYPE const *)globalReadA_0_0_0_0) + globalReadIncAL);
    if ((numIterL) == staggerUIter) {
      globalReadA_0_0_0_0 -= (origNumIter * globalReadIncAL); // wrap staggered offset back to row start
    }
    globalReadA_0_0_1_0 = (DATA_TYPE const *)( ((DATA_TYPE const *)globalReadA_0_0_1_0) + globalReadIncAL);
    if ((numIterL) == staggerUIter) {
      globalReadA_0_0_1_0 -= (origNumIter * globalReadIncAL); // wrap staggered offset back to row start
    }

    /* global read inc B */
    globalReadB_0_0_0_0 = (DATA_TYPE const *)( ((DATA_TYPE const *)globalReadB_0_0_0_0) + globalReadIncBL);
    if ((numIterL) == staggerUIter) {
      globalReadB_0_0_0_0 -= (origNumIter * globalReadIncBL); // wrap staggered offset back to row start
    }
    globalReadB_0_0_1_0 = (DATA_TYPE const *)( ((DATA_TYPE const *)globalReadB_0_0_1_0) + globalReadIncBL);
    if ((numIterL) == staggerUIter) {
      globalReadB_0_0_1_0 -= (origNumIter * globalReadIncBL); // wrap staggered offset back to row start
    }


    __syncthreads(); //PGR=0, prior iter done reading lds


    /* local write a */

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconditional-uninitialized"
    *(localWriteA_0_0_0_0 + 0) = a_0_0_0_0;
    *(localWriteA_0_0_1_0 + 0) = a_0_0_1_0;
#pragma clang diagnostic pop


    /* local write b */

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconditional-uninitialized"
    *(localWriteB_0_0_0_0 + 0) = b_0_0_0_0;
    *(localWriteB_0_0_1_0 + 0) = b_0_0_1_0;
#pragma clang diagnostic pop


    __syncthreads(); //




    /* iter 0 */


    /* local read a */
    rA[0] = localReadA[0];

    /* local read b */
    rB[0] = localReadB[0];

    /* local read increment a */
    localReadA += LOCAL_SPLITU*MFMA_K*(MT0I+PAD);

    /* local read increment b */
    localReadB += LOCAL_SPLITU*MFMA_K*(MT1J+PAD);
    pRC[0] = __llvm_amdgcn_mfma_f32_32x32x2f32(rA[0], rB[0], pRC[0], 0, 0, 0);




    /* iter 1 (last) */


    /* local read a */
    rA[0] = localReadA[0];

    /* local read b */
    rB[0] = localReadB[0];

    /* local read init pointers a */
    localReadA = (DATA_TYPE *)(localMemory + localReadOffsetA);

    /* local read init pointers b */
    localReadB = (DATA_TYPE *)(localMemory + localReadOffsetB);
    pRC[0] = __llvm_amdgcn_mfma_f32_32x32x2f32(rA[0], rB[0], pRC[0], 0, 0, 0);


    /******************************************/
    /* Unrolled Loop - End                    */
    /******************************************/

  }


  /******************************************/
  /* Tail Loop                              */
  /******************************************/


  /* Compute tail loop num iter */
  numIterL  = ((sizeL % (LOCAL_DEPTHU )) + (LOCAL_SPLITU - sgId - 1) * MFMA_K) / (LOCAL_SPLITU * MFMA_K);
  numIterL2 = (sizeL % LOCAL_DEPTHU) - numIterL * LOCAL_SPLITU * MFMA_K - sgId * MFMA_K;


  /* remove stagger offsets for tail loop */

  globalReadA_0_0_0_0 += ((origNumIter - (staggerUIter - 0)) * globalReadIncAL); // remove stagger offset
  globalReadA_0_0_1_0 += ((origNumIter - (staggerUIter - 0)) * globalReadIncAL); // remove stagger offset

  globalReadB_0_0_0_0 += ((origNumIter - (staggerUIter - 0)) * globalReadIncBL); // remove stagger offset
  globalReadB_0_0_1_0 += ((origNumIter - (staggerUIter - 0)) * globalReadIncBL); // remove stagger offset


  /* global read a */


  /* global read A */
  a_0_0_0_0 = ( globalReadOffsetAL_0_0 + 0 >= (sizeL % LOCAL_DEPTHU) ) ? SCALAR_OOB_DATA : *(globalReadA_0_0_0_0 + 0);
  a_0_0_1_0 = ( globalReadOffsetAL_1_0 + 0 >= (sizeL % LOCAL_DEPTHU) ) ? SCALAR_OOB_DATA : *(globalReadA_0_0_1_0 + 0);


  /* global read b */


  /* global read B */
  b_0_0_0_0 = ( globalReadOffsetBL_0_0 + 0 >= (sizeL % LOCAL_DEPTHU) ) ? SCALAR_OOB_DATA : *(globalReadB_0_0_0_0 + 0);
  b_0_0_1_0 = ( globalReadOffsetBL_0_0 + 0 >= (sizeL % LOCAL_DEPTHU) ) ? SCALAR_OOB_DATA : *(globalReadB_0_0_1_0 + 0);


  __syncthreads(); //


  /* local write init pointers A */
  localWriteA_0_0_0_0 = (DATA_TYPE *)(localMemory + localWriteOffsetA_0_0_0_0);
  localWriteA_0_0_1_0 = (DATA_TYPE *)(localMemory + localWriteOffsetA_0_0_1_0);


  /* local write init pointers B */
  localWriteB_0_0_0_0 = (DATA_TYPE *)(localMemory + localWriteOffsetB_0_0_0_0);
  localWriteB_0_0_1_0 = (DATA_TYPE *)(localMemory + localWriteOffsetB_0_0_1_0);


  /* local write a */

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconditional-uninitialized"
  *(localWriteA_0_0_0_0 + 0) = a_0_0_0_0;
  *(localWriteA_0_0_1_0 + 0) = a_0_0_1_0;
#pragma clang diagnostic pop


  /* local write b */

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconditional-uninitialized"
  *(localWriteB_0_0_0_0 + 0) = b_0_0_0_0;
  *(localWriteB_0_0_1_0 + 0) = b_0_0_1_0;
#pragma clang diagnostic pop


  __syncthreads(); //


  /* tail loop: macs */

  while (numIterL-- > 0) {


    /* local read a */

    rA[0] = localReadA[0];


    /* local read b */

    rB[0] = localReadB[0];


    /* local read inc a */

    localReadA += LOCAL_SPLITU*MFMA_K*(MT0I+PAD);


    /* local read inc b */

    localReadB += LOCAL_SPLITU*MFMA_K*(MT1J+PAD);


    pRC[0] = __llvm_amdgcn_mfma_f32_32x32x2f32(rA[0], rB[0], pRC[0], 0, 0, 0);

  }


  /* tail loop: macs */

  while (numIterL2-- > 0) {


    /* local read a */

    rA[0] = (lrL==0) ? localReadA[0] : 0;


    /* local read b */

    rB[0] = (lrL==0) ? localReadB[0] : 0;


    /* local read inc a */

    localReadA += LOCAL_SPLITU*MFMA_K*(MT0I+PAD);


    /* local read inc b */

    localReadB += LOCAL_SPLITU*MFMA_K*(MT1J+PAD);


    pRC[0] = __llvm_amdgcn_mfma_f32_32x32x2f32(rA[0], rB[0], pRC[0], 0, 0, 0);

  }





  /******************************************/
  /* LocalSplitU Reduction                  */
  /******************************************/

  __syncthreads(); //


  /* LocalSplitU: local write */

  DATA_TYPE *localLocalSplitU = (DATA_TYPE *)(localMemory);
  localLocalSplitU[(0 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 0 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[0];
  localLocalSplitU[(1 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 0 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[1];
  localLocalSplitU[(2 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 0 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[2];
  localLocalSplitU[(3 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 0 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[3];
  localLocalSplitU[(0 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 1 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[4];
  localLocalSplitU[(1 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 1 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[5];
  localLocalSplitU[(2 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 1 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[6];
  localLocalSplitU[(3 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 1 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[7];
  localLocalSplitU[(0 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 2 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[8];
  localLocalSplitU[(1 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 2 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[9];
  localLocalSplitU[(2 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 2 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[10];
  localLocalSplitU[(3 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 2 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[11];
  localLocalSplitU[(0 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 3 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[12];
  localLocalSplitU[(1 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 3 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[13];
  localLocalSplitU[(2 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 3 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[14];
  localLocalSplitU[(3 + lrL * MFMA_OUTPUT_VECTOR_WIDTH + 3 * MFMA_OUTPUT_STRIDE) + (lr0I + waveIdy * MFMA_M_N) * MT0I + (sgId * (MT0I*MT1J))] = rC[15];
  __syncthreads();


  /* LocalSplitU: local read */

  rC[0 +   0*GLOBAL_WRITE_VECTOR_WIDTH] = localLocalSplitU[0 + (serial+0*NUM_THREADS)*GLOBAL_WRITE_VECTOR_WIDTH];
  rC[0 +   1*GLOBAL_WRITE_VECTOR_WIDTH] = localLocalSplitU[0 + (serial+1*NUM_THREADS)*GLOBAL_WRITE_VECTOR_WIDTH];
  rC[0 +   2*GLOBAL_WRITE_VECTOR_WIDTH] = localLocalSplitU[0 + (serial+2*NUM_THREADS)*GLOBAL_WRITE_VECTOR_WIDTH];
  rC[0 +   3*GLOBAL_WRITE_VECTOR_WIDTH] = localLocalSplitU[0 + (serial+3*NUM_THREADS)*GLOBAL_WRITE_VECTOR_WIDTH];



  /* LocalSplitU: reduction */

  rC[0 +   0*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+0*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 1*MT0I*MT1J)];
  rC[0 +   1*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+1*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 1*MT0I*MT1J)];
  rC[0 +   2*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+2*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 1*MT0I*MT1J)];
  rC[0 +   3*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+3*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 1*MT0I*MT1J)];

  rC[0 +   0*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+0*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 2*MT0I*MT1J)];
  rC[0 +   1*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+1*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 2*MT0I*MT1J)];
  rC[0 +   2*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+2*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 2*MT0I*MT1J)];
  rC[0 +   3*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+3*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 2*MT0I*MT1J)];

  rC[0 +   0*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+0*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 3*MT0I*MT1J)];
  rC[0 +   1*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+1*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 3*MT0I*MT1J)];
  rC[0 +   2*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+2*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 3*MT0I*MT1J)];
  rC[0 +   3*GLOBAL_WRITE_VECTOR_WIDTH] += localLocalSplitU[(0 + serial*GLOBAL_WRITE_VECTOR_WIDTH+3*NUM_THREADS*GLOBAL_WRITE_VECTOR_WIDTH + 3*MT0I*MT1J)];



  /* LocalSplitU: global write indices */

  unsigned int localC0I = (serial % (MT0I/GLOBAL_WRITE_VECTOR_WIDTH))*GLOBAL_WRITE_VECTOR_WIDTH;
  unsigned int globalC0I = (wg0I)*MT0I + localC0I;
  unsigned int flattenedGlobalC0 = globalC0I;
  unsigned int localC1J = serial / (MT0I/GLOBAL_WRITE_VECTOR_WIDTH);
  unsigned int globalC1J = (wg1J)*MT1J + localC1J;
  unsigned int flattenedGlobalC1 = globalC1J;
  unsigned int globalCK = (wgK);


  /* LocalSplitU: global write */


  /* new 0 offset - inc and extract tensor dims */
  globalC0I =   flattenedGlobalC0 + 0;
  /* new 1 offset - inc and extract tensor dims */
  globalC1J =   flattenedGlobalC1 +  0*CPSV;
  if (flattenedGlobalC0 < size0I) {  if (flattenedGlobalC1 + 0*CPSV < size1J) {  TYPE_MAC_WRITE( D[ GLOBAL_D( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], C[ GLOBAL_C( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], alpha, rC[0 + 0*GLOBAL_WRITE_VECTOR_WIDTH], beta)} }

  /* new 0 offset - inc and extract tensor dims */
  globalC0I =   flattenedGlobalC0 + 0;
  /* new 1 offset - inc and extract tensor dims */
  globalC1J =   flattenedGlobalC1 +  1*CPSV;
  if (flattenedGlobalC0 < size0I) {  if (flattenedGlobalC1 + 1*CPSV < size1J) {  TYPE_MAC_WRITE( D[ GLOBAL_D( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], C[ GLOBAL_C( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], alpha, rC[0 + 1*GLOBAL_WRITE_VECTOR_WIDTH], beta)} }

  /* new 0 offset - inc and extract tensor dims */
  globalC0I =   flattenedGlobalC0 + 0;
  /* new 1 offset - inc and extract tensor dims */
  globalC1J =   flattenedGlobalC1 +  2*CPSV;
  if (flattenedGlobalC0 < size0I) {  if (flattenedGlobalC1 + 2*CPSV < size1J) {  TYPE_MAC_WRITE( D[ GLOBAL_D( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], C[ GLOBAL_C( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], alpha, rC[0 + 2*GLOBAL_WRITE_VECTOR_WIDTH], beta)} }

  /* new 0 offset - inc and extract tensor dims */
  globalC0I =   flattenedGlobalC0 + 0;
  /* new 1 offset - inc and extract tensor dims */
  globalC1J =   flattenedGlobalC1 +  3*CPSV;
  if (flattenedGlobalC0 < size0I) {  if (flattenedGlobalC1 + 3*CPSV < size1J) {  TYPE_MAC_WRITE( D[ GLOBAL_D( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], C[ GLOBAL_C( (uint64_t) globalC0I, (uint64_t) globalC1J + 0, (uint64_t) globalCK) ], alpha, rC[0 + 3*GLOBAL_WRITE_VECTOR_WIDTH], beta)} }


}

#undef UNROLL
#undef LOCAL_SPLITU
#undef LOCAL_DEPTHU
#undef SG0I
#undef SG1J
#undef TT0I
#undef TT1J
#undef MT0I
#undef MT1J
#undef NLCA
#undef NLCB
#undef NLPA
#undef NLPB
#undef LSCA
#undef LSPA
#undef LSCB
#undef LSPB
#undef GLOBAL_C
#undef GLOBAL_OFFSET_A
#undef GLOBAL_OFFSET_B
#undef DATA_TYPE
#undef DEST_DATA_TYPE
#undef COMPUTE_DATA_TYPE
#undef LDS_OFFSET_B
#undef LDS_OFFSET_BLK
#undef LDS_NUM_ELEMENTS
#undef NUM_THREADS
#undef WORK_GROUP_MAPPING
#undef VECTOR_WIDTH
#undef GLOBAL_LOAD_VECTOR_WIDTH_A
#undef GLOBAL_LOAD_VECTOR_WIDTH_B
#undef GLOBAL_WRITE_VECTOR_WIDTH
#undef MAC
#undef TYPE_MAC
#undef TYPE_MAC_WRITE
#undef GLOBAL_SPLITU
#undef SCALAR_ZERO
#undef SCALAR_OOB_DATA
#undef MAC_4x4
#undef strideD0I
#undef strideC0I
#undef strideA0I
#undef strideBL




