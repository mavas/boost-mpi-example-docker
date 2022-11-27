cmake_minimum_required(VERSION 3.18)

project(boost_mpi_docker_example)

set(CMAKE_CXX_STANDARD 14)
FIND_PACKAGE(Boost 1.4 COMPONENTS mpi serialization REQUIRED)
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS})
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fopenmp")
include_directories(SYSTEM ${MPI_INCLUDE_PATH})


set(SOURCE_FILES main.cpp)
add_executable(main ${SOURCE_FILES})
target_link_libraries(main ${MPI_C_LIBRARIES})
TARGET_LINK_LIBRARIES(main ${Boost_LIBRARIES})
