# CMake generated Testfile for 
# Source directory: /Users/samernajjar/Desktop/cado-nfs-master/tests/estimate_matsize
# Build directory: /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/estimate_matsize
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(builddep_estimate_matsize "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "estimate_matsize_dependencies")
add_test(builddep_estimate_matsize_p30 "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "estimate_matsize_p30_dependencies")
add_test(estimate_matsize_p30 "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/estimate_matsize" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/estimate_matsize" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CADO_BUILD=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CADO_SOURCE=/Users/samernajjar/Desktop/cado-nfs-master" "env" "bash" "/Users/samernajjar/Desktop/cado-nfs-master/scripts/estimate_matsize/estimate_matsize.sh" "-params" "/Users/samernajjar/Desktop/cado-nfs-master/tests/estimate_matsize/p30.ems.params" "/Users/samernajjar/Desktop/cado-nfs-master/tests/estimate_matsize/p30.poly")
set_tests_properties(estimate_matsize_p30 PROPERTIES  DEPENDS "builddep_estimate_matsize_p30" SKIP_RETURN_CODE "125")
