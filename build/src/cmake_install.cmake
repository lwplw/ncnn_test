# Install script for directory: /home/bu5/bu5project/ncnn/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/bu5/bu5project/ncnn/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/bu5/bu5project/ncnn/build/src/libncnn.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/bu5/bu5project/ncnn/src/allocator.h"
    "/home/bu5/bu5project/ncnn/src/blob.h"
    "/home/bu5/bu5project/ncnn/src/cpu.h"
    "/home/bu5/bu5project/ncnn/src/layer.h"
    "/home/bu5/bu5project/ncnn/src/layer_type.h"
    "/home/bu5/bu5project/ncnn/src/mat.h"
    "/home/bu5/bu5project/ncnn/src/modelbin.h"
    "/home/bu5/bu5project/ncnn/src/net.h"
    "/home/bu5/bu5project/ncnn/src/opencv.h"
    "/home/bu5/bu5project/ncnn/src/paramdict.h"
    "/home/bu5/bu5project/ncnn/src/benchmark.h"
    "/home/bu5/bu5project/ncnn/build/src/layer_type_enum.h"
    "/home/bu5/bu5project/ncnn/build/src/platform.h"
    )
endif()

