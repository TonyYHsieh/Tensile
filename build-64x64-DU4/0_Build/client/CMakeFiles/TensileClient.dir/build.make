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
CMAKE_BINARY_DIR = /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build

# Include any dependencies generated for this target.
include client/CMakeFiles/TensileClient.dir/depend.make

# Include the progress variables for this target.
include client/CMakeFiles/TensileClient.dir/progress.make

# Include the compile flags for this target's objects.
include client/CMakeFiles/TensileClient.dir/flags.make

client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/BenchmarkTimer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/BenchmarkTimer.cpp

client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/BenchmarkTimer.cpp > CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.i

client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/BenchmarkTimer.cpp -o CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.s

client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o


client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/CSVStackFile.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/CSVStackFile.cpp

client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/CSVStackFile.cpp > CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.i

client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/CSVStackFile.cpp -o CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.s

client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o


client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ClientProblemFactory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ClientProblemFactory.cpp

client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ClientProblemFactory.cpp > CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.i

client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ClientProblemFactory.cpp -o CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.s

client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o


client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/DataInitialization.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/DataInitialization.cpp

client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/DataInitialization.cpp > CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.i

client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/DataInitialization.cpp -o CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.s

client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o


client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitor.cpp

client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitor.cpp > CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.i

client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitor.cpp -o CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.s

client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o


client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitorListener.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitorListener.cpp

client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitorListener.cpp > CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.i

client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/HardwareMonitorListener.cpp -o CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.s

client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o


client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/MetaRunListener.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/MetaRunListener.cpp

client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/MetaRunListener.cpp > CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.i

client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/MetaRunListener.cpp -o CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.s

client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o


client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ProgressListener.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ProgressListener.cpp

client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ProgressListener.cpp > CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.i

client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ProgressListener.cpp -o CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.s

client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o


client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/Reference.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/Reference.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/Reference.cpp

client/CMakeFiles/TensileClient.dir/source/Reference.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/Reference.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/Reference.cpp > CMakeFiles/TensileClient.dir/source/Reference.cpp.i

client/CMakeFiles/TensileClient.dir/source/Reference.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/Reference.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/Reference.cpp -o CMakeFiles/TensileClient.dir/source/Reference.cpp.s

client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o


client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ReferenceValidator.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ReferenceValidator.cpp

client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ReferenceValidator.cpp > CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.i

client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ReferenceValidator.cpp -o CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.s

client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o


client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ResultFileReporter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ResultFileReporter.cpp

client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ResultFileReporter.cpp > CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.i

client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/ResultFileReporter.cpp -o CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.s

client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o


client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o: client/CMakeFiles/TensileClient.dir/flags.make
client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o: /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/TimingEvents.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o -c /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/TimingEvents.cpp

client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.i"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/TimingEvents.cpp > CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.i

client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.s"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && /opt/rocm/bin/hcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client/source/TimingEvents.cpp -o CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.s

client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.requires:

.PHONY : client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.requires

client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.provides: client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.requires
	$(MAKE) -f client/CMakeFiles/TensileClient.dir/build.make client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.provides.build
.PHONY : client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.provides

client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.provides.build: client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o


# Object files for target TensileClient
TensileClient_OBJECTS = \
"CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o" \
"CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o" \
"CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o" \
"CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o" \
"CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o" \
"CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o" \
"CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o" \
"CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o" \
"CMakeFiles/TensileClient.dir/source/Reference.cpp.o" \
"CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o" \
"CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o" \
"CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o"

# External object files for target TensileClient
TensileClient_EXTERNAL_OBJECTS =

client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/build.make
client/libTensileClient.a: client/CMakeFiles/TensileClient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX static library libTensileClient.a"
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && $(CMAKE_COMMAND) -P CMakeFiles/TensileClient.dir/cmake_clean_target.cmake
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TensileClient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
client/CMakeFiles/TensileClient.dir/build: client/libTensileClient.a

.PHONY : client/CMakeFiles/TensileClient.dir/build

client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/BenchmarkTimer.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/CSVStackFile.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/ClientProblemFactory.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/DataInitialization.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/HardwareMonitor.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/HardwareMonitorListener.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/MetaRunListener.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/ProgressListener.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/Reference.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/ReferenceValidator.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/ResultFileReporter.cpp.o.requires
client/CMakeFiles/TensileClient.dir/requires: client/CMakeFiles/TensileClient.dir/source/TimingEvents.cpp.o.requires

.PHONY : client/CMakeFiles/TensileClient.dir/requires

client/CMakeFiles/TensileClient.dir/clean:
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client && $(CMAKE_COMMAND) -P CMakeFiles/TensileClient.dir/cmake_clean.cmake
.PHONY : client/CMakeFiles/TensileClient.dir/clean

client/CMakeFiles/TensileClient.dir/depend:
	cd /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source /home/htony/Source/Tensile/3_MFMA/Tensile/Tensile/Source/client /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client /home/htony/Source/Tensile/3_MFMA/Tensile/build-64x64-DU4/0_Build/client/CMakeFiles/TensileClient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : client/CMakeFiles/TensileClient.dir/depend

