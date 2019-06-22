file(GLOB_RECURSE SRC_FILES "*.cpp")

# uncomment if do not have lcov and just use gcov
# if(ENABLE_COVERAGE)
#     set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE 1)
# endif()

# 学完正则表达式之后优化此处
foreach(FILE_PATH ${SRC_FILES})
    string(REGEX REPLACE ".+/(.+)\\..*" "\\1" FILE_NAME ${FILE_PATH})
    add_library(${FILE_NAME} SHARED ${FILE_NAME}.cpp)
    # gcov
    # *.gcno adn *.gcda is build\lib\CMakeFiles\logAnalyzer.dir\logAnalyzer.cpp.gcda
    # 是否进行覆盖率检查
    if(ENABLE_COVERAGE)
        message(STATUS "Build target lib${FILE_NAME} with test-coverage")
        set_source_files_properties(${FILE_NAME}.cpp PROPERTIES COMPILE_FLAGS "-fprofile-arcs -ftest-coverage")
        target_link_libraries(${FILE_NAME} gcov)
    endif()
endforeach(FILE_PATH)

# todo: 这个是有问题的，一个库只能来自一个源文件，无法处理多个源文件的情况
#       暂时将多个类汇聚到一个一个源文件中以规避该问题
