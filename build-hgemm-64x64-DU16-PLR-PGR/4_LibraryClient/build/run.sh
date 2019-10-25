#!/bin/bash

set -ex
echo && echo "################################################################################" && echo "# Configuring CMake for Client" && echo "################################################################################"
cmake -DTensile_RUNTIME_LANGUAGE=HIP -DTensile_CODE_OBJECT_VERSION=V2 -DTensile_COMPILER=hcc -DTensile_ENABLE_HALF=ON -DTensile_RESUME_BENCHMARK=OFF -DTensile_ROOT=/home/htony/Source/Tensile/4_MFMA/Tensile/Tensile -DTensile_CLIENT_BENCHMARK=OFF -DTensile_LOGIC_PATH=/home/htony/Source/Tensile/4_MFMA/Tensile/build-hgemm-64x64-DU16-PLR-PGR/3_LibraryLogic -DTensile_LIBRARY_PRINT_DEBUG=OFF -DTensile_SHORT_FILE_NAMES=OFF -DTENSILE_NEW_CLIENT=OFF  -DCMAKE_BUILD_TYPE=Release -DTensile_MERGE_FILES=ON ../source
echo && echo "################################################################################" && echo "# Building Client" && echo "################################################################################"
cmake --build . --config Release -- -j 8
echo && echo "################################################################################" && echo "# Library Client:" && echo "# /home/htony/Source/Tensile/4_MFMA/Tensile/build-hgemm-64x64-DU16-PLR-PGR/4_LibraryClient/build/client" && /home/htony/Source/Tensile/4_MFMA/Tensile/build-hgemm-64x64-DU16-PLR-PGR/4_LibraryClient/build/client
exit $ERR
