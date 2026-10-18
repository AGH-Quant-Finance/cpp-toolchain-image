#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
build_root="$(mktemp -d)"
trap 'rm -rf -- "$build_root"' EXIT

for compiler in g++ clang++; do
    build_dir="$build_root/$compiler"
    cmake -S "$repo_root/tests/smoke" -B "$build_dir" -G Ninja -DCMAKE_CXX_COMPILER="$compiler" -DCMAKE_BUILD_TYPE=Release
    cmake --build "$build_dir"
    ctest --test-dir "$build_dir" --output-on-failure
done
