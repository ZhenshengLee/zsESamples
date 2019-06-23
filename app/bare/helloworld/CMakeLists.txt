# predefined variables
# current folder name
string( REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})
set(MAIN_EXE "${CURRENT_FOLDER}Main")
set(TEST_EXE "${CURRENT_FOLDER}Test")
set(MAIN_SRC "${MAIN_EXE}.cpp")
set(CLASS_LIB "${CURRENT_FOLDER}")

# add executable
add_executable(${MAIN_EXE} ${MAIN_SRC})
# target_link_libraries(${MAIN_EXE}
#     ${CLASS_LIB}
#     )

