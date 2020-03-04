export LD_LIBRARY_PATH=../SP3_Tools/
tool=../SP3_Tools/
name=Cijk_Alik_Bljk_SB_MT64x32x32_SE_K1
client_kernel_path=../build_64x32_FP32/1_BenchmarkProblems/Cijk_Alik_Bljk_SB_00/00_Final/source/assembly

cp ${name}.sp3.c ${name}.sp3
# /home/tonyh/Tools/SP3/sp3_asm.sh ${name}

${tool}/mi100_sp3 ${name}.sp3 asic=MI9 type=cs -hex ${name}.hex
${tool}/mi100_sp3 -hex ${name}.hex asic=MI9 type=cs  ${name}_out.sp3
cat ${name}_out.sp3 | grep "// " | grep ": " | sed "s/.*: //" | sed "s/ \([0-9a-f]*\)/, 0x\1/" |sed "s/^/.long 0x/" > ${name}.inc

cat ${name}.header.s > ${name}.s
cat ${name}.inc >> ${name}.s
${tool}/asm.sh ${name} -mcpu=gfx908
cp ${name}.s  ${client_kernel_path}
cp ${name}.o  ${client_kernel_path}
cp ${name}.co ${client_kernel_path}
