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
include tests/utils/CMakeFiles/test_mpz_vector.dir/depend.make

# Include the progress variables for this target.
include tests/utils/CMakeFiles/test_mpz_vector.dir/progress.make

# Include the compile flags for this target's objects.
include tests/utils/CMakeFiles/test_mpz_vector.dir/flags.make

tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o: tests/utils/CMakeFiles/test_mpz_vector.dir/flags.make
tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o: ../../tests/utils/test_mpz_vector.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/tests/utils/test_mpz_vector.c

tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/tests/utils/test_mpz_vector.c > CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.i

tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/tests/utils/test_mpz_vector.c -o CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.s

tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.requires:

.PHONY : tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.requires

tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.provides: tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.requires
	$(MAKE) -f tests/utils/CMakeFiles/test_mpz_vector.dir/build.make tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.provides.build
.PHONY : tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.provides

tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.provides.build: tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o


# Object files for target test_mpz_vector
test_mpz_vector_OBJECTS = \
"CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o"

# External object files for target test_mpz_vector
test_mpz_vector_EXTERNAL_OBJECTS =

tests/utils/test_mpz_vector: tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o
tests/utils/test_mpz_vector: tests/utils/CMakeFiles/test_mpz_vector.dir/build.make
tests/utils/test_mpz_vector: utils/libutils.a
tests/utils/test_mpz_vector: tests/utils/CMakeFiles/test_mpz_vector.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_mpz_vector"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_mpz_vector.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/utils/CMakeFiles/test_mpz_vector.dir/build: tests/utils/test_mpz_vector

.PHONY : tests/utils/CMakeFiles/test_mpz_vector.dir/build

tests/utils/CMakeFiles/test_mpz_vector.dir/requires: tests/utils/CMakeFiles/test_mpz_vector.dir/test_mpz_vector.c.o.requires

.PHONY : tests/utils/CMakeFiles/test_mpz_vector.dir/requires

tests/utils/CMakeFiles/test_mpz_vector.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils && $(CMAKE_COMMAND) -P CMakeFiles/test_mpz_vector.dir/cmake_clean.cmake
.PHONY : tests/utils/CMakeFiles/test_mpz_vector.dir/clean

tests/utils/CMakeFiles/test_mpz_vector.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/tests/utils /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils/CMakeFiles/test_mpz_vector.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/utils/CMakeFiles/test_mpz_vector.dir/depend

