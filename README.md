# cpp-toolchain-image

Common building environment image for agh-quant-finance C++ repositories

## Overview

This docker image was created to serve as CBE (*Common Build Environment*). It unifies tools versions and makes it possible to contribute and test software on all operating systems and architectures. 

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

As the versions change overtime, builds might start to fail on older repositories. In such case, pin a specific version to a repository in build scripts.

>[!TIP]
> Altough pinning a specific image version might seem easier to keep the CI green, it is suggested to make necessary adjustments in given repository to comply with latest CBE

## Contributing

If You wish to add, modify or remove something from cpp-toolchain-image please do so via pull request, with good explanation of why and how it will affect all repositories that rely on this image.

If there is no reaction to your pull request for more than 2 days, contact [Piotr Walczak]((https://github.com/piti83)) directly via GitHub, email or Discord.
