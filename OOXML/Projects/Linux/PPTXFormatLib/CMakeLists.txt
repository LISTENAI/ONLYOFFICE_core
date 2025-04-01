add_library(PPTXFormatLib STATIC)
set(CMAKE_CURRENT_MODULE PPTXFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

include(../../../PPTXFormat/Logic/pri/pptx_logic.cmake)
target_sources(PPTXFormatLib PRIVATE ${LOGIC_SOURCES})

include(../../../PPTXFormat/Limit/pri/pptx_limits.cmake)
target_sources(PPTXFormatLib PRIVATE ${LIMITS_SOURCES})

include(../../../../MsBinaryFile/Common/Vml/PPTXShape/OOXMLShapes/pri/pptx_shapes.cmake)
target_sources(PPTXFormatLib PRIVATE ${SHAPESX_SOURCES})

target_compile_definitions(PPTXFormatLib PRIVATE
    UNICODE
    _UNICODE
    AVS_USE_CONVERT_PPTX_TOCUSTOM_VML
    DONT_WRITE_EMBEDDED_FONTS
)

target_include_directories(PPTXFormatLib PRIVATE
    ../../../../Common/ASCDocxFormat/Source/Utility
    ../../../../Common/ASCDocxFormat/Source/XML
    ../../../../Common/ASCDocxFormat/Source
    ../../../../../MsBinaryFile/XlsFile/Format
    ../../../../../MsBinaryFile/Common/common_xls
    ../../../XlsbFormat
)

target_sources(PPTXFormatLib PRIVATE
    pptx_format.cpp
    ../../../../OOXML/Binary/Document/BinWriter/BinEquationWriter.cpp
    ../../../../MsBinaryFile/Common/Vml/BaseShape.cpp
    ../../../../MsBinaryFile/Common/Vml/GraphicsPath.cpp
    ../../../../MsBinaryFile/Common/Vml/VmlPath.cpp
    ../../../../MsBinaryFile/Common/Vml/toVmlConvert.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTShape/PptShape.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTShape/PptFormula.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTShape/ElementSettings.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTShape/BinaryReader.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTShape/CustomGeomShape.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTShape/Ppt2PptxShapeConverter.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxFormula.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxShape.cpp
    ../../../../MsBinaryFile/Common/Vml/PPTXShape/Pptx2PptShapeConverter.cpp
    ../../../../MsBinaryFile/PptFile/Drawing/TextAttributesEx.cpp
    ../../../../MsBinaryFile/PptFile/Drawing/Elements.cpp
    ../../../Binary/Presentation/BinaryFileReaderWriter.cpp
    ../../../Binary/Presentation/XmlWriter.cpp
    ../../../Binary/Presentation/FontPicker.cpp
    ../../../Binary/Presentation/imagemanager.cpp
    ../../../Binary/Presentation/PPTXWriter.cpp
    ../../../Binary/Presentation/DefaultNotesTheme.cpp
    ../../../Binary/Presentation/DefaultNotesMaster.cpp
    ../../../Binary/Presentation/Converter.cpp
    ../../../Binary/Presentation/CalculatorCRC32.cpp
    ../../../Binary/Presentation/FontCutter.cpp
    ../../../PPTXFormat/DrawingConverter/ASCOfficeDrawingConverter.cpp
    ../../../PPTXFormat/DrawingConverter/ASCOfficePPTXFileRealization.cpp
    ../../../PPTXFormat/ViewProps/CSldViewPr.cpp
    ../../../PPTXFormat/ViewProps/CViewPr.cpp
    ../../../PPTXFormat/ViewProps/GridSpacing.cpp
    ../../../PPTXFormat/ViewProps/Guide.cpp
    ../../../PPTXFormat/ViewProps/NormalViewPr.cpp
    ../../../PPTXFormat/ViewProps/NotesTextViewPr.cpp
    ../../../PPTXFormat/ViewProps/NotesViewPr.cpp
    ../../../PPTXFormat/ViewProps/Origin.cpp
    ../../../PPTXFormat/ViewProps/OutlineViewPr.cpp
    ../../../PPTXFormat/ViewProps/Ratio.cpp
    ../../../PPTXFormat/ViewProps/Restored.cpp
    ../../../PPTXFormat/ViewProps/Scale.cpp
    ../../../PPTXFormat/ViewProps/Sld.cpp
    ../../../PPTXFormat/ViewProps/SlideViewPr.cpp
    ../../../PPTXFormat/ViewProps/SorterViewPr.cpp
    ../../../PPTXFormat/Theme/ClrScheme.cpp
    ../../../PPTXFormat/Theme/ExtraClrScheme.cpp
    ../../../PPTXFormat/Theme/FmtScheme.cpp
    ../../../PPTXFormat/Theme/FontScheme.cpp
    ../../../PPTXFormat/Theme/ThemeElements.cpp
    ../../../PPTXFormat/ShowPr/PresentationPr.cpp
    ../../../PPTXFormat/ShowPr/Present.cpp
    ../../../PPTXFormat/ShowPr/Kiosk.cpp
    ../../../PPTXFormat/ShowPr/CustShow.cpp
    ../../../PPTXFormat/ShowPr/Browse.cpp
    ../../../PPTXFormat/ShowPr/SldRg.cpp
    ../../../PPTXFormat/ShowPr/SldAll.cpp
    ../../../PPTXFormat/Presentation/NotesSz.cpp
    ../../../PPTXFormat/Presentation/PhotoAlbum.cpp
    ../../../PPTXFormat/Presentation/EmbeddedFont.cpp
    ../../../PPTXFormat/Presentation/EmbeddedFontDataId.cpp
    ../../../PPTXFormat/Presentation/Kinsoku.cpp
    ../../../PPTXFormat/Presentation/SectionLst.cpp
    ../../../PPTXFormat/Presentation/SldSz.cpp
)
