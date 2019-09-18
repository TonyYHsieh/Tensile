#!/bin/sh 
# usage: asm.sh kernelName ASM_ARGS
# example: asm.sh kernelName -mcpu=gfx900
f=$1
shift
ASM=/opt/rocm/bin/hcc
${ASM} -x assembler -target amdgcn-amd-amdhsa -mno-code-object-v3 $@ -c -o $f.o $f.s
${ASM} -target amdgcn-amd-amdhsa $f.o -o $f.co
