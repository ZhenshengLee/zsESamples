add_executable(zse_example_test test.cpp)
# target_link_libraries(zsa_example_test PRIVATE zsa::zsa)
target_link_libraries(zse_example_test PRIVATE gtest::gtest)

zsa_add_tests(TARGET zse_example_test HARDWARE_REQUIRED TEST_TYPE FUNCTIONAL)