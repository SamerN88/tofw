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
include misc/CMakeFiles/check_rels.dir/depend.make

# Include the progress variables for this target.
include misc/CMakeFiles/check_rels.dir/progress.make

# Include the compile flags for this target's objects.
include misc/CMakeFiles/check_rels.dir/flags.make

misc/CMakeFiles/check_rels.dir/check_rels.c.o: misc/CMakeFiles/check_rels.dir/flags.make
misc/CMakeFiles/check_rels.dir/check_rels.c.o: ../../misc/check_rels.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object misc/CMakeFiles/check_rels.dir/check_rels.c.o"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/check_rels.dir/check_rels.c.o   -c /Users/samernajjar/Desktop/cado-nfs-master/misc/check_rels.c

misc/CMakeFiles/check_rels.dir/check_rels.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/check_rels.dir/check_rels.c.i"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/samernajjar/Desktop/cado-nfs-master/misc/check_rels.c > CMakeFiles/check_rels.dir/check_rels.c.i

misc/CMakeFiles/check_rels.dir/check_rels.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/check_rels.dir/check_rels.c.s"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc && /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/ccwrap.pl  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/samernajjar/Desktop/cado-nfs-master/misc/check_rels.c -o CMakeFiles/check_rels.dir/check_rels.c.s

misc/CMakeFiles/check_rels.dir/check_rels.c.o.requires:

.PHONY : misc/CMakeFiles/check_rels.dir/check_rels.c.o.requires

misc/CMakeFiles/check_rels.dir/check_rels.c.o.provides: misc/CMakeFiles/check_rels.dir/check_rels.c.o.requires
	$(MAKE) -f misc/CMakeFiles/check_rels.dir/build.make misc/CMakeFiles/check_rels.dir/check_rels.c.o.provides.build
.PHONY : misc/CMakeFiles/check_rels.dir/check_rels.c.o.provides

misc/CMakeFiles/check_rels.dir/check_rels.c.o.provides.build: misc/CMakeFiles/check_rels.dir/check_rels.c.o


# Object files for target check_rels
check_rels_OBJECTS = \
"CMakeFiles/check_rels.dir/check_rels.c.o"

# External object files for target check_rels
check_rels_EXTERNAL_OBJECTS =

misc/check_rels: misc/CMakeFiles/check_rels.dir/check_rels.c.o
misc/check_rels: misc/CMakeFiles/check_rels.dir/build.make
misc/check_rels: utils/libutils_with_io.a
misc/check_rels: utils/libutils.a
misc/check_rels: misc/CMakeFiles/check_rels.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable check_rels"
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/check_rels.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
misc/CMakeFiles/check_rels.dir/build: misc/check_rels

.PHONY : misc/CMakeFiles/check_rels.dir/build

misc/CMakeFiles/check_rels.dir/requires: misc/CMakeFiles/check_rels.dir/check_rels.c.o.requires

.PHONY : misc/CMakeFiles/check_rels.dir/requires

misc/CMakeFiles/check_rels.dir/clean:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc && $(CMAKE_COMMAND) -P CMakeFiles/check_rels.dir/cmake_clean.cmake
.PHONY : misc/CMakeFiles/check_rels.dir/clean

misc/CMakeFiles/check_rels.dir/depend:
	cd /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/samernajjar/Desktop/cado-nfs-master /Users/samernajjar/Desktop/cado-nfs-master/misc /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/CMakeFiles/check_rels.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : misc/CMakeFiles/check_rels.dir/depend

