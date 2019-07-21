# Consumers of this include directory need to #include "k4ainternal/header.h"
set(ZSE_PRIV_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/../include ${CMAKE_CURRENT_BINARY_DIR}/sdk/include)

add_subdirectory("./tddtest/")
