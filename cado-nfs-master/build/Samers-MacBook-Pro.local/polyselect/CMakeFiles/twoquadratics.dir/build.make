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
include polyselect/CMakeFiles/twoquadratics.dir/depend.make

# Include the progress variables for this target.
include polyselect/CMakeFiles/twoquadratics.dir/progress.make

# Include the compile flags for this target's objects.
include polyselect/CMakeFiles/twoquadratics.dir/flags.make

polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o: polyselect/CMakeFiles/twoquadratics.dir/flags.make
polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o: ../../polyselect/twoquadratics.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/twoquadratics.dir/twoquadratics.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/polyselect/twoquadratics.c

polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/twoquadratics.dir/twoquadratics.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/polyselect/twoquadratics.c > CMakeFiles/twoquadratics.dir/twoquadratics.c.i

polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/twoquadratics.dir/twoquadratics.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/polyselect/twoquadratics.c -o CMakeFiles/twoquadratics.dir/twoquadratics.c.s

polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.requires:

.PHONY : polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.requires

polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.provides: polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.requires
	$(MAKE) -f polyselect/CMakeFiles/twoquadratics.dir/build.make polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.provides.build
.PHONY : polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.provides

polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.provides.build: polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o


# Object files for target twoquadratics
twoquadratics_OBJECTS = \
"CMakeFiles/twoquadratics.dir/twoquadratics.c.o"

# External object files for target twoquadratics
twoquadratics_EXTERNAL_OBJECTS =

polyselect/twoquadratics: polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o
polyselect/twoquadratics: polyselect/CMakeFiles/twoquadratics.dir/build.make
polyselect/twoquadratics: polyselect/libpolyselect_common.a
polyselect/twoquadratics: utils/libutils.a
polyselect/twoquadratics: polyselect/CMakeFiles/twoquadratics.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable twoquadratics"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/twoquadratics.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
polyselect/CMakeFiles/twoquadratics.dir/build: polyselect/twoquadratics

.PHONY : polyselect/CMakeFiles/twoquadratics.dir/build

polyselect/CMakeFiles/twoquadratics.dir/requires: polyselect/CMakeFiles/twoquadratics.dir/twoquadratics.c.o.requires

.PHONY : polyselect/CMakeFiles/twoquadratics.dir/requires

polyselect/CMakeFiles/twoquadratics.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect && $(CMAKE_COMMAND) -P CMakeFiles/twoquadratics.dir/cmake_clean.cmake
.PHONY : polyselect/CMakeFiles/twoquadratics.dir/clean

polyselect/CMakeFiles/twoquadratics.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/polyselect /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect/CMakeFiles/twoquadratics.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : polyselect/CMakeFiles/twoquadratics.dir/depend

