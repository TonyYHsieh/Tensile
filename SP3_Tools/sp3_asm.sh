#!/bin/bash

export LD_LIBRARY_PATH=~/Tools/SP3/
~/Tools/SP3/mi100_sp3 $1.sp3 asic=MI9 type=cs -hex $1.hex
~/Tools/SP3/mi100_sp3 -hex $1.hex asic=MI9 type=cs  $1_out.sp3
cat $1_out.sp3 | grep "// " | grep ": " | sed "s/.*: //" | sed "s/ \([0-9a-f]*\)/, 0x\1/" |sed "s/^/.long 0x/" > $1.inc
#/opt/rocm/opencl/bin/x86_64/clang -x assembler -target amdgcn-amdhsa -mcpu=gfx906 template.s -o output.co
