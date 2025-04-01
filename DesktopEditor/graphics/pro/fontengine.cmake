include(freetype.cmake)

set(FONT_ENGINE_PATH ${CMAKE_SOURCE_DIR}/DesktopEditor/fontengine)

target_sources(graphics PRIVATE
    ${FONT_ENGINE_PATH}/ApplicationFonts.cpp
    ${FONT_ENGINE_PATH}/FontFile.cpp
    ${FONT_ENGINE_PATH}/FontManager.cpp
    ${FONT_ENGINE_PATH}/FontPath.cpp
    ${FONT_ENGINE_PATH}/GlyphString.cpp
)

target_sources(graphics PRIVATE
    ${FONT_ENGINE_PATH}/ApplicationFontsWorker.cpp
)

target_sources(graphics PRIVATE
    ${FONT_ENGINE_PATH}/FontsAssistant.cpp
)

target_sources(graphics PRIVATE
    ${FONT_ENGINE_PATH}/TextShaper.cpp
)

target_sources(graphics PRIVATE
    ${FONT_ENGINE_PATH}/TextHyphen.cpp
)

target_sources(graphics PRIVATE
    pro_Fonts.cpp
)
