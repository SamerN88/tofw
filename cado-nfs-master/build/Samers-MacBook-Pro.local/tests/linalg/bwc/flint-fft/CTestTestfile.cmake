# CMake generated Testfile for 
# Source directory: /Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/flint-fft
# Build directory: /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(builddep_test_transform_length "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_transform_length_dependencies")
add_test(test_transform_length "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/flint-fft" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft/test_transform_length")
set_tests_properties(test_transform_length PROPERTIES  DEPENDS "builddep_test_transform_length" SKIP_RETURN_CODE "125")
add_test(builddep_test-flint "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test-flint_dependencies")
add_test(builddep_test-flint_mul0 "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test-flint_mul0_dependencies")
add_test(test-flint_mul0 "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/flint-fft" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft/test-flint" "mul0" "-s" "20000")
set_tests_properties(test-flint_mul0 PROPERTIES  DEPENDS "builddep_test-flint_mul0" SKIP_RETURN_CODE "125")
add_test(builddep_test-flint_mul "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test-flint_mul_dependencies")
add_test(test-flint_mul "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/flint-fft" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft/test-flint" "mul")
set_tests_properties(test-flint_mul PROPERTIES  DEPENDS "builddep_test-flint_mul" SKIP_RETURN_CODE "125")
add_test(builddep_test-flint_mul_fppol "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test-flint_mul_fppol_dependencies")
add_test(test-flint_mul_fppol "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/flint-fft" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft/test-flint" "mul_fppol")
set_tests_properties(test-flint_mul_fppol PROPERTIES  DEPENDS "builddep_test-flint_mul_fppol" SKIP_RETURN_CODE "125")
add_test(builddep_test-flint_mp_fppol "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test-flint_mp_fppol_dependencies")
add_test(test-flint_mp_fppol "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/linalg/bwc/flint-fft" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/linalg/bwc/flint-fft/test-flint" "mp_fppol")
set_tests_properties(test-flint_mp_fppol PROPERTIES  DEPENDS "builddep_test-flint_mp_fppol" SKIP_RETURN_CODE "125")
