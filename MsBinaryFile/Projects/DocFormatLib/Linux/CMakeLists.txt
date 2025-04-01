add_library(DocFormatLib STATIC doc_converter.cpp)
set(CMAKE_CURRENT_MODULE DocFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(DocFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

target_sources(DocFormatLib PRIVATE
    ../../../DocFile/Main/DocFormatLib.cpp
    ../../../DocFile/EncryptionHeader.cpp
    ../../../DocFile/DrawingPrimitives.cpp
    ../../../DocFile/Spa.cpp
    ../../../DocFile/OleObject.cpp
    ../../../Common/Base/FormatUtils.cpp
    ../../../Common/Base/XmlTools.cpp
)
