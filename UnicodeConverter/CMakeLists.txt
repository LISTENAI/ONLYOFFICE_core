add_library(UnicodeConverter SHARED)
set(CMAKE_CURRENT_MODULE UnicodeConverter)

# set(CMAKE_CXX_STANDARD 11)
set_property(TARGET UnicodeConverter PROPERTY CXX_STANDARD 17)

include(${CMAKE_SOURCE_DIR}/Common/3dParty/icu/icu.cmake)

target_compile_definitions(UnicodeConverter PRIVATE
    UNICODECONVERTER_USE_DYNAMIC_LIBRARY
    TRUE=1
    FALSE=0
)

target_sources(UnicodeConverter PRIVATE
    UnicodeConverter.cpp
)
