add_library(CompoundFileLib STATIC)

target_sources(CompoundFileLib PRIVATE
    RBTree/rbtree.cpp
    Stream/fstream_utils.cpp
    Stream/stream_utils.cpp
    cfitem.cpp
    cfstorage.cpp
    cfstream.cpp
    compoundfile.cpp
    directoryentry.cpp
    header.cpp
    sector.cpp
    sectorcollection.cpp
    streamrw.cpp
    streamview.cpp
)
