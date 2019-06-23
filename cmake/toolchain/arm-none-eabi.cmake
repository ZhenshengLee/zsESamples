include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_CROSSCOMPILING TRUE)

#不使用动态链接 -rdyamic
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")

# The toolchain prefix for all toolchain executables
set( CROSS_COMPILE arm-none-eabi- )

if (WIN32)
    message(STATUS "Now is windows")
    set(CROSS_COMPILE_ROOT_PATH "C:/Users/zhens/.vscode/extensions/metalcode-eu.windows-arm-none-eabi-0.1.6")
    set(CMAKE_C_COMPILER    ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}gcc.exe)
    set(CMAKE_CXX_COMPILER  ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}g++.exe)
    set(CMAKE_ASM_COMPILER  ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}as.exe)
    set(CMAKE_AR            ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}gcc.exe)
    set(CMAKE_RANLIB        ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}ranlib.exe)
    set(COVERAGE_COMMAND    ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}gcov.exe)
    set(CMAKE_OBJCOPY       ${CROSS_COMPILE_ROOT_PATH}/bin/${CROSS_COMPILE}objcopy.exe)
    # set(CMAKE_MAKE_PROGRAM  ${CROSS_COMPILE_ROOT_PATH}/bin/make.exe)
elseif (UNIX)
    message(STATUS "Now is UNIX-like OS's.")
endif ()

set(CMAKE_EXE_LINKER_FLAGS "-Wl,-gc-sections -specs=nosys.specs -mcpu=arm920t -static -mfloat-abi=soft")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH ${CROSS_COMPILE_ROOT_PATH})
