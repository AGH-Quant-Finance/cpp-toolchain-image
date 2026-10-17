# cpp-toolchain-image

Common building environment image for agh-quant-finance C++ repositories

## Overview

This Docker image serves as the CBE (*Common Build Environment*) for local development and CI. Published images currently target `linux/amd64`; other architectures require compatible Docker emulation and are not validated natively by this repository.

It should be used both on CI and during local development.

When testing changes - builds and tests must pass on this container.

## How the container is stored

cpp-toolchain-image is stored pre-built in GitHub Image Registry. It can be accessed via [web ui](https://github.com/AGH-Quant-Finance/cpp-toolchain-image/pkgs/container/cpp-toolchain-image). To pull it onto your machine run:

```bash
docker pull ghcr.io/agh-quant-finance/cpp-toolchain-image:latest
```

If you encounter any troubles with access to the image, contact [Piotr Walczak](https://github.com/piti83) directly via GitHub, email or Discord.

## Implementing cpp-toolchain-image usage in new and existing repositories

To automate the process, it is strongly suggested to write automatic building scripts as an extra abstraction layer over CMake.

You can check examples written in Python and bash in [examples](./examples/) directory.

## Versioning

This repository follows [Semantic Versioning](https://semver.org/) rules. Every commit should be prefixed with [MAJOR], [MINOR] or [PATCH].

The examples use `latest` for quick starts. For project CI and reproducible experiments, pin a tested image version (currently `ghcr.io/agh-quant-finance/cpp-toolchain-image:0.1.3`) or digest in the consuming repository.

Upgrade pinned versions deliberately after testing the consuming project against the new toolchain. Keep the version visible in its build instructions.

## Pull-request checks

PR CI checks the version prefix and builds the image without publishing it. It then compiles a small C++20 program with GCC and Clang through CMake/Ninja and executes both builds with CTest. These checks exercise the container tools; downstream projects must still run their own tests.

To reproduce the image build and smoke checks locally:

```bash
docker build --tag qf-toolchain-smoke:local .
docker run --rm --network none --volume "$PWD:/workspace:ro" --workdir /workspace qf-toolchain-smoke:local bash tests/smoke.sh
```

The smoke script creates its build directories in the disposable container. Release publishing remains in `.github/workflows/release.yml` and only runs on pushes to `main`. Keep the version prefix in the final merge commit subject; the existing release workflow derives its version bump from that subject. PR-title validation reruns after title edits.

On SELinux hosts, the local bind mount may need `:ro,Z` instead of `:ro`. Relabel only your working copy; this is not needed on the Ubuntu GitHub runner.

## Contributing

If You wish to add, modify or remove something from cpp-toolchain-image please do so via pull request, with good explanation of why and how it will affect all repositories that rely on this image.

If there is no reaction to your pull request for more than 2 days, contact [Piotr Walczak](https://github.com/piti83) directly via GitHub, email or Discord.
