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
include polyselect/CMakeFiles/polyselect3.dir/depend.make

# Include the progress variables for this target.
include polyselect/CMakeFiles/polyselect3.dir/progress.make

# Include the compile flags for this target's objects.
include polyselect/CMakeFiles/polyselect3.dir/flags.make

polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o: polyselect/CMakeFiles/polyselect3.dir/flags.make
polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o: ../../polyselect/polyselect3.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/polyselect3.dir/polyselect3.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/polyselect/polyselect3.c

polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/polyselect3.dir/polyselect3.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/polyselect/polyselect3.c > CMakeFiles/polyselect3.dir/polyselect3.c.i

polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/polyselect3.dir/polyselect3.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/polyselect/polyselect3.c -o CMakeFiles/polyselect3.dir/polyselect3.c.s

polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.requires:

.PHONY : polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.requires

polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.provides: polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.requires
	$(MAKE) -f polyselect/CMakeFiles/polyselect3.dir/build.make polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.provides.build
.PHONY : polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.provides

polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.provides.build: polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o


# Object files for target polyselect3
polyselect3_OBJECTS = \
"CMakeFiles/polyselect3.dir/polyselect3.c.o"

# External object files for target polyselect3
polyselect3_EXTERNAL_OBJECTS =

polyselect/polyselect3: polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o
polyselect/polyselect3: polyselect/CMakeFiles/polyselect3.dir/build.make
polyselect/polyselect3: polyselect/libpolyselect_common.a
polyselect/polyselect3: utils/libutils.a
polyselect/polyselect3: polyselect/CMakeFiles/polyselect3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable polyselect3"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/polyselect3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
polyselect/CMakeFiles/polyselect3.dir/build: polyselect/polyselect3

.PHONY : polyselect/CMakeFiles/polyselect3.dir/build

polyselect/CMakeFiles/polyselect3.dir/requires: polyselect/CMakeFiles/polyselect3.dir/polyselect3.c.o.requires

.PHONY : polyselect/CMakeFiles/polyselect3.dir/requires

polyselect/CMakeFiles/polyselect3.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && $(CMAKE_COMMAND) -P CMakeFiles/polyselect3.dir/cmake_clean.cmake
.PHONY : polyselect/CMakeFiles/polyselect3.dir/clean

polyselect/CMakeFiles/polyselect3.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/polyselect /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect/CMakeFiles/polyselect3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : polyselect/CMakeFiles/polyselect3.dir/depend

