# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.4

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
CMAKE_COMMAND = /Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake

# The command to remove a file.
RM = /Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/samernajjar/Desktop/cado-nfs-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP

# Include any dependencies generated for this target.
include utils/CMakeFiles/badideals.dir/depend.make

# Include the progress variables for this target.
include utils/CMakeFiles/badideals.dir/progress.make

# Include the compile flags for this target's objects.
include utils/CMakeFiles/badideals.dir/flags.make

utils/CMakeFiles/badideals.dir/badideals_main.cpp.o: utils/CMakeFiles/badideals.dir/flags.make
utils/CMakeFiles/badideals.dir/badideals_main.cpp.o: ../../utils/badideals_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object utils/CMakeFiles/badideals.dir/badideals_main.cpp.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/badideals.dir/badideals_main.cpp.o -c /Users/samernajjar/Desktop/cado-nfs-master/utils/badideals_main.cpp

utils/CMakeFiles/badideals.dir/badideals_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/badideals.dir/badideals_main.cpp.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/utils/badideals_main.cpp > CMakeFiles/badideals.dir/badideals_main.cpp.i

utils/CMakeFiles/badideals.dir/badideals_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/badideals.dir/badideals_main.cpp.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/utils/badideals_main.cpp -o CMakeFiles/badideals.dir/badideals_main.cpp.s

utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.requires:

.PHONY : utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.requires

utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.provides: utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.requires
	$(MAKE) -f utils/CMakeFiles/badideals.dir/build.make utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.provides.build
.PHONY : utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.provides

utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.provides.build: utils/CMakeFiles/badideals.dir/badideals_main.cpp.o


# Object files for target badideals
badideals_OBJECTS = \
"CMakeFiles/badideals.dir/badideals_main.cpp.o"

# External object files for target badideals
badideals_EXTERNAL_OBJECTS =

utils/badideals: utils/CMakeFiles/badideals.dir/badideals_main.cpp.o
utils/badideals: utils/CMakeFiles/badideals.dir/build.make
utils/badideals: utils/libutils.a
utils/badideals: utils/CMakeFiles/badideals.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable badideals"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/badideals.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/CMakeFiles/badideals.dir/build: utils/badideals

.PHONY : utils/CMakeFiles/badideals.dir/build

utils/CMakeFiles/badideals.dir/requires: utils/CMakeFiles/badideals.dir/badideals_main.cpp.o.requires

.PHONY : utils/CMakeFiles/badideals.dir/requires

utils/CMakeFiles/badideals.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils && $(CMAKE_COMMAND) -P CMakeFiles/badideals.dir/cmake_clean.cmake
.PHONY : utils/CMakeFiles/badideals.dir/clean

utils/CMakeFiles/badideals.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/utils /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils/CMakeFiles/badideals.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/CMakeFiles/badideals.dir/depend

