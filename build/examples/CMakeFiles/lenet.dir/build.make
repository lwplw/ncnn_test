# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bu5/bu5project/ncnn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bu5/bu5project/ncnn/build

# Include any dependencies generated for this target.
include examples/CMakeFiles/lenet.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/lenet.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/lenet.dir/flags.make

examples/CMakeFiles/lenet.dir/lenet.cpp.o: examples/CMakeFiles/lenet.dir/flags.make
examples/CMakeFiles/lenet.dir/lenet.cpp.o: ../examples/lenet.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bu5/bu5project/ncnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/lenet.dir/lenet.cpp.o"
	cd /home/bu5/bu5project/ncnn/build/examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lenet.dir/lenet.cpp.o -c /home/bu5/bu5project/ncnn/examples/lenet.cpp

examples/CMakeFiles/lenet.dir/lenet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lenet.dir/lenet.cpp.i"
	cd /home/bu5/bu5project/ncnn/build/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bu5/bu5project/ncnn/examples/lenet.cpp > CMakeFiles/lenet.dir/lenet.cpp.i

examples/CMakeFiles/lenet.dir/lenet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lenet.dir/lenet.cpp.s"
	cd /home/bu5/bu5project/ncnn/build/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bu5/bu5project/ncnn/examples/lenet.cpp -o CMakeFiles/lenet.dir/lenet.cpp.s

examples/CMakeFiles/lenet.dir/lenet.cpp.o.requires:

.PHONY : examples/CMakeFiles/lenet.dir/lenet.cpp.o.requires

examples/CMakeFiles/lenet.dir/lenet.cpp.o.provides: examples/CMakeFiles/lenet.dir/lenet.cpp.o.requires
	$(MAKE) -f examples/CMakeFiles/lenet.dir/build.make examples/CMakeFiles/lenet.dir/lenet.cpp.o.provides.build
.PHONY : examples/CMakeFiles/lenet.dir/lenet.cpp.o.provides

examples/CMakeFiles/lenet.dir/lenet.cpp.o.provides.build: examples/CMakeFiles/lenet.dir/lenet.cpp.o


# Object files for target lenet
lenet_OBJECTS = \
"CMakeFiles/lenet.dir/lenet.cpp.o"

# External object files for target lenet
lenet_EXTERNAL_OBJECTS =

examples/lenet: examples/CMakeFiles/lenet.dir/lenet.cpp.o
examples/lenet: examples/CMakeFiles/lenet.dir/build.make
examples/lenet: src/libncnn.a
examples/lenet: /usr/local/lib/libopencv_highgui.so.3.1.0
examples/lenet: /usr/local/lib/libopencv_imgcodecs.so.3.1.0
examples/lenet: /usr/local/lib/libopencv_imgproc.so.3.1.0
examples/lenet: /usr/local/lib/libopencv_core.so.3.1.0
examples/lenet: examples/CMakeFiles/lenet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bu5/bu5project/ncnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lenet"
	cd /home/bu5/bu5project/ncnn/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lenet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/lenet.dir/build: examples/lenet

.PHONY : examples/CMakeFiles/lenet.dir/build

examples/CMakeFiles/lenet.dir/requires: examples/CMakeFiles/lenet.dir/lenet.cpp.o.requires

.PHONY : examples/CMakeFiles/lenet.dir/requires

examples/CMakeFiles/lenet.dir/clean:
	cd /home/bu5/bu5project/ncnn/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/lenet.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/lenet.dir/clean

examples/CMakeFiles/lenet.dir/depend:
	cd /home/bu5/bu5project/ncnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bu5/bu5project/ncnn /home/bu5/bu5project/ncnn/examples /home/bu5/bu5project/ncnn/build /home/bu5/bu5project/ncnn/build/examples /home/bu5/bu5project/ncnn/build/examples/CMakeFiles/lenet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/lenet.dir/depend

