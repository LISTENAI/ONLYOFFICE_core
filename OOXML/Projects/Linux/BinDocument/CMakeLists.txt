add_library(BinDocument STATIC)
set(CMAKE_CURRENT_MODULE BinDocument)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_include_directories(BinDocument PRIVATE
    ../../../../MsBinaryFile/XlsFile/Format
    ../../../../MsBinaryFile/Common/common_xls
    ../../../XlsbFormat
)

target_compile_definitions(BinDocument PRIVATE
    UNICODE
    _UNICODE
    SOLUTION_ASCOFFICEDOCXFILE2
    DONT_WRITE_EMBEDDED_FONTS
    AVS_USE_CONVERT_PPTX_TOCUSTOM_VML
)

target_sources(BinDocument PRIVATE
    ../../../Binary/Document/DocWrapper/DocxSerializer.cpp
    ../../../Binary/Document/DocWrapper/FontProcessor.cpp
    ../../../Binary/Document/DocWrapper/XlsxSerializer.cpp
    ../../../Binary/Document/DocWrapper/ChartSerializer.cpp
    ../../../Binary/Document/BinWriter/BinWriters.cpp
    ../../../Binary/Sheets/Common/Common.cpp
    ../../../Binary/Sheets/Reader/ChartFromToBinary.cpp
    ../../../Binary/Sheets/Reader/CommonWriter.cpp
    ../../../Binary/Sheets/Reader/CSVReader.cpp
    ../../../Binary/Sheets/Reader/BinaryWriter.cpp
    ../../../Binary/Sheets/Writer/BinaryReader.cpp
    ../../../Binary/Sheets/Writer/CSVWriter.cpp
    ../../../Binary/Document/BinReader/ReaderClasses.cpp
    ../../../Binary/Document/BinReader/Readers.cpp
    ../../../Binary/Document/BinReader/CustomXmlWriter.cpp
    ../../../Binary/Document/BinReader/FileWriter.cpp
    ../../../Binary/Document/BinReader/ChartWriter.cpp
    ../../../Binary/Document/BinReader/CommentsWriter.cpp
    ../../../Binary/Document/BinReader/DefaultThemeWriter.cpp
    ../../../Binary/Document/BinReader/DocumentRelsWriter.cpp
    ../../../Binary/Document/BinReader/DocumentWriter.cpp
    ../../../Binary/Document/BinReader/fontTableWriter.cpp
    ../../../Binary/Document/BinReader/HeaderFooterWriter.cpp
    ../../../Binary/Document/BinReader/MediaWriter.cpp
    ../../../Binary/Document/BinReader/NumberingWriter.cpp
    ../../../Binary/Document/BinReader/SettingWriter.cpp
    ../../../Binary/Document/BinReader/StylesWriter.cpp
    ../../../Binary/Document/BinReader/webSettingsWriter.cpp
    ../../../Binary/Sheets/Reader/XMLReader/XMLReader.cpp
    ../../../Binary/Sheets/Reader/XMLReader/XML2TableConverter.cpp
    ../../../Binary/Sheets/Reader/XMLReader/XLSXTableController.cpp
    ../../../Binary/Sheets/Reader/XMLReader/columnNameController.cpp
    ../../../Binary/Sheets/Reader/XMLReader/XMLConverter2.cpp
    ../../../Binary/Sheets/Reader/XMLReader/XMLMap.cpp
    ../../../Binary/Sheets/Reader/XMLReader/XMLReader2.cpp
    ../../../Binary/Sheets/Reader/CellFormatController/CellFormatController.cpp
    ../../../Binary/Sheets/Reader/CellFormatController/DigitReader.cpp
    ../../../Binary/Sheets/Reader/CellFormatController/DateReader.cpp
    ../../../Binary/Sheets/Reader/CellFormatController/LocalInfo.cpp
    ../../../Binary/Sheets/Reader/CellFormatController/CurrencyReader.cpp
)
