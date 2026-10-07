#!/usr/bin/env python3

# This example is very minimal
# In real use scenario You should probably add some
# configurable parameters for building and testing

import subprocess

IMAGE = "ghcr.io/agh-quant-finance/cpp-toolchain-image:latest"

subprocess.run([
    "docker", "run", "--rm",
    "-v", f"{__import__('os').getcwd()}:/workspace",
    "-w", "/workspace",
    IMAGE,
    "bash", "-c",
    "cmake -S . -B build -G Ninja && cmake --build build"
], check=True)
