#pragma once
#include "TensileTypes.h"
#include "SolutionHelper.h"
#include "SolutionMapper.h"

void tensileInitialize();


// enqueue solution
TensileStatus tensile_Cijk_Ailk_Bljk_HB(
    TensileHalf * dataD,
    const TensileHalf * dataC,
    const TensileHalf * dataA,
    const TensileHalf * dataB,
    TensileHalf alpha,
    TensileHalf beta,
    unsigned int strideD1J,
    unsigned int strideD2K,
    unsigned int strideC1J,
    unsigned int strideC2K,
    unsigned int strideA1L,
    unsigned int strideA2K,
    unsigned int strideB1J,
    unsigned int strideB2K,
    unsigned int sizeI,
    unsigned int sizeJ,
    unsigned int sizeK,
    unsigned int sizeL,
    hipStream_t stream,
    unsigned int numInputEvents,
    hipEvent_t * inputEvents,
    hipEvent_t * outputEvent);

typedef ProblemKey<4> ProblemKey_Cijk_Ailk_Bljk_HB;
typedef ProblemDims<1,3,3,3,3,4> ProblemDims_Cijk_Ailk_Bljk_HB;
typedef SolutionMapper<ProblemDims_Cijk_Ailk_Bljk_HB, ProblemKey_Cijk_Ailk_Bljk_HB> SolutionMapper_Cijk_Ailk_Bljk_HB;

// get solution pointer
SolutionMapper_Cijk_Ailk_Bljk_HB::SolutionRuntime *
tensileGetSolutionPointer_Cijk_Ailk_Bljk_HB(
    unsigned int strideD1J,
    unsigned int strideD2K,
    unsigned int strideC1J,
    unsigned int strideC2K,
    unsigned int strideA1L,
    unsigned int strideA2K,
    unsigned int strideB1J,
    unsigned int strideB2K,
    unsigned int sizeI,
    unsigned int sizeJ,
    unsigned int sizeK,
    unsigned int sizeL);

// get solution name
const char * tensileGetSolutionName_Cijk_Ailk_Bljk_HB(
    unsigned int strideD1J,
    unsigned int strideD2K,
    unsigned int strideC1J,
    unsigned int strideC2K,
    unsigned int strideA1L,
    unsigned int strideA2K,
    unsigned int strideB1J,
    unsigned int strideB2K,
    unsigned int sizeI,
    unsigned int sizeJ,
    unsigned int sizeK,
    unsigned int sizeL);

