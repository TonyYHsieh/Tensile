#!/bin/bash

set -ex
echo && echo "################################################################################" && echo "# Configuring CMake for Client" && echo "################################################################################"
cmake -DTensile_RUNTIME_LANGUAGE=HIP -DTensile_CODE_OBJECT_VERSION=V2 -DTensile_COMPILER=hcc -DTensile_RESUME_BENCHMARK=OFF -DTensile_CLIENT_BENCHMARK=ON -DTENSILE_NEW_CLIENT=OFF  -DCMAKE_BUILD_TYPE=Release -DTensile_MERGE_FILES=ON ../source
echo && echo "################################################################################" && echo "# Building Client" && echo "################################################################################"
cmake --build . --config Release -- -j 8
/opt/rocm/bin/rocm-smi -d 0 --setfan 255 --setsclk 7
sleep 1
/opt/rocm/bin/rocm-smi -d 0 -a
set +e
./client --platform-idx 0 --device-idx 0 --init-alpha 2 --init-beta 0 --init-d 0 --init-c 3 --init-a 3 --init-b 3 --c-equal-d 1 --print-valids 0 --print-max 4 --num-benchmarks 1 --num-elements-to-validate 11111 --num-enqueues-per-sync 1 --num-syncs-per-benchmark 1 --use-gpu-timer 1 --sleep-percent 200 --benchmark-solutions 0
ERR1=$?
/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client/tensile_client --config-file=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/1_BenchmarkProblems/Cijk_Ailk_Bljk_SB_00/00_Final/build/../source/ClientParameters.ini
ERR2=$?


ERR=0
if [[ $ERR1 -ne 0 ]]
then
    echo one
    ERR=$ERR1
fi
if [[ $ERR2 -ne 0 ]]
then
    echo two
    ERR=$ERR2
fi
/opt/rocm/bin/rocm-smi -d 0 --resetclocks
/opt/rocm/bin/rocm-smi -d 0 --setfan 50
exit $ERR
