# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build

# Include any dependencies generated for this target.
include client/CMakeFiles/tensile_client.dir/depend.make

# Include the progress variables for this target.
include client/CMakeFiles/tensile_client.dir/progress.make

# Include the compile flags for this target's objects.
include client/CMakeFiles/tensile_client.dir/flags.make

client/CMakeFiles/tensile_client.dir/main.cpp.o: client/CMakeFiles/tensile_client.dir/flags.make
client/CMakeFiles/tensile_client.dir/main.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object client/CMakeFiles/tensile_client.dir/main.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tensile_client.dir/main.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/main.cpp

client/CMakeFiles/tensile_client.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tensile_client.dir/main.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/main.cpp > CMakeFiles/tensile_client.dir/main.cpp.i

client/CMakeFiles/tensile_client.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tensile_client.dir/main.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/main.cpp -o CMakeFiles/tensile_client.dir/main.cpp.s

client/CMakeFiles/tensile_client.dir/main.cpp.o.requires:

.PHONY : client/CMakeFiles/tensile_client.dir/main.cpp.o.requires

client/CMakeFiles/tensile_client.dir/main.cpp.o.provides: client/CMakeFiles/tensile_client.dir/main.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/tensile_client.dir/build.make client/CMakeFiles/tensile_client.dir/main.cpp.o.provides.build
.PHONY : client/CMakeFiles/tensile_client.dir/main.cpp.o.provides

client/CMakeFiles/tensile_client.dir/main.cpp.o.provides.build: client/CMakeFiles/tensile_client.dir/main.cpp.o


# Object files for target tensile_client
tensile_client_OBJECTS = \
"CMakeFiles/tensile_client.dir/main.cpp.o"

# External object files for target tensile_client
tensile_client_EXTERNAL_OBJECTS =

client/tensile_client: client/CMakeFiles/tensile_client.dir/main.cpp.o
client/tensile_client: client/CMakeFiles/tensile_client.dir/build.make
client/tensile_client: lib/libTensileHost.a
client/tensile_client: client/libTensileClient.a
client/tensile_client: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
client/tensile_client: lib/libTensileHost.a
client/tensile_client: /usr/lib/llvm-6.0/lib/libLLVMObjectYAML.a
client/tensile_client: /usr/lib/llvm-6.0/lib/libLLVMDebugInfoCodeView.a
client/tensile_client: /usr/lib/llvm-6.0/lib/libLLVMDebugInfoMSF.a
client/tensile_client: /usr/lib/llvm-6.0/lib/libLLVMSupport.a
client/tensile_client: /usr/lib/llvm-6.0/lib/libLLVMDemangle.a
client/tensile_client: /opt/rocm/hip/lib/libhip_hcc.so
client/tensile_client: /opt/rocm/lib/libmcwamp.so.2.8
client/tensile_client: /opt/rocm/lib/libhc_am.so.2.8
client/tensile_client: /opt/rocm/lib/libhsa-runtime64.so
client/tensile_client: /opt/rocm/rocm_smi/lib/librocm_smi64.so
client/tensile_client: client/CMakeFiles/tensile_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable tensile_client"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tensile_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
client/CMakeFiles/tensile_client.dir/build: client/tensile_client

.PHONY : client/CMakeFiles/tensile_client.dir/build

client/CMakeFiles/tensile_client.dir/requires: client/CMakeFiles/tensile_client.dir/main.cpp.o.requires

.PHONY : client/CMakeFiles/tensile_client.dir/requires

client/CMakeFiles/tensile_client.dir/clean:
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client && $(CMAKE_COMMAND) -P CMakeFiles/tensile_client.dir/cmake_clean.cmake
.PHONY : client/CMakeFiles/tensile_client.dir/clean

client/CMakeFiles/tensile_client.dir/depend:
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4-GM8-PGR-PLR/0_Build/client/CMakeFiles/tensile_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : client/CMakeFiles/tensile_client.dir/depend

