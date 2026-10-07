#!/usr/bin/env bash

# This example is very minimal
# In real use scenario You should probably add some
# configurable parameters for building and testing

set -euo pipefail

IMAGE="ghcr.io/agh-quant-finance/cpp-toolchain-image:latest"

docker pull "$IMAGE"

docker run --rm \
    -v "$PWD:/workspace" \
    -w /workspace \
    "$IMAGE" \
    bash -c '
        cmake -S . -B build \
            -G Ninja \
            -DCMAKE_BUILD_TYPE=Release &&
        cmake --build build
    '
