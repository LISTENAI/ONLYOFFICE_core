add_library(OfficeUtils STATIC)

target_sources(OfficeUtils PRIVATE
    src/OfficeUtils.cpp
    src/ZipBuffer.cpp
    src/ZipUtilsCP.cpp
    src/zlib_addon.c
)

find_package(PkgConfig REQUIRED)
pkg_check_modules(ZLIB REQUIRED IMPORTED_TARGET zlib)
target_link_libraries(OfficeUtils PRIVATE PkgConfig::ZLIB)
