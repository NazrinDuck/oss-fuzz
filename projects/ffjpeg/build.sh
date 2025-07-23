#!/bin/bash -eu

pushd $SRC/ffjpeg
mkdir build
#${CC} ${CFLAGS} -c -I${SRC}/ffjpeg/src \
#  $SRC/ffjpeg/src/jfif.c -o $SRC/ffjpeg/build/jfif.o
make -j4
popd

for fuzzer in $(find $SRC/ffjpeg/src/ -name "*_fuzzer.cpp"); do
  fuzzer_basename=$(basename -s .cpp $fuzzer)
  $CXX $CXXFLAGS -c \
    -I$SRC/ffjpeg/src \
    $fuzzer \
    -o $SRC/ffjpeg/build/"$fuzzer_basename".o

  $CXX $CXXFLAGS $LIB_FUZZING_ENGINE \
    -I$SRC/ffjpeg/src \
    $SRC/ffjpeg/build/"$fuzzer_basename".o $SRC/ffjpeg/src/libffjpeg.a \
    -o $OUT/$fuzzer_basename
done
