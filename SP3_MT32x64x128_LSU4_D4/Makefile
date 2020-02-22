all:
	cp Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.sp3.c Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.sp3
	/home/tonyh/Tool/SP3/sp3_asm.sh Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1
	cat Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.header.s > Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.s
	cat Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.inc >> Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.s
	/home/tonyh/Tool/SP3/asm.sh Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1 -mcpu=gfx908
	cp Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.s  ~/Source/Tensile/1_Tensile_rep_480/Tensile/build_32x64_LSU4_D4/1_BenchmarkProblems/Cijk_Alik_Bljk_BBH_00/00_Final/source/assembly/
	cp Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.o  ~/Source/Tensile/1_Tensile_rep_480/Tensile/build_32x64_LSU4_D4/1_BenchmarkProblems/Cijk_Alik_Bljk_BBH_00/00_Final/source/assembly/
	cp Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.co ~/Source/Tensile/1_Tensile_rep_480/Tensile/build_32x64_LSU4_D4/1_BenchmarkProblems/Cijk_Alik_Bljk_BBH_00/00_Final/source/assembly/

clean:
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.co
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.hex
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.inc
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.o
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1_out.sp3
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.s
	rm -rf Cijk_Alik_Bljk_BBH_MT32x64x128_SE_K1.sp3
