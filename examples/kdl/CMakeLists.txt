cmake_minimum_required(VERSION 2.8.3)
project(kdl_beginner)

SET(CMAKE_CXX_FLAGS "-std=c++11")

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# find packages
find_package(Eigen3 REQUIRED)
find_package(orocos_kdl REQUIRED)
find_package(OMPL)

# include dirs
include_directories(${Eigen3_INCLUDE_DIRS}
        ${orocos_kdl_INCLUDE_DIRS}
        ${OMPL_INCLUDE_DIRS} )

add_executable(Forward-kinematic-chain-example src/Forward-kinematic-chain-example.cpp)
target_link_libraries(Forward-kinematic-chain-example ${Eigen3_LIBRARIES}   ${orocos_kdl_LIBRARIES} )

add_executable(RigidBodyPlanning src/RigidBodyPlanning.cpp)
target_link_libraries(RigidBodyPlanning ${OMPL_LIBRARIES} )

#find_package( PkgConfig )
#pkg_check_modules( EIGEN3 REQUIRED eigen3 )