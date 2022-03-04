# CMake generated Testfile for 
# Source directory: /Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/strategies
# Build directory: /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(builddep_test_generate_composite_numbers "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_generate_composite_numbers_dependencies")
add_test(test_generate_composite_numbers "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/strategies" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies/test_generate_composite_numbers")
set_tests_properties(test_generate_composite_numbers PROPERTIES  DEPENDS "builddep_test_generate_composite_numbers" SKIP_RETURN_CODE "125")
add_test(builddep_test_generate_strategies "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_generate_strategies_dependencies")
add_test(test_generate_strategies "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/strategies" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies/test_generate_strategies")
set_tests_properties(test_generate_strategies PROPERTIES  DEPENDS "builddep_test_generate_strategies" SKIP_RETURN_CODE "125")
add_test(builddep_test_filtering "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_filtering_dependencies")
add_test(test_filtering "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/strategies" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies/test_filtering")
set_tests_properties(test_filtering PROPERTIES  DEPENDS "builddep_test_filtering" SKIP_RETURN_CODE "125")
add_test(builddep_test_benchfm "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_benchfm_dependencies")
add_test(test_benchfm "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/sieve/strategies" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/sieve/strategies/test_benchfm")
set_tests_properties(test_benchfm PROPERTIES  DEPENDS "builddep_test_benchfm" SKIP_RETURN_CODE "125")
subdirs(utils_st)
