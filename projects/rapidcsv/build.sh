#!/bin/bash -eu

echo '#include "rapidcsv.h"' >$SRC/rapidcsv/src/rapidcsv.cpp

for fuzzer in $(find $SRC/rapidcsv/ -name "*_fuzzer.cpp"); do
  fuzzer_basename=$(basename -s .cpp $fuzzer)

  $CXX $CXXFLAGS $LIB_FUZZING_ENGINE \
    -I$SRC/rapidcsv/src \
    $SRC/rapidcsv/"$fuzzer_basename".cpp \
    -o $OUT/$fuzzer_basename
done
