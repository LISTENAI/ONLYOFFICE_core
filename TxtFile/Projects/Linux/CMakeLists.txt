add_library(TxtXmlFormatLib STATIC)
set(CMAKE_CURRENT_MODULE TxtXmlFormatLib)

target_compile_definitions(TxtXmlFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_sources(TxtXmlFormatLib PRIVATE
    ../../Source/TxtFormat/File.cpp
    ../../Source/TxtFormat/TxtFile.cpp
    ../../Source/TxtXmlFile.cpp
    ../../Source/ConvertDocx2Txt.cpp
    ../../Source/ConvertTxt2Docx.cpp
)
