add_library(RtfFormatLib STATIC)
set(CMAKE_CURRENT_MODULE RtfFormatLib)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/boost/boost.cmake)

target_compile_definitions(RtfFormatLib PRIVATE
    UNICODE
    _UNICODE
    DONT_WRITE_EMBEDDED_FONTS
    AVS_USE_CONVERT_PPTX_TOCUSTOM_VML
)

target_sources(RtfFormatLib PRIVATE
    rtffile_source.cpp
)

target_sources(RtfFormatLib PRIVATE
    ../../Format/DestinationCommand.cpp
    ../../Format/ConvertationManager.cpp
)
