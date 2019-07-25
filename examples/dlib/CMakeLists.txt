cmake_minimum_required(VERSION 2.8.3)
project(dlib_beginner)

SET(CMAKE_CXX_FLAGS "-std=c++11")

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# find packages
find_package(dlib REQUIRED)

# include dirs
include_directories(${dlib_INCLUDE_DIRS})

# add target
add_executable(matrix_ex src/matrix_ex.cpp)
target_link_libraries(matrix_ex ${dlib_LIBRARIES})