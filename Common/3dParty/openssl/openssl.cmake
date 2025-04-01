find_package(PkgConfig REQUIRED)
pkg_check_modules(OPENSSL REQUIRED IMPORTED_TARGET openssl)

target_link_libraries(
    ${CMAKE_CURRENT_MODULE} PRIVATE PkgConfig::OPENSSL
)
