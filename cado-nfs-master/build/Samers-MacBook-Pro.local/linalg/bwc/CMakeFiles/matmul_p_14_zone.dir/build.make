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
include linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/depend.make

# Include the progress variables for this target.
include linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/progress.make

# Include the compile flags for this target's objects.
include linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/flags.make

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/flags.make
linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o: ../../linalg/bwc/matmul_facade.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/matmul_facade.c

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/matmul_facade.c > CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.i

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/matmul_facade.c -o CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.s

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.requires:

.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.requires

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.provides: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.requires
	$(MAKE) -f linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/build.make linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.provides.build
.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.provides

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.provides.build: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o


linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/flags.make
linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o: ../../linalg/bwc/matmul-zone.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o -c /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/matmul-zone.cpp

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/matmul-zone.cpp > CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.i

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/matmul-zone.cpp -o CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.s

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.requires:

.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.requires

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.provides: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.requires
	$(MAKE) -f linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/build.make linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.provides.build
.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.provides

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.provides.build: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o


# Object files for target matmul_p_14_zone
matmul_p_14_zone_OBJECTS = \
"CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o" \
"CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o"

# External object files for target matmul_p_14_zone
matmul_p_14_zone_EXTERNAL_OBJECTS =

linalg/bwc/libmatmul_p_14_zone.a: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o
linalg/bwc/libmatmul_p_14_zone.a: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o
linalg/bwc/libmatmul_p_14_zone.a: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/build.make
linalg/bwc/libmatmul_p_14_zone.a: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libmatmul_p_14_zone.a"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && $(CMAKE_COMMAND) -P CMakeFiles/matmul_p_14_zone.dir/cmake_clean_target.cmake
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matmul_p_14_zone.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/build: linalg/bwc/libmatmul_p_14_zone.a

.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/build

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/requires: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul_facade.c.o.requires
linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/requires: linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/matmul-zone.cpp.o.requires

.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/requires

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc && $(CMAKE_COMMAND) -P CMakeFiles/matmul_p_14_zone.dir/cmake_clean.cmake
.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/clean

linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : linalg/bwc/CMakeFiles/matmul_p_14_zone.dir/depend

