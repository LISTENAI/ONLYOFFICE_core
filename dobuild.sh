#!/usr/bin/bash

set -eo pipefail

POSITIONAL_ARGS=()

QMAKE_ARGS="INCLUDEPATH+=/boost/libs/functional/include/"
QMAKE_LFLAGS=""
CFLAGS="-w"

while [[ $# -gt 0 ]]; do
  case $1 in
    -q)
      QMAKE_ARGS+=" $2"
      shift # past argument
      shift # past value
      ;;
    -c)
      CFLAGS+=" $2"
      shift # past argument
      shift # past value
      ;;
    -l)
      QMAKE_LFLAGS+=" $2"
      shift # past argument
      shift # past value
      ;;
    --no-sanitize)
      SANITIZE=""
      shift # past argument
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

echo "# $POSITIONAL_ARGS"

qmake \
    "QMAKE_CFLAGS+=$SANITIZE $CFLAGS" \
    "QMAKE_CXXFLAGS+=$SANITIZE $CFLAGS" \
    "QMAKE_LFLAGS+=$QMAKE_LFLAGS $SANITIZE $CFLAGS" \
    "DEFINES+=__linux__ HAVE_UNISTD_H _RWSTD_NO_SETRLIMIT" \
    $QMAKE_ARGS \
    $POSITIONAL_ARGS

make -j$(nproc)
