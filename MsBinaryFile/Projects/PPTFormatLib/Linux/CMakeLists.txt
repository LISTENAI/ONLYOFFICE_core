add_library(PptFormatLib STATIC ppt_format_logic.cpp)
set(CMAKE_CURRENT_MODULE PptFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(PptFormatLib PRIVATE
    UNICODE
    _UNICODE
    _PRESENTATION_WRITER_
    _SVG_CONVERT_TO_IMAGE_
    DONT_WRITE_EMBEDDED_FONTS
)
