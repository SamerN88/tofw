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
include tests/sieve/CMakeFiles/test_trialdiv.dir/depend.make

# Include the progress variables for this target.
include tests/sieve/CMakeFiles/test_trialdiv.dir/progress.make

# Include the compile flags for this target's objects.
include tests/sieve/CMakeFiles/test_trialdiv.dir/flags.make

tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o: tests/sieve/CMakeFiles/test_trialdiv.dir/flags.make
tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o: ../../tests/sieve/test_trialdiv.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o -c /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/test_trialdiv.cpp

tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/test_trialdiv.cpp > CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.i

tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cxxwrap.pl  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/test_trialdiv.cpp -o CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.s

tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.requires:

.PHONY : tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.requires

tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.provides: tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.requires
	$(MAKE) -f tests/sieve/CMakeFiles/test_trialdiv.dir/build.make tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.provides.build
.PHONY : tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.provides

tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.provides.build: tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o


# Object files for target test_trialdiv
test_trialdiv_OBJECTS = \
"CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o"

# External object files for target test_trialdiv
test_trialdiv_EXTERNAL_OBJECTS = \
"/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/sieve/CMakeFiles/trialdiv.dir/trialdiv.cpp.o"

tests/sieve/test_trialdiv: tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o
tests/sieve/test_trialdiv: sieve/CMakeFiles/trialdiv.dir/trialdiv.cpp.o
tests/sieve/test_trialdiv: tests/sieve/CMakeFiles/test_trialdiv.dir/build.make
tests/sieve/test_trialdiv: utils/libutils.a
tests/sieve/test_trialdiv: tests/libtests.a
tests/sieve/test_trialdiv: tests/sieve/CMakeFiles/test_trialdiv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_trialdiv"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_trialdiv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/sieve/CMakeFiles/test_trialdiv.dir/build: tests/sieve/test_trialdiv

.PHONY : tests/sieve/CMakeFiles/test_trialdiv.dir/build

tests/sieve/CMakeFiles/test_trialdiv.dir/requires: tests/sieve/CMakeFiles/test_trialdiv.dir/test_trialdiv.cpp.o.requires

.PHONY : tests/sieve/CMakeFiles/test_trialdiv.dir/requires

tests/sieve/CMakeFiles/test_trialdiv.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve && $(CMAKE_COMMAND) -P CMakeFiles/test_trialdiv.dir/cmake_clean.cmake
.PHONY : tests/sieve/CMakeFiles/test_trialdiv.dir/clean

tests/sieve/CMakeFiles/test_trialdiv.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/CMakeFiles/test_trialdiv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/sieve/CMakeFiles/test_trialdiv.dir/depend

