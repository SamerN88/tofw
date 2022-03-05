# CMake generated Testfile for 
# Source directory: /Users/samernajjar/Desktop/cado-nfs-master/tests/misc
# Build directory: /Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(builddep_testcheck_rels "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "testcheck_rels_dependencies")
add_test(testcheck_rels "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/misc" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "env" "bash" "/Users/samernajjar/Desktop/cado-nfs-master/tests/misc/testcheck_rels.sh" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/check_rels")
set_tests_properties(testcheck_rels PROPERTIES  DEPENDS "builddep_testcheck_rels" SKIP_RETURN_CODE "125")
add_test(builddep_test_renumber_on_the_fly_mnfsdl "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_renumber_on_the_fly_mnfsdl_dependencies")
add_test(test_renumber_on_the_fly_mnfsdl "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/misc" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/debug_renumber" "-poly" "/Users/samernajjar/Desktop/cado-nfs-master/tests/misc/test_renumber.data/mnfs5.poly" "-lpbs" "11,10,10,10,10" "-lcideals" "-check" "-build" "-quiet")
set_tests_properties(test_renumber_on_the_fly_mnfsdl PROPERTIES  DEPENDS "builddep_test_renumber_on_the_fly_mnfsdl" SKIP_RETURN_CODE "125")
add_test(builddep_test_renumber_on_the_fly_snfs "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_renumber_on_the_fly_snfs_dependencies")
add_test(test_renumber_on_the_fly_snfs "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/misc" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/debug_renumber" "-poly" "/Users/samernajjar/Desktop/cado-nfs-master/parameters/polynomials/F9.poly" "-lpbs" "10,10" "-check" "-build" "-quiet")
set_tests_properties(test_renumber_on_the_fly_snfs PROPERTIES  DEPENDS "builddep_test_renumber_on_the_fly_snfs" SKIP_RETURN_CODE "125")
add_test(builddep_test_renumber_on_the_fly_gnfs "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_renumber_on_the_fly_gnfs_dependencies")
add_test(test_renumber_on_the_fly_gnfs "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/misc" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/debug_renumber" "-poly" "/Users/samernajjar/Desktop/cado-nfs-master/parameters/polynomials/rsa768.poly" "-lpbs" "10,10" "-check" "-build" "-quiet")
set_tests_properties(test_renumber_on_the_fly_gnfs PROPERTIES  DEPENDS "builddep_test_renumber_on_the_fly_gnfs" SKIP_RETURN_CODE "125")
add_test(builddep_test_renumber_on_the_fly_gnfs2_30003 "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_renumber_on_the_fly_gnfs2_30003_dependencies")
add_test(test_renumber_on_the_fly_gnfs2_30003 "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/misc" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/misc/debug_renumber" "-poly" "/Users/samernajjar/Desktop/cado-nfs-master/parameters/polynomials/rsa768.poly" "-lpbs" "20,21" "-check" "-build" "-quiet")
set_tests_properties(test_renumber_on_the_fly_gnfs2_30003 PROPERTIES  DEPENDS "builddep_test_renumber_on_the_fly_gnfs2_30003" SKIP_RETURN_CODE "125")
add_test(builddep_test_renumber_file "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_renumber_file_dependencies")
add_test(builddep_test_renumber_file_mnfs5 "/Users/samernajjar/Desktop/cado-nfs-master/cmake-installed/bin/cmake" "--build" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "--target" "test_renumber_file_mnfs5_dependencies")
add_test(test_renumber_file_mnfs5 "env" "CADO_NFS_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master" "CADO_NFS_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "CMAKE_CURRENT_SOURCE_DIR=/Users/samernajjar/Desktop/cado-nfs-master/tests/misc" "CMAKE_CURRENT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP/tests/misc" "PROJECT_BINARY_DIR=/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "/Users/samernajjar/Desktop/cado-nfs-master/tests/provide-wdir.sh" "--env" "WORKDIR" "env" "bash" "/Users/samernajjar/Desktop/cado-nfs-master/tests/misc/test_renumber.sh" "-b" "/Users/samernajjar/Desktop/cado-nfs-master/build/Samers-MBP" "-poly" "/Users/samernajjar/Desktop/cado-nfs-master/tests/misc/test_renumber.data/mnfs5.poly" "-lpbs" "11,10,10,10,10")
set_tests_properties(test_renumber_file_mnfs5 PROPERTIES  DEPENDS "builddep_test_renumber_file_mnfs5" SKIP_RETURN_CODE "125")
