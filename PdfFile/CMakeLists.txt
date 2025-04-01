add_library(PdfFile SHARED)
set(CMAKE_CURRENT_MODULE PdfFile)

target_compile_definitions(PdfFile PRIVATE
    PDFFILE_USE_DYNAMIC_LIBRARY
)

target_link_libraries(PdfFile PRIVATE
    graphics
    kernel
    UnicodeConverter
    kernel_network
)

target_include_directories(PdfFile PRIVATE
    lib/goo
    lib/fofi
    lib/splash
    lib
)

file(GLOB_RECURSE PDF_FILE_LIB_SRCS
    lib/*.c
    lib/*.cc
)
list(REMOVE_ITEM PDF_FILE_LIB_SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/HTMLGen.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdftohtml.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdftopng.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdftoppm.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdftops.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdftotext.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdfdetach.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdffonts.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdfimages.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/xpdf/pdfinfo.cc
)
target_sources(PdfFile PRIVATE ${PDF_FILE_LIB_SRCS})

target_sources(PdfFile PRIVATE
    SrcReader/RendererOutputDev.cpp
    SrcReader/Adaptors.cpp
    SrcReader/PdfAnnot.cpp
    SrcReader/GfxClip.cpp
)

target_sources(PdfFile PRIVATE
    Resources/CMapMemory/cmap_memory.cpp
    Resources/BaseFonts.cpp
)

target_compile_definitions(PdfFile PRIVATE
    CRYPTOPP_DISABLE_ASM
    NOMINMAX
)

target_link_libraries(PdfFile PRIVATE CryptoPPLib)

target_compile_definitions(PdfFile PRIVATE
    HAVE_UNISTD_H
    HAVE_FCNTL_H
)

target_sources(PdfFile PRIVATE
    SrcWriter/AcroForm.cpp
    SrcWriter/Annotation.cpp
    SrcWriter/Catalog.cpp
    SrcWriter/Destination.cpp
    SrcWriter/Document.cpp
    SrcWriter/Encrypt.cpp
    SrcWriter/EncryptDictionary.cpp
    SrcWriter/Field.cpp
    SrcWriter/Font.cpp
    SrcWriter/Font14.cpp
    SrcWriter/FontCidTT.cpp
    SrcWriter/FontTT.cpp
    SrcWriter/FontTTWriter.cpp
    SrcWriter/GState.cpp
    SrcWriter/Image.cpp
    SrcWriter/Info.cpp
    SrcWriter/Objects.cpp
    SrcWriter/Outline.cpp
    SrcWriter/Pages.cpp
    SrcWriter/Pattern.cpp
    SrcWriter/ResourcesDictionary.cpp
    SrcWriter/Shading.cpp
    SrcWriter/Streams.cpp
    SrcWriter/Utils.cpp
    SrcWriter/Metadata.cpp
    SrcWriter/States.cpp
)

target_sources(PdfFile PRIVATE
    PdfFile.cpp
    PdfWriter.cpp
    PdfReader.cpp
    PdfEditor.cpp
    OnlineOfficeBinToPdf.cpp
)

include(${CMAKE_SOURCE_DIR}/DesktopEditor/graphics/pro/freetype.cmake)
