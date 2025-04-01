add_library(VbaFormatLib STATIC)
set(CMAKE_CURRENT_MODULE VbaFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(VbaFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

target_sources(VbaFormatLib PRIVATE
    ../../../Common/Vba/Records.cpp
    ../../../Common/Vba/StreamObjects.cpp
    ../../../Common/Vba/VbaBinary.cpp
    ../../../Common/Vba/VbaReader.cpp
)
