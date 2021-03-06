function(DECIDE_CXX_STANDERD)
    if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
        # MSVC before 14.10 doesn't support to specify C++ standard version so that CMAKE_CXX_STANDARD has no effect
        if(MSVC_VERSION GREATER_EQUAL 1910)
            set(DTL_DEFAULT_CXX_STANDARD 17)
        endif()
    elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.0)
            set(DTL_DEFAULT_CXX_STANDARD 17)
        elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 3.4)
            set(DTL_DEFAULT_CXX_STANDARD 14)
        else()
            set(DTL_DEFAULT_CXX_STANDARD 11)
        endif()
    elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 7.1)
            set(DTL_DEFAULT_CXX_STANDARD 17)
        elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.1)
            set(DTL_DEFAULT_CXX_STANDARD 14)
        else()
            set(DTL_DEFAULT_CXX_STANDARD 11)
        endif()
    else()
        set(DTL_DEFAULT_CXX_STANDARD 11)
    endif()
    message(STATUS "default CMAKE_CXX_STANDARD:${DTL_DEFAULT_CXX_STANDARD}")
    set(CMAKE_CXX_STANDARD "${DTL_DEFAULT_CXX_STANDARD}" CACHE STRING "C++ version")
    message(STATUS "CMAKE_CXX_STANDARD:${CMAKE_CXX_STANDARD}")
    if(CMAKE_CXX_STANDARD LESS 11)
        message(FATAL_ERROR "Specify C++11 or later")
    endif()
endfunction()