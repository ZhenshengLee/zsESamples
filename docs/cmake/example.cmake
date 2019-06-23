set(TARGETNAME "led_on_c_cmake.bin")

# https://gist.github.com/eugene-babichenko/3118042a23d2082bfba624f3f2039843
# 根据该文章，直接add_exe然后objcopy转成二进制即可

set(ELFNAME "led_on_c_elf")

set(SRCLIST "led_on_c.c")
list(APPEND SRCLIST "crt0.S")

set(OBJLIST "")

foreach(SRCNAME ${SRCLIST})
    string( REGEX REPLACE "(.*)\\.(.*)" "\\1.o" OBJNAME ${SRCNAME})
    message(STATUS "${SRCNAME}--->${OBJNAME}")
    add_library(${OBJNAME} OBJECT ${SRCNAME})
    # 编库和目标文件的编译选项也是这个
    target_compile_options(${OBJNAME}
        PRIVATE
        -msoft-float
        -static
        -nostdlib
        -g
    )
    string(APPEND OBJLIST " ${OBJNAME} ")
endforeach(SRCNAME ${SRCLIST})

string(STRIP ${OBJLIST} OBJLIST)

add_executable(${ELFNAME})

target_link_libraries(${ELFNAME}
    PRIVATE
    ${OBJLIST}
)

target_link_options(${ELFNAME}
    PRIVATE
    -Ttext 0x0000000
    -g
)

add_dependencies(${TARGETNAME} ${ELFNAME})

add_custom_command(TARGET ${TARGETNAME} POST_BUILD
COMMAND
${CMAKE_OBJCOPY} -O binary -S ${ELFNAME} ${TARGETNAME}
)


add_custom_command(TARGET ${TARGETNAME} POST_BUILD
COMMAND
${CMAKE_COMMAND} -E copy ${EXECUTABLE_OUTPUT_PATH}/${TARGETNAME} "D:\\var\\zsftp\\bare"
)
