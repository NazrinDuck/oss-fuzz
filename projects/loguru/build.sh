#!/bin/bash -eu

pushd $SRC/loguru
mkdir build
(cd build || exit 1 && cmake .. && make)
popd

for fuzzer in $(find $SRC/loguru/fuzz -name "*_fuzzer.cpp"); do
  fuzzer_basename=$(basename -s .cpp $fuzzer)
  $CXX $CXXFLAGS $LIB_FUZZING_ENGINE \
    -I$SRC/loguru \
    "$fuzzer" $SRC/loguru/build/libloguru.a \
    -o $OUT/$fuzzer_basename
done
