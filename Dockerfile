FROM ubuntu:26.04

WORKDIR /workdir

# Pinned PACKAGE_VERSION arguments may go out of date and they might start breaking the builds.
# This is a desired behaviour. When builds start to break the PACKAGE_VERSION change must be manually
# verified.
#
# When changing PACKAGE_VERSION's be sure to verify changes in ABI, and test the change before publishing.

ARG GCC_VERSION=16
ARG GCC_PACKAGE_VERSION=16-20260322-1ubuntu1

ARG CLANG_VERSION=22
ARG LLVM_PACKAGE_VERSION=1:22.1.2-1ubuntu1

ARG CPPCHECK_PACKAGE_VERSION=2.19.0-3
ARG GCOVR_PACKAGE_VERSION=7.2+really-2
ARG GDB_PACKAGE_VERSION=17.1-2ubuntu1

ARG CMAKE_PACKAGE_VERSION=4.2.3-2ubuntu2
ARG NINJA_PACKAGE_VERSION=1.13.2-1
ARG CCACHE_PACKAGE_VERSION=4.12.3-1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc-${GCC_VERSION}=${GCC_PACKAGE_VERSION} \
    g++-${GCC_VERSION}=${GCC_PACKAGE_VERSION} \
    clang-${CLANG_VERSION}=${LLVM_PACKAGE_VERSION} \
    lld-${CLANG_VERSION}=${LLVM_PACKAGE_VERSION} \
    clang-tidy-${CLANG_VERSION}=${LLVM_PACKAGE_VERSION} \
    clang-format-${CLANG_VERSION}=${LLVM_PACKAGE_VERSION} \
    libclang-rt-${CLANG_VERSION}-dev=${LLVM_PACKAGE_VERSION} \
    cmake=${CMAKE_PACKAGE_VERSION} \
    cmake-data=${CMAKE_PACKAGE_VERSION} \
    ninja-build=${NINJA_PACKAGE_VERSION} \
    ccache=${CCACHE_PACKAGE_VERSION} \
    cppcheck=${CPPCHECK_PACKAGE_VERSION} \
    gcovr=${GCOVR_PACKAGE_VERSION} \
    gdb=${GDB_PACKAGE_VERSION} \
    git \
    curl \
    ca-certificates \
    gpg \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${GCC_VERSION} 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${GCC_VERSION} 100 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${CLANG_VERSION} 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${CLANG_VERSION} 100

RUN gcc --version && \
    g++ --version && \
    clang --version && \
    clang++ --version && \
    cmake --version && \
    ctest --version && \
    ninja --version && \
    ccache --version
