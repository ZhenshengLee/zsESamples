# using cmaktools in vscode
include(CMakeToolsHelpers OPTIONAL)

# predefine some variables
# options
option(BUILDWITHTEST "Build the project with Unit Tests." ON)
option(BUILDWITHLOG "Build the project with Log4cplus System." OFF)
OPTION (ENABLE_COVERAGE "Build the project with gcov." OFF)

# set output path
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

# set cpp standard globally
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -DUNICODE -Wno-deprecated-declarations -Wno-unused-function")
# using gdb
set(CMAKE_BUILD_TYPE "Debug")
set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O2 ")

# set before finding packages
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/module")

# find packages
# find_package(Log4CXX REQUIRED)

# include dirs
include_directories(
    # /usr/include
    # ${log4cxx_INCLUDE_DIR}
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_SOURCE_DIR}/tools/googletest-release-1.8.0/googletest/include
    ${PROJECT_SOURCE_DIR}/tools/googletest-release-1.8.0/googlemock/include
    ${PROJECT_SOURCE_DIR}/tools/log4cplus-REL_1_2_1/include
    )

# CTest
# 选择是否构建单元测试
if(BUILDWITHTEST)
    message(STATUS "Build with Unit Tests")
    enable_testing()
    include(CTest)
    link_directories("./tools/lib")
    # add_subdirectory("./tools/googletest-release-1.8.0")
else()
    message(STATUS "Build without Unit Tests")
endif()

# log4cplus
if(BUILDWITHLOG)
    message(STATUS "Build with Log4cplus")
    link_directories("./tools/lib")
    # add_subdirectory("./tools/log4cplus-REL_1_2_1")
else()
    message(STATUS "Build without Log4cplus")
endif()

# message sth.
# MESSAGE(STATUS ENABLE_COVERAGE=${ENABLE_COVERAGE})
