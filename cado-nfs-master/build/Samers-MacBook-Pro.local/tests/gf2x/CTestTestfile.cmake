# CMake generated Testfile for 
# Source directory: /Users/samernajjar/Desktop/cado-nfs-master/tests/gf2x
# Build directory: /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/gf2x
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(builddep_test_cantor "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_cantor_dependencies")
add_test(test_cantor "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/gf2x" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/gf2x" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/gf2x/test_cantor" "100000")
set_tests_properties(test_cantor PROPERTIES  DEPENDS "builddep_test_cantor" SKIP_RETURN_CODE "125")
