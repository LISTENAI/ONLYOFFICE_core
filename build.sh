#!/usr/bin/env bash

set -eo pipefail

if [ ! -d Common/3dParty/html/gumbo-parser ]; then
    echo "# Fetch: gumbo-parser"
    pushd Common/3dParty/html
    git clone https://github.com/google/gumbo-parser.git
    pushd gumbo-parser
    git checkout aa91b27b02c0c80c482e24348a457ed7c3c088e0
    sed -i 's|isspace(*c)|isspace((unsigned char)*c)|g' src/tag.c
    popd # gumbo-parser
    popd # Common/3dParty/html
fi

if [ ! -d Common/3dParty/html/katana-parser ]; then
    echo "# Fetch: katana-parser"
    pushd Common/3dParty/html
    git clone https://github.com/jasenhuang/katana-parser.git
    pushd katana-parser
    git checkout be6df458d4540eee375c513958dcb862a391cdd1
    sed -i 's|static inline bool katana_is_html_space(char c);|static inline bool2 katana_is_html_space(char c);|g' src/tokenizer.c
    sed -i 's|inline bool katana_is_html_space(char c)|static inline bool katana_is_html_space(char c)|g' src/tokenizer.c
    sed -i 's|static inline bool2 katana_is_html_space(char c);|static inline bool katana_is_html_space(char c);|g' src/tokenizer.c
    sed -i 's|katanaget_text(parser->scanner)|"error"|g' src/parser.c
    sed -i 's|#define KATANA_PARSER_STRING(literal) (KatanaParserString){|#define KATANA_PARSER_STRING(literal) {|g' src/parser.c
    sed -i 's|size_t len = strlen(str);|if (NULL == str) return; size_t len = strlen(str);|g' src/foundation.c
    popd # katana-parser
    popd # Common/3dParty/html
fi

if [ ! -d Common/3dParty/v8_89/v8 ]; then
    echo "# Fetch: v8"
    mkdir -p Common/3dParty/v8_89/v8/out.gn/linux_64/obj
    pushd Common/3dParty/v8_89/v8
    wget "https://github.com/kuoruan/libv8/releases/download/v8.9.255.25/v8_Linux_amd64.tar.xz"
    tar -xf v8_Linux_amd64.tar.xz
    rm -rf v8_Linux_amd64.tar.xz
    mv libv8_monolith.a out.gn/linux_64/obj/
    popd # Common/3dParty/v8_89/v8
fi

if [ ! -d Common/3dParty/glew/glew-2.1.0 ]; then
    echo "# Fetch: glew"
    pushd Common/3dParty/glew
    wget "https://deac-ams.dl.sourceforge.net/project/glew/glew/2.1.0/glew-2.1.0-win32.zip"
    unzip glew-2.1.0-win32.zip
    rm -rf glew-2.1.0-win32.zip
    popd # Common/3dParty/glew
fi

if [ ! -d Common/3dParty/harfbuzz/harfbuzz ]; then
    echo "# Fetch: harfbuzz"
    pushd Common/3dParty/harfbuzz
    git clone https://github.com/harfbuzz/harfbuzz.git
    pushd harfbuzz
    git checkout 894a1f72ee93a1fd8dc1d9218cb3fd8f048be29a
    git apply ../patch/hb-ft.cc.git.patch
    popd # harfbuzz
    python3 ./gen.py
    popd # Common/3dParty/harfbuzz
fi

if [ ! -d Common/3dParty/hyphen/hyphen ]; then
    echo "# Fetch: hyphen"
    pushd Common/3dParty/hyphen
    git clone https://github.com/hunspell/hyphen.git --depth 1
    popd # Common/3dParty/hyphen
fi

dobuild.sh UnicodeConverter
dobuild.sh Common
dobuild.sh DesktopEditor/graphics/pro
dobuild.sh TxtFile/Projects/Linux
dobuild.sh OOXML/Projects/Linux/BinDocument
dobuild.sh OOXML/Projects/Linux/DocxFormatLib
dobuild.sh OOXML/Projects/Linux/PPTXFormatLib
dobuild.sh OOXML/Projects/Linux/XlsbFormatLib
dobuild.sh MsBinaryFile/Projects/VbaFormatLib/Linux
dobuild.sh MsBinaryFile/Projects/DocFormatLib/Linux
dobuild.sh MsBinaryFile/Projects/PPTFormatLib/Linux
dobuild.sh MsBinaryFile/Projects/XlsFormatLib/Linux
dobuild.sh OdfFile/Projects/Linux
dobuild.sh RtfFile/Projects/Linux
dobuild.sh Common/cfcpp
dobuild.sh Common/3dParty/cryptopp/project
dobuild.sh Fb2File
dobuild.sh Common/Network
dobuild.sh --no-sanitize PdfFile
dobuild.sh HtmlFile2
dobuild.sh EpubFile
dobuild.sh XpsFile
dobuild.sh DjVuFile
# dobuild.sh Apple
# dobuild.sh HwpFile
dobuild.sh DocxRenderer
dobuild.sh DesktopEditor/doctrenderer

dobuild.sh \
    -c -g \
    X2tConverter/build/Qt/X2tConverter.pro

cp /usr/local/lib/libicuuc.so.58 /usr/local/lib/libicudata.so.58 build/lib/linux_64
