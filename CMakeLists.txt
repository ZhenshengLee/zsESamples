cmake_minimum_required(VERSION 3.7.2)
project(zsTrain)

include(${CMAKE_SOURCE_DIR}/cmake/common/top.cmake)

# include dirs
include_directories(
    # /usr/include
    # ${log4cxx_INCLUDE_DIR}
    )

# add subdirectories
# 选择包含哪些代码和测试项目
# 注意，项目代码和单元测试是捆绑在一起的
add_subdirectory("./lib")
add_subdirectory("./app/")

# add executable in ./lib and ./app
