add_library(OdfFormatLib STATIC)
set(CMAKE_CURRENT_MODULE OdfFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/icu/icu.cmake)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

include(../../Reader/Converter/StarMath2OOXML/StarMath2OOXML.cmake)
target_sources(OdfFormatLib PRIVATE ${STARMATH_SOURCES})

target_compile_definitions(OdfFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

target_include_directories(OdfFormatLib PRIVATE
    ../../Common
)

target_sources(OdfFormatLib PRIVATE
    odf_converter.cpp
    odf_datatypes.cpp
    odf_reader.cpp
    odf_writer.cpp
)

target_sources(OdfFormatLib PRIVATE
    ../../Formulas/formulasconvert_oox.cpp
    ../../Formulas/formulasconvert_odf.cpp
    ../../Common/xml/attributes.cpp
    ../../Common/xml/sax.cpp
    ../../Common/xml/sax_xmllite.cpp
    ../../Common/xml/utils.cpp
    ../../Common/xml/xmlchar.cpp
    ../../Common/CPColorUtils.cpp
    ../../Common/CPString.cpp
    ../../Common/readdocelement.cpp
    ../../Common/utils.cpp
    ../../Common/logging.cpp
    ../../Writer/Converter/Converter.cpp
    ../../Writer/Converter/ConverterChart.cpp
    ../../Writer/Converter/ConvertVml.cpp
    ../../Writer/Converter/DocxConverter.cpp
    ../../Writer/Converter/MathConverter.cpp
    ../../Writer/Converter/XlsxConverter.cpp
    ../../Writer/Converter/ConvertDrawing.cpp
    ../../Writer/Converter/PptxConverter.cpp
)
