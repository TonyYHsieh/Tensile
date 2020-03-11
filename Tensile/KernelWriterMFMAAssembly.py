from . import Code
from .Common import globalParameters
from .KernelWriterAssembly import KernelWriterAssembly

# utils func
from .KernelWriterAssembly import vectorStaticDivide
from .KernelWriterAssembly import vectorStaticRemainder
from .KernelWriterAssembly import vectorStaticDivideAndRemainder
from .KernelWriterAssembly import inst
from .KernelWriterAssembly import vgpr
from .KernelWriterAssembly import sgpr
from .KernelWriterAssembly import log2

class KernelWriterMFMAAssembly(KernelWriterAssembly):

  ##############################################################################
  # Local Read Addresses: Tile Assignment A
  ##############################################################################
  def lraTileAssignmentA(self, kernel, tP):

    kStr = ""
    kStr += "%slr%s = serial %% SG%s%s%s" \
        % (self.commentPrefix, tP["tileChar"], tP["tileChar"], \
        self.commentSuffix, self.endLine)

    # alloc vgpr
    tReg    = self.vgprPool.checkOut(1,"tReg") # remainder
    wReg    = self.vgprPool.checkOut(1,"wReg") # quotient
    kReg    = self.vgprPool.checkOut(1,"kReg") # remainder
    tmpVgpr = self.vgprPool.checkOut(2,"tmpVgpr")
    dummy   = self.vgprPool.checkOut(1,"dummy")

    # alloc sgpr
    tmpSgpr = self.getTmpSgpr(1)

    # get constant parameter
    dividendReg    = "Serial" # local serial
    MIBShape0      = kernel["MatrixInstM"] * kernel["MatrixInstBM"] # matrix instruction MN shape for M
    dividendForK   = kernel["MatrixInstM"] * kernel["MatrixInstB"]
    inputPerThread = kernel["MatrixInstM"] * kernel["MatrixInstK"] * kernel["MatrixInstB"] // globalParameters["WavefrontWidth"]
    strideForK     = (kernel["MacroTile0"] + kernel["LdsPadA"]) * inputPerThread

    # thread offset
    kStr += vectorStaticRemainder(dummy, kReg, "Serial", globalParameters["WavefrontWidth"], tmpVgpr, tmpSgpr)
    kStr += vectorStaticRemainder(dummy, tReg, kReg, MIBShape0, tmpVgpr, tmpSgpr)
    kStr += vectorStaticDivide(kReg, kReg, dividendForK, tmpVgpr, tmpSgpr)
    kStr += inst("s_mov_b32", sgpr(tmpSgpr), hex(strideForK), "(MT0+PAD)*(number of inputs per thread)")
    kStr += inst("v_mul_lo_u32", vgpr(kReg), sgpr(tmpSgpr), vgpr(kReg), "k offset = k_idx * (MT0+PAD)")
    kStr += inst("v_add_u32", vgpr(tReg), vgpr(kReg), vgpr(tReg), "")

    # wave offset
    if True:
    # if kernel["MIWaveGroup"][0] > 1:
      kStr += vectorStaticDivide(wReg, "Serial", globalParameters["WavefrontWidth"], tmpVgpr, tmpSgpr)
      kStr += vectorStaticRemainder(dummy, wReg, wReg, kernel["MIWaveGroup"][0], tmpVgpr, tmpSgpr)
      kStr += inst("v_lshlrev_b32", vgpr(wReg), hex(log2(kernel["MatrixInstM"] * kernel["MatrixInstBM"])), vgpr(wReg), "wave offset in m dimension")
      kStr += inst("v_add_u32", vgpr(tReg), vgpr(wReg), vgpr(tReg), "")

    # release register
    tP["gpr"]["lro"] = tReg
    self.vgprPool.checkIn(wReg)
    self.vgprPool.checkIn(kReg)
    self.vgprPool.checkIn(tmpVgpr)
    self.vgprPool.checkIn(dummy)

    return kStr

  ##############################################################################
  # Local Read Addresses: Tile Assignment B
  ##############################################################################
  def lraTileAssignmentB(self, kernel, tP):
    kStr = ""
    kStr += "%slr%s = (serial / SG%s) %% SG%s%s%s" \
        % (self.commentPrefix, tP["tileChar"], tP["tileChar"], \
        tP["tileChar"], self.commentSuffix, self.endLine)

    # alloc vgpr
    wReg    = self.vgprPool.checkOut(1,"wReg") # quotient
    tReg    = self.vgprPool.checkOut(1,"tReg") # remainder
    kReg    = self.vgprPool.checkOut(1,"kReg") # remainder
    tmpVgpr = self.vgprPool.checkOut(2,"tmpVgpr")
    dummy   = self.vgprPool.checkOut(1,"dummy")

     # alloc sgpr
    tmpSgpr = self.getTmpSgpr(1)

    # get constant parameter
    dividendReg   = "Serial" # local serial
    MIBShape0      = kernel["MatrixInstN"] * kernel["MatrixInstBN"] # matrix instruction MN shape for M
    dividendForK   = kernel["MatrixInstN"] * kernel["MatrixInstB"]
    inputPerThread = kernel["MatrixInstN"] * kernel["MatrixInstK"] * kernel["MatrixInstB"] // globalParameters["WavefrontWidth"]
    strideForK     = (kernel["MacroTile1"] + kernel["LdsPadB"]) * inputPerThread

    # thread offset
    kStr += vectorStaticRemainder(dummy, kReg, "Serial", globalParameters["WavefrontWidth"], tmpVgpr, tmpSgpr)
    kStr += vectorStaticRemainder(dummy, tReg, kReg, MIBShape0, tmpVgpr, tmpSgpr)
    kStr += vectorStaticDivide(kReg, kReg, dividendForK, tmpVgpr, tmpSgpr)
    kStr += inst("s_mov_b32", sgpr(tmpSgpr), hex(strideForK), "(MT1+PAD)*(number of inputs per thread)")
    kStr += inst("v_mul_lo_u32", vgpr(kReg), sgpr(tmpSgpr), vgpr(kReg), "k offset = k_idx * (MT1+PAD)")
    kStr += inst("v_add_u32", vgpr(tReg), vgpr(kReg), vgpr(tReg), "")

    # wave offset
    if True:
    # if kernel["MIWaveGroup"][0] > 1:
      kStr += vectorStaticDivide(wReg, "Serial", globalParameters["WavefrontWidth"], tmpVgpr, tmpSgpr)
      kStr += vectorStaticDivide(wReg, wReg, kernel["MIWaveGroup"][0], tmpVgpr, tmpSgpr) 
      kStr += inst("v_lshlrev_b32", vgpr(wReg), hex(log2(kernel["MatrixInstM"] * kernel["MatrixInstBN"])), vgpr(wReg), "wave offset in m dimension")
      kStr += inst("v_add_u32", vgpr(tReg), vgpr(wReg), vgpr(tReg), "")

    # release register
    tP["gpr"]["lro"] = tReg
    self.vgprPool.checkIn(wReg)
    self.vgprPool.checkIn(kReg)
    self.vgprPool.checkIn(tmpVgpr)
    self.vgprPool.checkIn(dummy)

    return kStr


  ##############################################################################
  # Local Read Addresses: Final Offset A/B
  ##############################################################################
  def lraFinalOffset(self, kernel, tP):
    kStr = ""

    # allocate resources
    sgid    = self.vgprPool.checkOut(1) # quotient
    rReg    = self.vgprPool.checkOut(1) # remainder, unused here
    tmpVgpr = self.vgprPool.checkOut(2,"tmpVgpr")
    tmpSgpr = self.getTmpSgpr(1)

    # constants
    dividendReg = "Serial"
    tc          = tP["tensorChar"]
    tIdx        = tP["tensorIdx"]
    divisor     = kernel["SubGroup0"] * kernel["SubGroup1"]
    mtAddPad    = kernel["MacroTile%u"%tP["tensorIdx"]] + kernel["LdsPad%s"%tc]

    # LSU offset
    kStr += vectorStaticDivideAndRemainder(sgid, rReg, dividendReg, divisor, tmpVgpr, tmpSgpr)
    kStr += inst("s_mov_b32", sgpr(tmpSgpr), hex(mtAddPad), "MT%u+PAD"%tP["tensorIdx"] )
    kStr += inst("v_mul_lo_u32", vgpr(sgid), sgpr(tmpSgpr), vgpr(sgid), "sgid=sgid*(MT%u+PAD)"%tIdx )

    # final offset
    kStr += inst("_v_add_lshl_u32", vgpr("LocalReadAddr%s"%tc), vgpr(sgid), vgpr(tP["gpr"]["lro"]), hex(log2(tP["bpe"])), "o = (lro%s*VW+sgid*MT%u)*bpe"%(tc, tIdx) )

    # release resources
    self.vgprPool.checkIn(tmpVgpr)
    self.vgprPool.checkIn(sgid)
    self.vgprPool.checkIn(rReg)
    self.vgprPool.checkIn(tP["gpr"]["lro"])
    return kStr


  ##############################################################################
  # Local Read: Do It A/B
  # iui = Inner Unroll Idx
  # epsi = expand pointer swap index. Only used for PAP
  ##############################################################################
  def localReadDo(self, kernel, bufferIdx, iui, epsi, tP):

    tc=tP["tensorChar"]
    if not self.do["LocalRead%s"%tc]:
      return ""

    imod = Code.Module("LocalReadDo%s"%tc)
    self.localReadDoCnt += 1

    instruction = tP["localReadInstruction"]
    numOffsets = instruction.numOffsets
    blockWidth = instruction.blockWidth
    offsetMultiplier = 1
    MIWaveGropuShape = [ kernel["MatrixInstM"] * kernel["MatrixInstBM"] * kernel["MIWaveGroup"][0], \
                         kernel["MatrixInstN"] * kernel["MatrixInstBN"] * kernel["MIWaveGroup"][1] ]

    valuIdx = 0
    tIdx = tP["tensorIdx"]

    numVectorsPerTile = kernel["MIWaveTile"][tIdx]
    numReadsPerVector = tP["bpe"] // (blockWidth * 4) # bytes/register

    # mfma: for AB tile in NT layout
    for vIdx in range(0, numVectorsPerTile):
      for rIdx in range(0, numReadsPerVector):
        localReadCode = imod.addCode (Code.Module("LocalRead%s Valu%u"%(tc,valuIdx)))

        paramList = []
        destVgpr = vgpr("Valu%s_X%u_I%u+%u"%(tc, bufferIdx, iui, valuIdx), blockWidth)
        paramList.append(destVgpr)
        paramList.append(vgpr("LocalReadAddr%s"%tc))

        for oIdx in range(0, numOffsets):
          offset_val = rIdx * blockWidth + ((vIdx * numOffsets+oIdx) * MIWaveGropuShape[tIdx]) + tP["localReadOffset"]
          offset_val = offset_val * tP["bpe"] + tP["localReadSwapByteOffset"]
          paramList.append(offset_val)

        paramTuple = tuple(paramList)
        comment = "L -> Reg lro=%d swapByteOffset=%u ti=%u vIdx=%u rIdx=%u oIdx=%u buffer=%u iui=%u" \
            % (tP["localReadOffset"], tP["localReadSwapByteOffset"], MIWaveGropuShape[tIdx], vIdx, rIdx, oIdx, bufferIdx, iui)

        localReadCode.addCode(Code.LocalReadInst(instruction.toCodeInst(paramTuple), comment))
        valuIdx += blockWidth

        if self.db["CheckValue1%s"%tc]:
            localReadCode.addInst("s_waitcnt lgkmcnt(0)", "CheckValue1 wait for LDS read")
            if self.archCaps["SeparateVscnt"]:
              localReadCode.addInst( "s_waitcnt_vscnt", "null", "0", "")
            if kernel["ProblemType"]["DataType"].isHalf():
              localReadCode.append(self.assert_eq(destVgpr, hex(0x3c003c00))) # packed 1s
            elif kernel["ProblemType"]["DataType"].isBFloat16():
              localReadCode.append(self.assert_eq(destVgpr, hex(0x3f803f80))) # packed 1s
            elif kernel["ProblemType"]["DataType"].isInt8x4() or kernel["ProblemType"]["DataType"].isSingle():
              localReadCode.addText(self.assert_eq(destVgpr, 1.0))

    return imod

  ##############################################################################
  # Local Read: Increment A/B
  ##############################################################################
  def localReadInc(self, kernel, iui, tP):

    tc = tP["tensorChar"]
    if not self.do["LocalRead%s" % tc]:
      return ""

    kStr = ""

    if self.inTailLoop:
      pass
#      inc = kernel["LocalSplitU"]*(kernel["MacroTile%u"%tP["tensorIdx"]]+kernel["LdsPad%s"%tc])*tP["bpe"]
#      if kernel["MatrixInstruction"]:
#        inc *= kernel["MatrixInstK"]
#      tmpSgpr = self.getTmpSgpr(1)
#      kStr += inst("s_mov_b32", sgpr(tmpSgpr), hex(inc), "inc")
#      kStr += inst("_v_add_co_u32", vgpr("LocalReadAddr%s"%tP["tensorChar"]), "vcc", sgpr(tmpSgpr), vgpr("LocalReadAddr%s"%tP["tensorChar"]), \
#          "lr%s += %u (LSU*(MT+PAD)*bpe)"%(tP["tensorChar"], inc) )
    else:
      if tP["localReadInstruction"].numOffsets == 1:
        tP["localReadOffset"] += kernel["LocalSplitU"] * (kernel["MacroTile%u"%tP["tensorIdx"]] + kernel["LdsPad%s"%tc]) * kernel["MatrixInstK"]
        kStr += self.comment1("N/A, lro->%d"%tP["localReadOffset"])

    return kStr


  ##############################################################################
  # MFMA Iteration
  ##############################################################################
  def mfmaIter(self, kernel, m, innerUnroll):

    kStr = ""

    accs_per_wave   = kernel["MatrixInstM"] * kernel["MatrixInstN"] * kernel["MatrixInstB"] / globalParameters["WavefrontWidth"]

    for b in range(0, kernel["MIWaveTile"][1]):
      for a in range(0, kernel["MIWaveTile"][0]):
        for iui in range(0, innerUnroll):  # TODO: not check yet
          accIdx   = b * kernel["MIWaveTile"][0] + a
          accStart = accIdx * accs_per_wave
          accEnd   = accStart + accs_per_wave - 1
          aStr     = vgpr("ValuA_X%u_I%u+%u" % (m, iui, a), 1)
          bStr     = vgpr("ValuB_X%u_I%u+%u" % (m, iui, b), 1)
          kStr    += "v_mfma_f32_%ux%ux%u%s a[%u:%u], %s, %s, a[%u:%u]%s" \
                     % (kernel["MatrixInstM"], kernel["MatrixInstN"], kernel["MatrixInstK"], kernel["ProblemType"]["DataType"].toNameAbbrev(),
                        accStart, accEnd, aStr, bStr, accStart, accEnd, self.endLine)
    return kStr


  ##############################################################################
  # computeStoreVgprs
  # Compute workitem/TT offsets in VGPRS
  # and coord0/coord1
  # tid0Scale specifies the number of output elements in 0/coalesced dim
  # that should be written by each work-item in each batch element.
  ##############################################################################
  def computeStoreVgprs(self, kernel, divisor, tid0Scale, tid1Scale):

     # self.coord0
     # self.coord1
     # self.cinRowPtr  : C buffer coulmn offset
     # self.coutRowPtr : D buffer coulmn offset

    # alloc resources
    tid0 = self.vgprPool.checkOut(1)
    tid1 = self.vgprPool.checkOut(1)
    if kernel["BufferStore"]:
      self.cinRowPtr  = self.vgprPool.checkOut(1, "cinRowPtr")
      if not kernel["LdcEqualsLdd"]:
        self.coutRowPtr = self.vgprPool.checkOut(1, "coutRowPtr")

    wave_id = self.vgprPool.checkOut(1)

    tmpVgpr0 = self.vgprPool.checkOut(1,"tmpVgpr0")
    tmpVgpr1 = self.vgprPool.checkOut(2,"tmpVgpr1")
    dummy    = self.vgprPool.checkOut(1,"dummy")
    tmpSgpr  = self.getTmpSgpr(1)

    # constant
    MIBShape0 = kernel["MatrixInstM"] * kernel["MatrixInstBM"]
    MIBShape1 = kernel["MatrixInstN"] * kernel["MatrixInstBN"]

    kStr = ""
    kStr += self.comment1("computeStoreVgprs")

    # coord 1 : wave part
    kStr += vectorStaticDivide(wave_id, "Serial", globalParameters["WavefrontWidth"], tmpVgpr1, tmpSgpr)
    kStr += vectorStaticDivide(tid1, wave_id, kernel["MIWaveGroup"][0], tmpVgpr1, tmpSgpr)
    kStr += inst("v_mul_lo_u32", vgpr(tid1), hex(MIBShape1), vgpr(tid1), "wave coordination offset 1")

    # coord 1 : thread part
    kStr += vectorStaticRemainder(dummy, tmpVgpr0, "Serial", kernel["MatrixInstN"], tmpVgpr1, tmpSgpr)
    kStr += inst("v_add_u32", vgpr(tid1), vgpr(tmpVgpr0), vgpr(tid1), "coordination 1 = wave_id1 + tid1")

    # coord 1 : offset part
    kStr += inst("v_mul_lo_u32", vgpr(self.cinRowPtr), vgpr(tid1), sgpr("StridesC"), " offset 1")

    # coord 0 : wave part
    kStr += vectorStaticRemainder(dummy, tmpVgpr0, wave_id, kernel["MIWaveGroup"][0], tmpVgpr1, tmpSgpr)
    kStr += inst("v_mul_lo_u32", vgpr(tmpVgpr0), hex(MIBShape0), vgpr(tmpVgpr0), "wave coordination offset 0")

    # coord 0 : thread part
    kStr += vectorStaticRemainder(dummy, tid0, "Serial", globalParameters["WavefrontWidth"], tmpVgpr1, tmpSgpr)
    kStr += vectorStaticDivide(tid0, tid0, kernel["MatrixInstM"], tmpVgpr1, tmpSgpr)
    kStr += inst("v_lshlrev_b32", vgpr(tid0), hex(2), vgpr(tid0), "thread0 * 4 : mfma output 4 continuous outputs")
    kStr += inst("v_add_u32", vgpr(tid0), vgpr(tmpVgpr0), vgpr(tid0), "coordination 0 = wave_id0 + tid0")

    # macro tile 0 part
    kStr += inst("s_mul_i32", sgpr(tmpSgpr), kernel["MacroTile0"], sgpr("WorkGroup0"), "wgp0 * MT0")
    kStr += inst("v_add_u32", vgpr(tid0), sgpr(tmpSgpr), vgpr(tid0), "coord 0 = (tid0/MI_m)*4 + waveG0*MIB_m + MT0*SG0")

    # macro tile 1 part
    kStr += inst("s_mul_i32", sgpr(tmpSgpr), kernel["MacroTile1"], sgpr("WorkGroup1"), "wgp1 * MT1")
    kStr += inst("v_add_u32", vgpr(tid1), sgpr(tmpSgpr), vgpr(tid1), "coord 1 = (tid0%MI_m) + waveG1*MIB_n + MT1*SG1")

    # release resource
    self.vgprPool.checkIn(dummy)
    self.vgprPool.checkIn(tmpVgpr1)
    self.vgprPool.checkIn(tmpVgpr0)
    self.vgprPool.checkIn(wave_id)

    self.coord0 = tid0
    self.coord1 = tid1

    return kStr

