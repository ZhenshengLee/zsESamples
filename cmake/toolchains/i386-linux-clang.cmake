# the name of the target OS and arch
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR i386)

# which compilers to use
SET(CMAKE_C_COMPILER "clang-6.0")
SET(CMAKE_C_FLAGS -m32)
SET(CMAKE_CXX_COMPILER "clang++-6.0")
SET(CMAKE_CXX_FLAGS -m32)

# save flags to cache
SET(CMAKE_C_FLAGS   ${CMAKE_C_FLAGS}   CACHE STRING "C Flags"   FORCE)
SET(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "C++ Flags" FORCE)

# Tell pkgconfig to use i386
SET(ENV{PKG_CONFIG_PATH} "/usr/lib/i386-linux-gnu/pkgconfig")