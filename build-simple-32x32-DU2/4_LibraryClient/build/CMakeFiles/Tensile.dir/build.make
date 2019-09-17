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
CMAKE_SOURCE_DIR = /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build

# Include any dependencies generated for this target.
include CMakeFiles/Tensile.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Tensile.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Tensile.dir/flags.make

CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o: CMakeFiles/Tensile.dir/flags.make
CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o: Tensile/Tensile.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o -c /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Tensile.cpp

CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Tensile.cpp > CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.i

CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Tensile.cpp -o CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.s

CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.requires:

.PHONY : CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.requires

CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.provides: CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.requires
	$(MAKE) -f CMakeFiles/Tensile.dir/build.make CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.provides.build
.PHONY : CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.provides

CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.provides.build: CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o


CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o: CMakeFiles/Tensile.dir/flags.make
CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o: Tensile/Kernels.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o -c /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Kernels.cpp

CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Kernels.cpp > CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.i

CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Kernels.cpp -o CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.s

CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.requires:

.PHONY : CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.requires

CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.provides: CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.requires
	$(MAKE) -f CMakeFiles/Tensile.dir/build.make CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.provides.build
.PHONY : CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.provides

CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.provides.build: CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o


CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o: CMakeFiles/Tensile.dir/flags.make
CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o: Tensile/Solutions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o -c /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Solutions.cpp

CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Solutions.cpp > CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.i

CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Solutions.cpp -o CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.s

CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.requires:

.PHONY : CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.requires

CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.provides: CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.requires
	$(MAKE) -f CMakeFiles/Tensile.dir/build.make CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.provides.build
.PHONY : CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.provides

CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.provides.build: CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o


CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o: CMakeFiles/Tensile.dir/flags.make
CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o: Tensile/Tools.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o -c /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Tools.cpp

CMakeFiles/Tensile.dir/Tensile/Tools.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Tensile.dir/Tensile/Tools.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Tools.cpp > CMakeFiles/Tensile.dir/Tensile/Tools.cpp.i

CMakeFiles/Tensile.dir/Tensile/Tools.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Tensile.dir/Tensile/Tools.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/Tools.cpp -o CMakeFiles/Tensile.dir/Tensile/Tools.cpp.s

CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.requires:

.PHONY : CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.requires

CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.provides: CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.requires
	$(MAKE) -f CMakeFiles/Tensile.dir/build.make CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.provides.build
.PHONY : CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.provides

CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.provides.build: CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o


CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o: CMakeFiles/Tensile.dir/flags.make
CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o: Tensile/SolutionHelper.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o -c /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/SolutionHelper.cpp

CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/SolutionHelper.cpp > CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.i

CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/Tensile/SolutionHelper.cpp -o CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.s

CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.requires:

.PHONY : CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.requires

CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.provides: CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.requires
	$(MAKE) -f CMakeFiles/Tensile.dir/build.make CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.provides.build
.PHONY : CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.provides

CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.provides.build: CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o


# Object files for target Tensile
Tensile_OBJECTS = \
"CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o" \
"CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o" \
"CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o" \
"CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o" \
"CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o"

# External object files for target Tensile
Tensile_EXTERNAL_OBJECTS =

libTensile.a: CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o
libTensile.a: CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o
libTensile.a: CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o
libTensile.a: CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o
libTensile.a: CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o
libTensile.a: CMakeFiles/Tensile.dir/build.make
libTensile.a: CMakeFiles/Tensile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libTensile.a"
	$(CMAKE_COMMAND) -P CMakeFiles/Tensile.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Tensile.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Tensile.dir/build: libTensile.a

.PHONY : CMakeFiles/Tensile.dir/build

CMakeFiles/Tensile.dir/requires: CMakeFiles/Tensile.dir/Tensile/Tensile.cpp.o.requires
CMakeFiles/Tensile.dir/requires: CMakeFiles/Tensile.dir/Tensile/Kernels.cpp.o.requires
CMakeFiles/Tensile.dir/requires: CMakeFiles/Tensile.dir/Tensile/Solutions.cpp.o.requires
CMakeFiles/Tensile.dir/requires: CMakeFiles/Tensile.dir/Tensile/Tools.cpp.o.requires
CMakeFiles/Tensile.dir/requires: CMakeFiles/Tensile.dir/Tensile/SolutionHelper.cpp.o.requires

.PHONY : CMakeFiles/Tensile.dir/requires

CMakeFiles/Tensile.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Tensile.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Tensile.dir/clean

CMakeFiles/Tensile.dir/depend:
	cd /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/source /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/source /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build /home/htony/Source/Tensile/1_MFMA/Tensile/build-simple-32x32-DU2/4_LibraryClient/build/CMakeFiles/Tensile.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Tensile.dir/depend

