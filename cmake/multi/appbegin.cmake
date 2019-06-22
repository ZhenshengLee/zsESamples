# 强制命名，可执行文件带后缀Main
# 对应的库名字必须与文件夹一致，必须链接库，后面要改
# predefined variables
# current folder name
string( REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})
set(MAIN_EXE "${CURRENT_FOLDER}Main")
set(TEST_EXE "${CURRENT_FOLDER}Test")
set(MAIN_SRC "${MAIN_EXE}.cpp")
set(TEST_SRC "${TEST_EXE}.cpp")
set(CLASS_LIB "${CURRENT_FOLDER}")

# add executable
add_executable(${MAIN_EXE} ${MAIN_SRC})
# log4cplus
if(BUILDWITHLOG)
    target_link_libraries(${MAIN_EXE}
        ${CLASS_LIB}
        log4cplusSU
        )
endif()

# CTest
if(BUILDWITHTEST)
    enable_testing()
    add_executable(${TEST_EXE} ${TEST_SRC})
    target_link_libraries(${TEST_EXE}
        gtest
        gtest_main
        gmock
        gmock_main
        ${CLASS_LIB}
        )

    add_test(
        NAME ${TEST_EXE}
        COMMAND $<TARGET_FILE:${TEST_EXE}>
    )
endif()
