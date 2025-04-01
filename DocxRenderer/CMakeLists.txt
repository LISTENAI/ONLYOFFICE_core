add_library(DocxRenderer SHARED)
set(CMAKE_CURRENT_MODULE DocxRenderer)

target_compile_definitions(DocxRenderer PRIVATE
    DOCXRENDERER_USE_DYNAMIC_LIBRARY
)

target_link_libraries(DocxRenderer PRIVATE
    UnicodeConverter
    kernel
    graphics
)

target_sources(DocxRenderer PRIVATE
    src/logic/elements/BaseItem.cpp
    src/logic/elements/ContText.cpp
    src/logic/elements/Paragraph.cpp
    src/logic/elements/Shape.cpp
    src/logic/elements/Table.cpp
    src/logic/elements/TextLine.cpp
    src/logic/managers/FontManager.cpp
    src/logic/managers/FontStyleManager.cpp
    src/logic/managers/ImageManager.cpp
    src/logic/managers/ParagraphStyleManager.cpp
    src/logic/styles/FontStyle.cpp
    src/logic/Page.cpp
    src/logic/Document.cpp
    src/logic/styles/ParagraphStyle.cpp
    src/resources/VectorGraphics.cpp
    DocxRenderer.cpp
)

target_sources(DocxRenderer PRIVATE
    src/resources/resources.cpp
)
