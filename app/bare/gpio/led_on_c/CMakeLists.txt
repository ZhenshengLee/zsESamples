set(TARGETNAME "led_on_c_cmake.bin")
add_custom_target(led_on_c_cmake.bin ALL)

set(ELFNAME "led_on_c_elf")

set(SRCLIST "led_on_c.c")
list(APPEND SRCLIST "crt0.S")


add_executable(${ELFNAME} ${SRCLIST})
target_sources(${ELFNAME}  PRIVATE ${SRCLIST})
# 编库和目标文件的编译选项也是这个
target_compile_options(${ELFNAME}
    PRIVATE
    -g
)

target_link_options(${ELFNAME}
    PRIVATE
    -Ttext 0x0000000
    -g
    -static
    -msoft-float
    -nostdlib
)

add_dependencies(${TARGETNAME} ${ELFNAME})

add_custom_command(TARGET ${TARGETNAME} POST_BUILD
COMMAND
${CMAKE_OBJCOPY} -O binary -S ${EXECUTABLE_OUTPUT_PATH}/${ELFNAME} ${EXECUTABLE_OUTPUT_PATH}/${TARGETNAME}
)

add_custom_command(TARGET ${TARGETNAME} POST_BUILD
COMMAND
${CMAKE_COMMAND} -E copy ${EXECUTABLE_OUTPUT_PATH}/${TARGETNAME} "D:\\var\\zsftp\\bare"
)
