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
CMAKE_SOURCE_DIR = /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build

# Include any dependencies generated for this target.
include CMakeFiles/client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/client.dir/flags.make

CMakeFiles/client.dir/Client.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/Client.cpp.o: /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/Client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/client.dir/Client.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/Client.cpp.o -c /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/Client.cpp

CMakeFiles/client.dir/Client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Client.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/Client.cpp > CMakeFiles/client.dir/Client.cpp.i

CMakeFiles/client.dir/Client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Client.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/Client.cpp -o CMakeFiles/client.dir/Client.cpp.s

CMakeFiles/client.dir/Client.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/Client.cpp.o.requires

CMakeFiles/client.dir/Client.cpp.o.provides: CMakeFiles/client.dir/Client.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/Client.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/Client.cpp.o.provides

CMakeFiles/client.dir/Client.cpp.o.provides.build: CMakeFiles/client.dir/Client.cpp.o


CMakeFiles/client.dir/MathTemplates.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/MathTemplates.cpp.o: /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/MathTemplates.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/client.dir/MathTemplates.cpp.o"
	/opt/rocm/bin/hipcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/MathTemplates.cpp.o -c /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/MathTemplates.cpp

CMakeFiles/client.dir/MathTemplates.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/MathTemplates.cpp.i"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/MathTemplates.cpp > CMakeFiles/client.dir/MathTemplates.cpp.i

CMakeFiles/client.dir/MathTemplates.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/MathTemplates.cpp.s"
	/opt/rocm/bin/hipcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source/MathTemplates.cpp -o CMakeFiles/client.dir/MathTemplates.cpp.s

CMakeFiles/client.dir/MathTemplates.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/MathTemplates.cpp.o.requires

CMakeFiles/client.dir/MathTemplates.cpp.o.provides: CMakeFiles/client.dir/MathTemplates.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/MathTemplates.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/MathTemplates.cpp.o.provides

CMakeFiles/client.dir/MathTemplates.cpp.o.provides.build: CMakeFiles/client.dir/MathTemplates.cpp.o


# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/Client.cpp.o" \
"CMakeFiles/client.dir/MathTemplates.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

client: CMakeFiles/client.dir/Client.cpp.o
client: CMakeFiles/client.dir/MathTemplates.cpp.o
client: CMakeFiles/client.dir/build.make
client: /opt/rocm/lib/libhsa-runtime64.so
client: libTensile.a
client: /opt/rocm/lib/libhsa-runtime64.so
client: CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/client.dir/build: client

.PHONY : CMakeFiles/client.dir/build

CMakeFiles/client.dir/requires: CMakeFiles/client.dir/Client.cpp.o.requires
CMakeFiles/client.dir/requires: CMakeFiles/client.dir/MathTemplates.cpp.o.requires

.PHONY : CMakeFiles/client.dir/requires

CMakeFiles/client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/client.dir/clean

CMakeFiles/client.dir/depend:
	cd /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/source /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build /home/htony/Source/Tensile/4_MFMA/Tensile/build-64x64-DU8-PLR-PGR-GM8/4_LibraryClient/build/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/client.dir/depend

