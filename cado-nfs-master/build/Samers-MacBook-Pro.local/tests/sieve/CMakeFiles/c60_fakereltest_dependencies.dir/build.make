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

# Utility rule file for c60_fakereltest_dependencies.

# Include the progress variables for this target.
include tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/progress.make

c60_fakereltest_dependencies: tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/build.make

.PHONY : c60_fakereltest_dependencies

# Rule to build all files generated by this target.
tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/build: c60_fakereltest_dependencies

.PHONY : tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/build

tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve && $(CMAKE_COMMAND) -P CMakeFiles/c60_fakereltest_dependencies.dir/cmake_clean.cmake
.PHONY : tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/clean

tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/sieve/CMakeFiles/c60_fakereltest_dependencies.dir/depend

