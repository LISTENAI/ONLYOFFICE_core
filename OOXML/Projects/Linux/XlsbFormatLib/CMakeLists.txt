add_library(XlsbFormatLib STATIC xlsb_format_logic.cpp)
set(CMAKE_CURRENT_MODULE XlsbFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(XlsbFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

target_link_libraries(XlsbFormatLib PRIVATE
    OfficeUtils
)
