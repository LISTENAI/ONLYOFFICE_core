set(FREETYPE_VERSION 2.10.4)
set(FREETYPE_PATH ${CMAKE_SOURCE_DIR}/DesktopEditor/freetype-${FREETYPE_VERSION})

target_compile_definitions(${CMAKE_CURRENT_MODULE} PRIVATE
    FT_CONFIG_OPTION_SYSTEM_ZLIB
    FT2_BUILD_LIBRARY
)

target_include_directories(${CMAKE_CURRENT_MODULE} PRIVATE
    ${FREETYPE_PATH}/include
    ${FREETYPE_PATH}/include/freetype
)

find_package(PkgConfig REQUIRED)
pkg_check_modules(ZLIB REQUIRED IMPORTED_TARGET zlib)
target_link_libraries(${CMAKE_CURRENT_MODULE} PRIVATE PkgConfig::ZLIB)
target_sources(${CMAKE_CURRENT_MODULE} PRIVATE
    ${CMAKE_SOURCE_DIR}/OfficeUtils/src/zlib_addon.c
)

target_sources(${CMAKE_CURRENT_MODULE} PRIVATE
    ${FREETYPE_PATH}/src/autofit/autofit.c
    ${FREETYPE_PATH}/src/base/ftbase.c
    ${FREETYPE_PATH}/src/base/ftbbox.c
    ${FREETYPE_PATH}/src/base/ftbdf.c
    ${FREETYPE_PATH}/src/base/ftbitmap.c
    ${FREETYPE_PATH}/src/base/ftcid.c
    ${FREETYPE_PATH}/src/base/ftfstype.c
    ${FREETYPE_PATH}/src/base/ftgasp.c
    ${FREETYPE_PATH}/src/base/ftglyph.c
    ${FREETYPE_PATH}/src/base/ftgxval.c
    ${FREETYPE_PATH}/src/base/ftinit.c
    ${FREETYPE_PATH}/src/base/ftmm.c
    ${FREETYPE_PATH}/src/base/ftotval.c
    ${FREETYPE_PATH}/src/base/ftpatent.c
    ${FREETYPE_PATH}/src/base/ftpfr.c
    ${FREETYPE_PATH}/src/base/ftstroke.c
    ${FREETYPE_PATH}/src/base/ftsynth.c
    ${FREETYPE_PATH}/src/base/fttype1.c
    ${FREETYPE_PATH}/src/base/ftwinfnt.c
    ${FREETYPE_PATH}/src/bdf/bdf.c
    ${FREETYPE_PATH}/src/bzip2/ftbzip2.c
    ${FREETYPE_PATH}/src/cache/ftcache.c
    ${FREETYPE_PATH}/src/cff/cff.c
    ${FREETYPE_PATH}/src/cid/type1cid.c
    ${FREETYPE_PATH}/src/gzip/ftgzip.c
    ${FREETYPE_PATH}/src/lzw/ftlzw.c
    ${FREETYPE_PATH}/src/pcf/pcf.c
    ${FREETYPE_PATH}/src/pfr/pfr.c
    ${FREETYPE_PATH}/src/psaux/psaux.c
    ${FREETYPE_PATH}/src/pshinter/pshinter.c
    ${FREETYPE_PATH}/src/psnames/psnames.c
    ${FREETYPE_PATH}/src/raster/raster.c
    ${FREETYPE_PATH}/src/sfnt/sfnt.c
    ${FREETYPE_PATH}/src/smooth/smooth.c
    ${FREETYPE_PATH}/src/truetype/truetype.c
    ${FREETYPE_PATH}/src/type1/type1.c
    ${FREETYPE_PATH}/src/type42/type42.c
    ${FREETYPE_PATH}/src/winfonts/winfnt.c
    ${FREETYPE_PATH}/src/base/ftdebug.c
)

target_sources(${CMAKE_CURRENT_MODULE} PRIVATE
    ${FREETYPE_PATH}/builds/unix/ftsystem.c
)
