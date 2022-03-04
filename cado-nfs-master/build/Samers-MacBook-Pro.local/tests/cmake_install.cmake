# Install script for directory: /Users/samernajjar/Desktop/cado-nfs-master/tests

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/samernajjar/Desktop/cado-nfs-master/installed")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/scripts/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/utils/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/polyselect/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/filter/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/estimate_matsize/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/gf2x/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sqrt/cmake_install.cmake")

endif()

