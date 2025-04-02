#!/usr/bin/env python

import sys
import os


def read_files(folder, addon=""):
    ret_data = os.listdir(folder)
    for i in range(len(ret_data)):
        ret_data[i] = addon + ret_data[i]
    return ret_data


def gen_qmake():
    qmake_content_lines = []

    qmake_content_lines.append("SRC_DIR = $$PWD/harfbuzz/src")
    qmake_content_lines.append("")
    qmake_content_lines.append("DEFINES += \\")
    qmake_content_lines.append("  HAVE_FREETYPE \\")
    qmake_content_lines.append("  HB_NO_VISIBILITY")
    qmake_content_lines.append("")
    qmake_content_lines.append("INCLUDEPATH += \\")
    qmake_content_lines.append("  $$SRC_DIR \\")
    qmake_content_lines.append("")

    all_files = read_files("./harfbuzz/src")
    all_files += read_files("./harfbuzz/src/graph", "graph/")

    headers_files = []
    sources_files = []

    headers_exclude = []

    sources_exclude = []
    sources_exclude.append("main.cc")
    sources_exclude.append("failing-alloc.c")

    sources_exclude_filter = []
    sources_exclude_filter.append("test")
    sources_exclude_filter.append("harfbuzz")

    for item in all_files:
        arr_split = os.path.splitext(item)
        if len(arr_split) == 0:
            continue
        ext = arr_split[-1]
        if (ext == ".h") or (ext == ".hh") or (ext == ".c") or (ext == ".cc"):
            test_file_name = os.path.basename(item)
            for extest in sources_exclude_filter:
                if (0 == test_file_name.find(extest)):
                    sources_exclude.append(item)
                    break

    for item in all_files:
        arr_split = os.path.splitext(item)
        if len(arr_split) == 0:
            continue
        ext = arr_split[-1]
        if (ext == ".h") or (ext == ".hh"):
            headers_files.append(item)
        if (ext == ".c") or (ext == ".cc"):
            sources_files.append(item)

    qmake_content_lines.append("HEADERS += \\")
    for item in headers_files:
        if item in headers_exclude:
            continue
        qmake_content_lines.append("  $$SRC_DIR/" + item + " \\")
    qmake_content_lines[-1] = qmake_content_lines[-1].replace(" \\", "")

    qmake_content_lines.append("")
    qmake_content_lines.append("SOURCES += \\")
    for item in sources_files:
        if item in sources_exclude:
            continue
        qmake_content_lines.append("  $$SRC_DIR/" + item + " \\")
    qmake_content_lines[-1] = qmake_content_lines[-1].replace(" \\", "")

    qmake_content_lines.append("")

    if len(headers_exclude) != 0:
        qmake_content_lines.append("#HEADERS += \\")
        for item in headers_exclude:
            qmake_content_lines.append("#  $$SRC_DIR/" + item + " \\")
        qmake_content_lines[-1] = qmake_content_lines[-1].replace(" \\", "")
        qmake_content_lines.append("")

    if len(sources_exclude) != 0:
        qmake_content_lines.append("#SOURCES += \\")
        for item in sources_exclude:
            qmake_content_lines.append("#  $$SRC_DIR/" + item + " \\")
        qmake_content_lines[-1] = qmake_content_lines[-1].replace(" \\", "")
        qmake_content_lines.append("")
    else:
        qmake_content_lines.append("")

    with open("./harfbuzz.pri", "w") as file:
        file.write("\n".join(qmake_content_lines))


if __name__ == "__main__":
    gen_qmake()
    sys.exit(0)
