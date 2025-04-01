add_library(DocxFormatLib STATIC docx_format_logic.cpp)
set(CMAKE_CURRENT_MODULE DocxFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(DocxFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

target_sources(DocxFormatLib PRIVATE
    ../../../Base/codecvt.cpp
    ../../../Base/DateTime.cpp
    ../../../Base/unicode_util.cpp
    ../../../Base/Unit.cpp
    ../../../Base/WinColor.cpp
    ../../../../Common/3dParty/pole/pole.cpp
    docx_format.cpp
)
