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
include tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/depend.make

# Include the progress variables for this target.
include tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/progress.make

# Include the compile flags for this target's objects.
include tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/flags.make

tests/linalg/bwc/mpfq/mpfq_test_pz.cpp: ../../tests/linalg/bwc/mpfq/mpfq_test.cpp.meta
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating mpfq_test_pz.cpp"
	cd /Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/mpfq && sed -e '1 s/^.*toplevel include.*/#include "cado.h"/' -e 's/TAG/pz/g' -e 's,PATH_TO_SRC_TEST_DIRECTORY,/Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/mpfq/,' -e 's/^#warning.*//' -e 's/^#define _POSIX_C_SOURCE.*//' -e 's/^#define _GNU_SOURCE.*//' -e 's/^#define _BSD_SOURCE.*//' -e 's/^#define _DEFAULT_SOURCE.*//' < mpfq_test.cpp.meta > /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq/mpfq_test_pz.cpp

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/flags.make
tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o: tests/linalg/bwc/mpfq/mpfq_test_pz.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o -c /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq/mpfq_test_pz.cpp

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq/mpfq_test_pz.cpp > CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.i

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq/mpfq_test_pz.cpp -o CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.s

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.requires:

.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.requires

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.provides: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.requires
	$(MAKE) -f tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/build.make tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.provides.build
.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.provides

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.provides.build: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o


tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/flags.make
tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o: ../../linalg/bwc/mpfq/mpfq_pz.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/mpfq/mpfq_pz.c

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/mpfq/mpfq_pz.c > CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.i

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/linalg/bwc/mpfq/mpfq_pz.c -o CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.s

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.requires:

.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.requires

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.provides: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.requires
	$(MAKE) -f tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/build.make tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.provides.build
.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.provides

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.provides.build: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o


# Object files for target mpfq_test_pz
mpfq_test_pz_OBJECTS = \
"CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o" \
"CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o"

# External object files for target mpfq_test_pz
mpfq_test_pz_EXTERNAL_OBJECTS =

tests/linalg/bwc/mpfq/mpfq_test_pz: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o
tests/linalg/bwc/mpfq/mpfq_test_pz: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o
tests/linalg/bwc/mpfq/mpfq_test_pz: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/build.make
tests/linalg/bwc/mpfq/mpfq_test_pz: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable mpfq_test_pz"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mpfq_test_pz.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/build: tests/linalg/bwc/mpfq/mpfq_test_pz

.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/build

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/requires: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/mpfq_test_pz.cpp.o.requires
tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/requires: tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/__/__/__/__/linalg/bwc/mpfq/mpfq_pz.c.o.requires

.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/requires

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq && $(CMAKE_COMMAND) -P CMakeFiles/mpfq_test_pz.dir/cmake_clean.cmake
.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/clean

tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/depend: tests/linalg/bwc/mpfq/mpfq_test_pz.cpp
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/mpfq /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/linalg/bwc/mpfq/CMakeFiles/mpfq_test_pz.dir/depend

