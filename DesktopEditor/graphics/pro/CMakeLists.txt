add_library(graphics SHARED)
set(CMAKE_CURRENT_MODULE graphics)

target_compile_options(graphics PRIVATE
    -Wno-constant-logical-operand
)

target_link_libraries(graphics PRIVATE
    ${CMAKE_SOURCE_DIR}/prebuilts/darwin-arm64/libkernel.dylib
    UnicodeConverter
)

target_compile_definitions(graphics PRIVATE
    GRAPHICS_USE_DYNAMIC_LIBRARY_BUILDING
)

find_package(PkgConfig REQUIRED)
pkg_check_modules(FREETYPE REQUIRED IMPORTED_TARGET freetype2)
target_link_libraries(graphics PRIVATE PkgConfig::FREETYPE)

target_link_libraries(graphics PRIVATE m)

set(GRAPHICS_AGG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../agg-2.4)

target_include_directories(graphics PRIVATE
    ${GRAPHICS_AGG_PATH}/include
    ${CMAKE_SOURCE_DIR}/OfficeUtils/src
)

target_sources(graphics PRIVATE
    ../Matrix.cpp
)

target_sources(graphics PRIVATE
    ${GRAPHICS_AGG_PATH}/src/agg_trans_affine.cpp
)

target_sources(graphics PRIVATE
    ../GraphicsPath.cpp
    ../BooleanOperations.cpp
)

target_sources(graphics PRIVATE
    ../AlphaMask.cpp
)

target_sources(graphics PRIVATE
    ../GraphicsLayer.cpp
)

target_sources(graphics PRIVATE
    ${GRAPHICS_AGG_PATH}/src/agg_arc.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_bezier_arc.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_curves.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_bspline.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_vcgen_bspline.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_vcgen_stroke.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_vcgen_contour.cpp
)

include(raster.cmake)

include(metafile.cmake)

include(fontengine.cmake)

target_sources(graphics PRIVATE
    officedrawingfile.cpp
)

target_sources(graphics PRIVATE
    ${GRAPHICS_AGG_PATH}/src/agg_arrowhead.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_image_filters.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_line_aa_basics.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_line_profile_aa.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_vcgen_dash.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_vcgen_markers_term.cpp
    ${GRAPHICS_AGG_PATH}/src/agg_vcgen_smooth_poly1.cpp
)

target_sources(graphics PRIVATE
    ../ArrowHead.cpp
    ../Brush.cpp
    ../Clip.cpp
    ../Graphics.cpp
    ../GraphicsRenderer.cpp
    pro_Image.cpp
    pro_Graphics.cpp
)

target_sources(graphics PRIVATE
    ../MetafileToRenderer.cpp
    ../MetafileToRendererReader.cpp
    ../MetafileToGraphicsRenderer.cpp
    ../commands/FormField.cpp
    ../commands/AnnotField.cpp
    ../commands/DocInfo.cpp
)
