#include "Solutions.h"
#include "Tensile.h"
#include "TensileInternal.h"
#include "SolutionMapper.h"

/*******************************************************************************
* Per-Problem Functions for Cijk_Ailk_Bljk_SB
*******************************************************************************/
// Problem type include the index assignments for free, summation, batch:
static const ProblemType problemType_Cijk_Ailk_Bljk_SB( {0,1}, {3}, {2}, {0,3,2}, {3,1,2});

// Master solution mapper is the entry point for problem->solution mapping
// There is one master solution mapper per problem type
// The master solution mapper contains pointers to the solution mappers for each device
static MasterSolutionMapper<ProblemDims_Cijk_Ailk_Bljk_SB> masterSolutionMapper_Cijk_Ailk_Bljk_SB;
 
/*******************************************************************************
 * Per-Schedule Functions
 *******************************************************************************/

namespace { // Start schedule 'MI100'
// solution table - function, name, assertion requirements
static const SolutionInfo solutionTable_MI100_Cijk_Ailk_Bljk_SB[] = {
  {(void*)Cijk_Ailk_Bljk_SB_MT32x32x2_SE_, "Cijk_Ailk_Bljk_SB_MT32x32x2_SE_", {1, 1, 1, 0, 1, 0, 0} } // 0
};

// table of exact problem dims and selected solutionIdx
static const std::pair<const ProblemKey_Cijk_Ailk_Bljk_SB, int> embeddedExactTable_MI100_Cijk_Ailk_Bljk_SB[] = {
 { {157, 177, 1, 53}, 0}  // 17 GFlop/s
};

// The solution master constructor here adds device to the master solution mapper
// The entrypoint to find a solution for this problem is through the master solution master
static SolutionMapper_Cijk_Ailk_Bljk_SB solutionMapper_MI100_Cijk_Ailk_Bljk_SB(
  "MI100_Cijk_Ailk_Bljk_SB", // schedule+problem name
  solutionTable_MI100_Cijk_Ailk_Bljk_SB, 1,
  embeddedExactTable_MI100_Cijk_Ailk_Bljk_SB, 1,
  &problemType_Cijk_Ailk_Bljk_SB);
} // end anonymous namespace

// problem dims -> solution logic
SolutionMapper_Cijk_Ailk_Bljk_SB::SolutionRuntime *
tensileGetSolutionPointer_Cijk_Ailk_Bljk_SB(
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
    unsigned int sizeL) {

  /* exact mappings */
  ProblemDims_Cijk_Ailk_Bljk_SB pdims(strideD1J, strideD2K, strideC1J, strideC2K, strideA1L, strideA2K, strideB1J, strideB2K, sizeI, sizeJ, sizeK, sizeL);
  auto solutionMapper = reinterpret_cast<SolutionMapper_Cijk_Ailk_Bljk_SB *> (masterSolutionMapper_Cijk_Ailk_Bljk_SB.mapper());
  return solutionMapper->getSolutionWithFallback(pdims,&masterSolutionMapper_Cijk_Ailk_Bljk_SB);

  return nullptr;

}

// get solution name for problem dims
const char * tensileGetSolutionName_Cijk_Ailk_Bljk_SB(
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
    unsigned int sizeL) {

  /* exact mappings */
  ProblemDims_Cijk_Ailk_Bljk_SB pdims(strideD1J, strideD2K, strideC1J, strideC2K, strideA1L, strideA2K, strideB1J, strideB2K, sizeI, sizeJ, sizeK, sizeL);
  auto solutionMapper = reinterpret_cast<SolutionMapper_Cijk_Ailk_Bljk_SB *> (masterSolutionMapper_Cijk_Ailk_Bljk_SB.mapper());
  return solutionMapper->getSolutionWithFallback(pdims,&masterSolutionMapper_Cijk_Ailk_Bljk_SB)->_info->_name;

}
/*******************************************************************************
 * Per-ProblemType Functions
 *******************************************************************************/
// main call to solution; enqueues a kernel
TensileStatus tensile_Cijk_Ailk_Bljk_SB(
    float * dataD,
    const float * dataC,
    const float * dataA,
    const float * dataB,
    float alpha,
    float beta,
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
    hipEvent_t * outputEvent) {
    auto solution = tensileGetSolutionPointer_Cijk_Ailk_Bljk_SB(
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
        sizeL);
    if (solution) {
      TensileSolutionPointer_Cijk_Ailk_Bljk_SB f = reinterpret_cast<TensileSolutionPointer_Cijk_Ailk_Bljk_SB> (solution->_info->_functionPtr);
      auto solutionLock = &solution->_lock;
      return f(solutionLock, dataD, dataC, dataA, dataB, alpha, beta, strideD1J, strideD2K, strideC1J, strideC2K, strideA1L, strideA2K, strideB1J, strideB2K, sizeI, sizeJ, sizeK, sizeL, stream, numInputEvents, inputEvents, outputEvent);
    } else {
      return tensileStatusFailure; // no solution found
    }
}

/*******************************************************************************
* Tensilze initializer
*******************************************************************************/
void tensileInitialize() {
  masterSolutionMapper_Cijk_Ailk_Bljk_SB.initialize();
  solutionMapper_MI100_Cijk_Ailk_Bljk_SB.initializeMappers({"Device 738c"},&masterSolutionMapper_Cijk_Ailk_Bljk_SB);
}