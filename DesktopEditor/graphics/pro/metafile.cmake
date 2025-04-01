set(METAFILE_PATH ${CMAKE_SOURCE_DIR}/DesktopEditor/raster/Metafile)

target_compile_definitions(graphics PRIVATE
    METAFILE_SUPPORT_WMF_EMF
)

target_sources(graphics PRIVATE
    ${METAFILE_PATH}/Common/CPathConverter.cpp
    ${METAFILE_PATH}/Common/CPath.cpp
    ${METAFILE_PATH}/Common/CClip.cpp
    ${METAFILE_PATH}/Emf/EmfInterpretator/CEmfInterpretator.cpp
    ${METAFILE_PATH}/Emf/EmfInterpretator/CEmfInterpretatorArray.cpp
    ${METAFILE_PATH}/Emf/EmfInterpretator/CEmfInterpretatorRender.cpp
    ${METAFILE_PATH}/Emf/EmfInterpretator/CEmfInterpretatorSvg.cpp
    ${METAFILE_PATH}/Emf/EmfParser/CEmfParser.cpp
    ${METAFILE_PATH}/Emf/EmfParser/CEmfParserBase.cpp
    ${METAFILE_PATH}/Emf/EmfParser/CEmfPlusParser.cpp
    ${METAFILE_PATH}/Emf/EmfObjects.cpp
    ${METAFILE_PATH}/Emf/EmfPlusObjects.cpp
    ${METAFILE_PATH}/Emf/EmfPlayer.cpp
    ${METAFILE_PATH}/Emf/EmfFile.cpp
    ${METAFILE_PATH}/Wmf/WmfObjects.cpp
    ${METAFILE_PATH}/Wmf/WmfPlayer.cpp
    ${METAFILE_PATH}/Wmf/WmfInterpretator/CInterpretatorSvgBase.cpp
    ${METAFILE_PATH}/Wmf/WmfInterpretator/CWmfInterpretatorSvg.cpp
    ${METAFILE_PATH}/Wmf/WmfInterpretator/CWmfInterpretatorRender.cpp
    ${METAFILE_PATH}/Wmf/WmfInterpretator/CWmfInterpretator.cpp
    ${METAFILE_PATH}/Wmf/WmfParser/CWmfParser.cpp
    ${METAFILE_PATH}/Wmf/WmfParser/CWmfParserBase.cpp
)

target_compile_definitions(graphics PRIVATE
    METAFILE_SUPPORT_WMF_EMF_XML
)

target_sources(graphics PRIVATE
    ${METAFILE_PATH}/CXmlOutput.cpp
    ${METAFILE_PATH}/Emf/EmfInterpretator/CEmfInterpretatorXml.cpp
    ${METAFILE_PATH}/Emf/EmfParser/CEmfxParser.cpp
)

# target_compile_definitions(graphics PRIVATE
#     METAFILE_SUPPORT_SVG
# )

# target_sources(graphics PRIVATE
#     ${METAFILE_PATH}/svg/CSvgFile.cpp
#     ${METAFILE_PATH}/svg/CSvgParser.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CContainer.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CGradient.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CClipPath.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CMask.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CMarker.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CPattern.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CSymbol.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CSwitch.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CImage.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CLine.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CRect.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CCircle.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CEllipse.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CPath.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CText.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CUse.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CPolyline.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CFont.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CObjectBase.cpp
#     ${METAFILE_PATH}/svg/SvgObjects/CStyle.cpp
# )

target_compile_definitions(graphics PRIVATE
    METAFILE_SUPPORT_SVM
)

target_sources(graphics PRIVATE
    ${METAFILE_PATH}/StarView/SvmFile.cpp
    ${METAFILE_PATH}/StarView/SvmObjects.cpp
    ${METAFILE_PATH}/StarView/SvmPlayer.cpp
)

target_sources(graphics PRIVATE
    ${METAFILE_PATH}/MetaFile.cpp
    ${METAFILE_PATH}/Common/MetaFileTypes.cpp
    ${METAFILE_PATH}/Common/MetaFileUtils.cpp
)
