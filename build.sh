#!/bin/bash -eu
rm -rf zlib
# Clone the official zlib repository
cd $SRC
git clone https://github.com/madler/zlib.git
cd zlib

# Optionally, pin to a known commit for reproducibility
# git checkout <commit-hash>

# Configure and build zlib
./configure
make -j$(nproc)

# Build the fuzzer
$CXX $CXXFLAGS -I. \
    $SRC/zlib_uncompress_fuzzer.cc -o $OUT/zlib_uncompress_fuzzer \
    $LIB_FUZZING_ENGINE libz.a
