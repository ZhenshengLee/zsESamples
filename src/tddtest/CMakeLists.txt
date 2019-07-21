add_library(zse_tddtest STATIC
            tddtest.cpp
            )

# Consumers should #include <zseinternal/tddtest.h>
target_include_directories(zse_tddtest PUBLIC
    ${ZSE_PRIV_INCLUDE_DIR})

# Dependencies of this library
# target_link_libraries(zse_tddtest PUBLIC
#     azure::aziotsharedutil
#     zseinternal::logging)

# Define alias for other targets to link against
add_library(zseinternal::tddtest ALIAS zse_tddtest)