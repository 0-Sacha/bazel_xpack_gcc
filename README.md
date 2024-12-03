[![bazel_xpack_gcc](https://github.com/0-Sacha/bazel_xpack_gcc/actions/workflows/xpack-gcc.yml/badge.svg)](https://github.com/0-Sacha/bazel_xpack_gcc/actions/workflows/xpack-gcc.yml)

# bazel_xpack_gcc

A Bazel module that configure a gcc toolchain for Linux, using `The xPack GCC` from [xpack-dev-tools/gcc-xpack](https://github.com/xpack-dev-tools/gcc-xpack).

## How to Use
MODULE.bazel
```python
bazel_dep(name = "rules_cc", version = "0.0.10")
bazel_dep(name = "platforms", version = "0.0.10")

# use the latest commit avaible
git_override(module_name="bazel_utilities", remote="https://github.com/0-Sacha/bazel_utilities.git", commit="fbb17685ac9ba78fef914a322e6c37839dc16d4f")
git_override(module_name="bazel_xpack_gcc", remote="https://github.com/0-Sacha/bazel_xpack_gcc.git")

bazel_dep(name = "bazel_utilities", version = "0.0.1", dev_dependency = True)
bazel_dep(name = "bazel_xpack_gcc", version = "0.0.1", dev_dependency = True)

xpack_gcc_toolchain_extension = use_extension("@bazel_xpack_gcc//:rules.bzl", "xpack_gcc_toolchain_extension", dev_dependency = True)
inject_repo(xpack_gcc_toolchain_extension, "platforms", "bazel_utilities")
xpack_gcc_toolchain_extension.winlibs_toolchain(
    name = "xpack_gcc",
    copts = [],
)
use_repo(xpack_gcc_toolchain_extension, "xpack_gcc")
register_toolchains("@xpack_gcc//:toolchain")
```
It provide the toolchain `@<repo>//:toolchain`
You can use these toolchains to compile any cc_rules in your project.
