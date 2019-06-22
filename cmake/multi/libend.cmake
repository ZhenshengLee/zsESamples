# lib以当前文件夹命名，编译所有源文件
# predefined variables
# current folder name
string( REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})
set(MAIN_EXE "${CURRENT_FOLDER}Main")
set(TEST_EXE "${CURRENT_FOLDER}Test")
set(CLASS_LIB "${CURRENT_FOLDER}")
