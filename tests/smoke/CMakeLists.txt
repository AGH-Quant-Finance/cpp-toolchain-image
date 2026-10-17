cmake_minimum_required(VERSION 3.24)
project(ToolchainSmoke LANGUAGES CXX)

enable_testing()
add_executable(toolchain-smoke main.cpp)
target_compile_features(toolchain-smoke PRIVATE cxx_std_20)
set_target_properties(toolchain-smoke PROPERTIES CXX_EXTENSIONS OFF)
add_test(NAME toolchain-smoke COMMAND toolchain-smoke)
