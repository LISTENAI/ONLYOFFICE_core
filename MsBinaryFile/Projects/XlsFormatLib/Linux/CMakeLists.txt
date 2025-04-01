add_library(XlsFormatLib STATIC)
set(CMAKE_CURRENT_MODULE XlsFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

include(../../../XlsFile/Format/Logic/pri/xls_logic.cmake)
target_sources(XlsFormatLib PRIVATE ${LOGIC_SOURCES})

target_compile_definitions(XlsFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
)

target_include_directories(XlsFormatLib PRIVATE
    ../../../XlsFile/Format
    ../../../XlsFile/Format/Logic
    ../../../Common
    ../../../../OOXML/XlsbFormat
)

target_sources(XlsFormatLib PRIVATE
    ../../../XlsFile/Format/Auxiliary/HelpFunc.cpp
    ../../../XlsFile/Format/Binary/CFRecord.cpp
    ../../../XlsFile/Format/Binary/CFRecordType.cpp
    ../../../XlsFile/Format/Binary/CFStream.cpp
    ../../../XlsFile/Format/Binary/CFStreamCacheReader.cpp
    ../../../XlsFile/Format/Binary/CFStreamCacheWriter.cpp
    ../../../XlsFile/Format/Binary/CompoundFile.cpp
    ../../../XlsFile/Format/Crypt/rtl/cipher.cpp
    ../../../XlsFile/Format/Crypt/rtl/digest.cpp
    ../../../XlsFile/Format/Crypt/BiffDecoder_RCF.cpp
    ../../../XlsFile/Format/Crypt/BinaryCodec_RCF.cpp
    ../../../XlsFile/Format/Crypt/Decryptor.cpp
    ../../../XlsFile/Format/Crypt/RC4Crypt.cpp
    ../../../XlsFile/Format/Crypt/XORCrypt.cpp
    ../../../XlsFile/Format/Logging/Log.cpp
    ../../../XlsFile/Format/Logging/Logger.cpp
    ../../../XlsFile/Converter/ConvertXls2Xlsx.cpp
    ../../../XlsFile/Converter/external_items.cpp
    ../../../XlsFile/Converter/mediaitems_utils.cpp
    ../../../XlsFile/Converter/namespaces.cpp
    ../../../XlsFile/Converter/oox_content_type.cpp
    ../../../XlsFile/Converter/oox_package.cpp
    ../../../XlsFile/Converter/oox_rels.cpp
    ../../../XlsFile/Converter/XlsConverter.cpp
    ../../../XlsFile/Converter/xlsx_conversion_context.cpp
    ../../../XlsFile/Converter/xlsx_drawing_context.cpp
    ../../../XlsFile/Converter/xlsx_drawings.cpp
    ../../../XlsFile/Converter/xlsx_hyperlinks.cpp
    ../../../XlsFile/Converter/xlsx_output_xml.cpp
    ../../../XlsFile/Converter/xlsx_package.cpp
    ../../../XlsFile/Converter/xlsx_protection.cpp
    ../../../XlsFile/Converter/xlsx_tablecontext.cpp
    ../../../XlsFile/Converter/xlsx_textcontext.cpp
    ../../../XlsFile/Converter/xlsx_chart_context.cpp
    ../../../XlsFile/Converter/xlsx_pivots_context.cpp
    ../../../XlsFile/Converter/xlsx_sheet_context.cpp
    ../../../XlsFile/Converter/xlsx_external_context.cpp
    ../../../XlsFile/Converter/xlsx_activeX_context.cpp
    ../../../XlsFile/Converter/xlsx_comments.cpp
    ../../../XlsFile/Converter/xlsx_comments_context.cpp
)
