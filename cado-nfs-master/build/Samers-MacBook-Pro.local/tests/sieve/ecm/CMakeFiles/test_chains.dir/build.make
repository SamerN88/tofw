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
include tests/sieve/ecm/CMakeFiles/test_chains.dir/depend.make

# Include the progress variables for this target.
include tests/sieve/ecm/CMakeFiles/test_chains.dir/progress.make

# Include the compile flags for this target's objects.
include tests/sieve/ecm/CMakeFiles/test_chains.dir/flags.make

tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o: tests/sieve/ecm/CMakeFiles/test_chains.dir/flags.make
tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o: ../../tests/sieve/ecm/test_chains.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_chains.dir/test_chains.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/ecm/test_chains.c

tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_chains.dir/test_chains.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/ecm/test_chains.c > CMakeFiles/test_chains.dir/test_chains.c.i

tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_chains.dir/test_chains.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/ecm/test_chains.c -o CMakeFiles/test_chains.dir/test_chains.c.s

tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.requires:

.PHONY : tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.requires

tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.provides: tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.requires
	$(MAKE) -f tests/sieve/ecm/CMakeFiles/test_chains.dir/build.make tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.provides.build
.PHONY : tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.provides

tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.provides.build: tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o


# Object files for target test_chains
test_chains_OBJECTS = \
"CMakeFiles/test_chains.dir/test_chains.c.o"

# External object files for target test_chains
test_chains_EXTERNAL_OBJECTS =

tests/sieve/ecm/test_chains: tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o
tests/sieve/ecm/test_chains: tests/sieve/ecm/CMakeFiles/test_chains.dir/build.make
tests/sieve/ecm/test_chains: tests/libtests.a
tests/sieve/ecm/test_chains: sieve/ecm/libfacul.a
tests/sieve/ecm/test_chains: utils/libutils.a
tests/sieve/ecm/test_chains: tests/sieve/ecm/CMakeFiles/test_chains.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_chains"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_chains.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/sieve/ecm/CMakeFiles/test_chains.dir/build: tests/sieve/ecm/test_chains

.PHONY : tests/sieve/ecm/CMakeFiles/test_chains.dir/build

tests/sieve/ecm/CMakeFiles/test_chains.dir/requires: tests/sieve/ecm/CMakeFiles/test_chains.dir/test_chains.c.o.requires

.PHONY : tests/sieve/ecm/CMakeFiles/test_chains.dir/requires

tests/sieve/ecm/CMakeFiles/test_chains.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm && $(CMAKE_COMMAND) -P CMakeFiles/test_chains.dir/cmake_clean.cmake
.PHONY : tests/sieve/ecm/CMakeFiles/test_chains.dir/clean

tests/sieve/ecm/CMakeFiles/test_chains.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/ecm /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/ecm/CMakeFiles/test_chains.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/sieve/ecm/CMakeFiles/test_chains.dir/depend

