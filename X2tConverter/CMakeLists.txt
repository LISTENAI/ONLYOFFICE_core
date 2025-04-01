add_executable(x2t src/main.cpp)
set(CMAKE_CURRENT_MODULE x2t)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/icu/icu.cmake)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(x2t PRIVATE
    UNICODE
    _UNICODE
    FILTER_FLATE_DECODE_ENABLED
    DONT_WRITE_EMBEDDED_FONTS
    AVS_USE_CONVERT_PPTX_TOCUSTOM_VML
    PDFFILE_USE_DYNAMIC_LIBRARY
    XPS_USE_DYNAMIC_LIBRARY
    DJVU_USE_DYNAMIC_LIBRARY
    HTMLFILE_USE_DYNAMIC_LIBRARY
    UNICODECONVERTER_USE_DYNAMIC_LIBRARY
    FILE_FORMAT_CHECKER_WITH_MACRO
    KERNEL_USE_DYNAMIC_LIBRARY
    GRAPHICS_USE_DYNAMIC_LIBRARY
)

target_include_directories(x2t PRIVATE
    ../OOXML
    ../OOXML/PPTXFormat
    ../OOXML/Binary/Presentation
    ../OfficeUtils/src
    ../OOXML/Binary/Document
)

target_sources(x2t PRIVATE
    ../Common/OfficeFileFormatChecker2.cpp
    src/cextracttools.cpp
    src/ASCConverters.cpp
)

target_link_libraries(x2t PRIVATE
    VbaFormatLib
    OdfFormatLib
    DocFormatLib
    PptFormatLib
    RtfFormatLib
    TxtXmlFormatLib
    BinDocument
    PPTXFormatLib
    DocxFormatLib
    XlsbFormatLib
    XlsFormatLib
    CompoundFileLib
    CryptoPPLib
)

target_link_libraries(x2t PRIVATE
    graphics
    kernel
    UnicodeConverter
    kernel_network
    Fb2File
    PdfFile
    HtmlFile2
    EpubFile
    XpsFile
    DjVuFile
    doctrenderer
    DocxRenderer
    IWorkFile
    HWPFile
)
