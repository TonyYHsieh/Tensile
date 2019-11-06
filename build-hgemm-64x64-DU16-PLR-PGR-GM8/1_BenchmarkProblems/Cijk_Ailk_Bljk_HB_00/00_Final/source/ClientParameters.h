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


#include "Solutions.h"

typedef enum {
    enum_float,
    enum_double,
    enum_TensileComplexFloat,
    enum_TensileComplexDouble
#ifdef Tensile_ENABLE_HALF
    ,enum_TensileHalf
#endif
    ,enum_TensileInt8x4
    ,enum_TensileInt32
    ,enum_tensile_bfloat16
} DataTypeEnum;

// Debug Params
const unsigned printTensorA=0;
const unsigned printTensorB=0;
const unsigned printTensorC=0;
const unsigned printTensorD=0;
const bool printWinnersOnly=false;

const char indexChars[19] = "IJKLMNOPQRSTUVWXYZ";
unsigned int functionIdx;
unsigned int dataTypeIdx;
unsigned int problemTypeIdx;

/* data types */
const unsigned int numDataTypes = 1;
const DataTypeEnum dataTypeEnums[numDataTypes] = { enum_TensileHalf };
const unsigned int bytesPerElement[numDataTypes] = { 2 };
const unsigned int numFlopsPerMac[numDataTypes] = { 2 };
#define Tensile_DATA_TYPE_TENSILEHALF
/* problem types */
const unsigned int numProblemTypes = 1;
const unsigned int numIndicesC[numProblemTypes] = { 3 };
const unsigned int numIndicesA[numProblemTypes] = { 3 };
const unsigned int maxNumIndicesA = 3;
const unsigned int numIndicesB[numProblemTypes] = { 3 };
const unsigned int maxNumIndicesB = 3;
const unsigned int indexAssignmentsA[numProblemTypes][maxNumIndicesA] = {
  { 0, 3, 2 }
};
const unsigned int indexAssignmentsB[numProblemTypes][maxNumIndicesB] = {
  { 3, 1, 2 }
};
const unsigned int numIndicesLD = 4;
const unsigned int indexAssignmentsLD[numIndicesLD] = { 4, 5, 6, 7};
bool useBeta[numProblemTypes] = { true };
const bool complexConjugateA[numProblemTypes] = { false };
const bool complexConjugateB[numProblemTypes] = { false };

const unsigned int maxNumIndices = 4;
const unsigned int totalIndices[numProblemTypes] = { 4 };
const unsigned int numProblems = 1;
const unsigned int problemSizes[numProblems][8] = {
  {   64,   64,    1,   16,   64,   64,   64,   16 }};
const unsigned int minStrides[4] = {0, 0, 0, 0};
/* problem sizes */
size_t maxSizeD = 5308416;
size_t maxSizeC = 5308416;
size_t maxSizeA = 37306368;
size_t maxSizeB = 37306368;

/* current problem size */

/* solutions */
const unsigned int maxNumSolutions = 1;
float solutionPerf[numProblems][maxNumSolutions]; // milliseconds

static const SolutionInfo solutions[maxNumSolutions] = {
  {(void*)Cijk_Ailk_Bljk_HB_MT64x64x16_SE_, "Cijk_Ailk_Bljk_HB_MT64x64x16_SE_", {2, 2, 1, 3, true, 0, 0} }
 };

const unsigned int numSummations = 11;
const unsigned int summations[numSummations] = {32, 64, 96, 128, 256, 512, 1024, 2048, 4096, 8192, 16192};
const unsigned int solutionMetaData[maxNumSolutions][10] = {
  {64, 64, 4, 4, 16, 16, 0, 0, 1, 1}
 };

/* runtime structures */
TensileStatus status;
hipStream_t stream;

void *deviceD;
void *deviceC;
void *deviceA;
void *deviceB;

/* benchmarking parameters */
size_t validationStride;
static bool useHighPrecisionAccumulate = false;

/* generated call to reference */
template<typename DataType, typename DestDataType, typename ComputeDataType>
TensileStatus generatedCallToReferenceCPU(
    const unsigned int *sizes,
    const unsigned int *minStrides,
    DestDataType *referenceD,
    DestDataType *referenceC,
    DataType *initialA,
    DataType *initialB,
    const unsigned int lda,
    const unsigned int ldb,
    const unsigned int ldc,
    const unsigned int ldd,
    const unsigned int stride_a,
    const unsigned int stride_b,
    const unsigned int stride_c,
    const unsigned int stride_d,
    ComputeDataType alpha,
    ComputeDataType beta,
    bool useHighPrecisionAccumulate) {
  return tensileReferenceCPU(
      referenceD,
      referenceC,
      initialA,
      initialB,
      lda,
      ldb,
      ldc,
      ldd,
      stride_a,
      stride_b,
      stride_c,
      stride_d,
      alpha,
      beta,
      totalIndices[problemTypeIdx],
      sizes,
      minStrides,
      numIndicesC[problemTypeIdx],
      numIndicesA[problemTypeIdx],
      numIndicesB[problemTypeIdx],
      indexAssignmentsA[problemTypeIdx],
      indexAssignmentsB[problemTypeIdx],
      complexConjugateA[problemTypeIdx],
      complexConjugateB[problemTypeIdx],
      validationStride,
      useHighPrecisionAccumulate);
};

/* generated call to solution */
template<typename DataType, class SolutionInfoType>
TensileStatus generatedCallToSolution(
    const SolutionInfoType &solution,
    SolutionLock *solutionLock,
    const unsigned int *sizes,
    const unsigned int *minStrides,
    const unsigned int lda,
    const unsigned int ldb,
    const unsigned int ldc,
    const unsigned int ldd,
    const unsigned int stride_a,
    const unsigned int stride_b,
    const unsigned int stride_c,
    const unsigned int stride_d,
    DataType alpha,
    DataType beta,
    unsigned int numEvents = 0,
    hipEvent_t *startEvent = NULL,
    hipEvent_t *stopEvent = NULL ) {
  // calculate parameters assuming packed data
  unsigned int strideD0I = 1;
  unsigned int strideD1J = 1 * ((ldd != std::numeric_limits<unsigned int>::max()) ? ldd : std::max(minStrides[0], sizes[0]));
  unsigned int strideD2K = 1 * ((ldd != std::numeric_limits<unsigned int>::max()) ? ldd : std::max(minStrides[0], sizes[0])) * (std::max(minStrides[1], sizes[1]));
  if (stride_d != std::numeric_limits<unsigned int>::max())  strideD2K = stride_d;
  unsigned int strideC0I = 1 ;
  unsigned int strideC1J = 1  * ((ldc != std::numeric_limits<unsigned int>::max()) ? ldc : std::max(minStrides[0], sizes[0]));
  unsigned int strideC2K = 1  * ((ldc != std::numeric_limits<unsigned int>::max()) ? ldc : std::max(minStrides[0], sizes[0])) * (std::max(minStrides[1], sizes[1]));
  if (stride_c != std::numeric_limits<unsigned int>::max())  strideC2K = stride_c;
  unsigned int strideA0I = 1;
  unsigned int strideA1L = 1 * ((lda != std::numeric_limits<unsigned int>::max()) ? lda : std::max(minStrides[0], sizes[0]));
  unsigned int strideA2K = 1 * ((lda != std::numeric_limits<unsigned int>::max()) ? lda : std::max(minStrides[0], sizes[0])) * (std::max(minStrides[3], sizes[3]));
  if (stride_a != std::numeric_limits<unsigned int>::max())  strideA2K = stride_a;
  unsigned int strideB0L = 1;
  unsigned int strideB1J = 1 * ((ldb != std::numeric_limits<unsigned int>::max()) ? ldb : std::max(minStrides[3], sizes[3]));
  unsigned int strideB2K = 1 * ((ldb != std::numeric_limits<unsigned int>::max()) ? ldb : std::max(minStrides[3], sizes[3])) * (std::max(minStrides[1], sizes[1]));
  if (stride_b != std::numeric_limits<unsigned int>::max())  strideB2K = stride_b;
  unsigned int sizeI = sizes[0];
  unsigned int sizeJ = sizes[1];
  unsigned int sizeK = sizes[2];
  unsigned int sizeL = sizes[3];

  // Check assertions,
  typedef ProblemDims<1,3,3,3,3,4> ProblemDims_Cijk_Ailk_Bljk_HB;
  static const ProblemType problemType( {0,1}, {3}, {2}, {0,3,2}, {3,1,2});
  ProblemDims_Cijk_Ailk_Bljk_HB pdims(strideD1J, strideD2K, strideC1J, strideC2K, strideA1L, strideA2K, strideB1J, strideB2K, sizeI, sizeJ, sizeK, sizeL);
  if (!ProblemProperties(pdims,&problemType).validForSolution(solution._assertionRequirements))
    return tensileStatusAssertFailure;  // problem dims did not meet requirements for solution

  // call solution function
  TensileSolutionPointer_Cijk_Ailk_Bljk_HB f = reinterpret_cast<TensileSolutionPointer_Cijk_Ailk_Bljk_HB> (solution._functionPtr);
  return f(solutionLock, static_cast<TensileHalf *>(deviceD), static_cast<TensileHalf *>(deviceC), static_cast<TensileHalf *>(deviceA), static_cast<TensileHalf *>(deviceB),
      alpha,
      beta,
      strideD1J,
      strideD2K,
      strideC1J,
      strideC2K,
      strideA1L,
      strideA2K,
      strideB1J,
      strideB2K,
      sizeI,
      sizeJ,
      sizeK,
      sizeL,
      stream,
      numEvents, startEvent, stopEvent); // events
};

/* results file name */
const char *resultsFileName = "/home/htony/Source/Tensile/4_MFMA/Tensile/build-hgemm-64x64-DU16-PLR-PGR-GM8/1_BenchmarkProblems/Cijk_Ailk_Bljk_HB_00/00_Final/../Data/00_Final.csv";
const char *granularityFileName = "/home/htony/Source/Tensile/4_MFMA/Tensile/build-hgemm-64x64-DU16-PLR-PGR-GM8/1_BenchmarkProblems/Cijk_Ailk_Bljk_HB_00/00_Final/../Data/00_Final_Granularity.csv";
