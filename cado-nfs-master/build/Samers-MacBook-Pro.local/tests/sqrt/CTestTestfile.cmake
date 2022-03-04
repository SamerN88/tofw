# CMake generated Testfile for 
# Source directory: /Users/samernajjar/Desktop/cado-nfs-master/tests/sqrt
# Build directory: /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sqrt
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(builddep_test_crtalgsqrt "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_crtalgsqrt_dependencies")
add_test(test_crtalgsqrt "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/sqrt" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sqrt" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "env" "bash" "/Users/samernajjar/Desktop/cado-nfs-master/tests/do_with_mpi.sh" "nompi" "/Users/samernajjar/Desktop/cado-nfs-master/tests/sqrt/test_crtalgsqrt.sh" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/sqrt/crtalgsqrt" "/Users/samernajjar/Desktop/cado-nfs-master/tests/sqrt/c30.dep.000" "/Users/samernajjar/Desktop/cado-nfs-master/tests/sqrt/c30.ratdep.000" "/Users/samernajjar/Desktop/cado-nfs-master/tests/sqrt/c30.poly")
set_tests_properties(test_crtalgsqrt PROPERTIES  DEPENDS "builddep_test_crtalgsqrt" SKIP_RETURN_CODE "125")
