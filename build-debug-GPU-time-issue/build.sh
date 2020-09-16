#!/bin/bash
cmake -D CMAKE_BUILD_TYPE=Release -D TENSILE_NEW_CLIENT=ON -D Tensile_LIBRARY_FORMAT=yaml -D CMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc ../Tensile/Source
make -j32

