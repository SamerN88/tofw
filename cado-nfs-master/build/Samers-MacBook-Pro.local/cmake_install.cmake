# Install script for directory: /Users/samernajjar/Desktop/cado-nfs-master

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cado-nfs-3.0.0" TYPE DIRECTORY FILES "/Users/samernajjar/Desktop/cado-nfs-master/parameters/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cado-nfs.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/cado-nfs-client.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cado-nfs-3.0.0/scripts" TYPE PROGRAM FILES "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/scripts/descent.py")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/utils/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/polyselect/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/sieve/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/sqrt/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/filter/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/linalg/bwc/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/cmake_install.cmake")
  include("/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/scripts/cadofactor/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
