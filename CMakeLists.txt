cmake_minimum_required(VERSION 3.12)
project(ONLYOFFICE)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_compile_options(-w)

add_subdirectory(prebuilts)

add_subdirectory(Common/3dParty/cryptopp/project)
add_subdirectory(DesktopEditor/graphics/pro)
add_subdirectory(DocxRenderer)
add_subdirectory(Common/cfcpp)
add_subdirectory(MsBinaryFile)
add_subdirectory(OdfFile/Projects/Linux)
add_subdirectory(OfficeUtils)
add_subdirectory(OOXML)
add_subdirectory(PdfFile)
add_subdirectory(RtfFile/Projects/Linux)
add_subdirectory(TxtFile/Projects/Linux)
add_subdirectory(UnicodeConverter)
add_subdirectory(X2tConverter)
