# following advices here: https://hsf-training.github.io/hsf-training-cmake-webpage/aio/index.html
cmake_minimum_required(VERSION 3.12...3.25)

project(adaptagrams)


# settings
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/cmake")
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
#set(CMAKE_FIND_DEBUG_MODE TRUE)


# compilation flags
option(USE_COLA "enable libcola, which depends on libvpsc." ON)
option(USE_TOPOLOGY "enable libtopology, which provides topology-preserving layout algos." ON)
option(USE_DIALECT "enable libdialect, which provides HOLA layout algos." OFF)

option(USE_CAIROMM "enable cairomm support for libcola debug output." OFF)
if(USE_CAIROMM)
    include(FindCairomm)
    include(CMakePrintHelpers)
    cmake_print_variables(CAIROMM_FOUND)
    cmake_print_variables(CAIROMM_INCLUDE_DIRS)
    cmake_print_variables(CAIROMM_LIBRARIES)
    if(CAIROMM_FOUND)
        set(HAVE_CAIROMM 1)
    endif()
endif()


# base lib that every lib depends on
add_subdirectory(libvpsc)
add_subdirectory(libavoid)

if(USE_DIALECT)
    set(USE_COLA ON)
    set(USE_TOPOLOGY ON)
    add_subdirectory(libdialect)
endif()

if(USE_TOPOLOGY)
    set(USE_COLA ON)
    add_subdirectory(libtopology)
endif()

if(USE_COLA)
    add_subdirectory(libcola)
endif()
