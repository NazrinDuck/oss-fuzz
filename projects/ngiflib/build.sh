#!/bin/bash -eu

pushd $SRC/ngiflib
make -j4
popd

for fuzzer in $(find $SRC/ngiflib/ -name "*_fuzzer.cpp"); do
  fuzzer_basename=$(basename -s .cpp $fuzzer)
  $CXX $CXXFLAGS -c \
    -I$SRC/ngiflib \
    $fuzzer \
    -o $SRC/ngiflib/"$fuzzer_basename".o

  $CXX $CXXFLAGS $LIB_FUZZING_ENGINE \
    -I$SRC/ngiflib \
    $SRC/ngiflib/"$fuzzer_basename".o $SRC/ngiflib/ngiflib.o $SRC/ngiflib/ngiflibSDL.o \
    -lSDL \
    -o $OUT/$fuzzer_basename
done
