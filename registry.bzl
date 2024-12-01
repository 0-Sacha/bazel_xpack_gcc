"""MinGW registry
"""

load("@bazel_utilities//toolchains:registry.bzl", "gen_archives_registry")

XPACK_GCC_14_2_0 = {
    "toolchain": "xpack",
    "version": "14.2.0-1",
    "version-short": "14.2",
    "latest": True,
    "details": { "gcc_version": "14.2.0" },
    "archives": {
        "linux_x86_64": {
            "url": "https://github.com/xpack-dev-tools/gcc-xpack/releases/download/v14.2.0-1/xpack-gcc-14.2.0-1-linux-x64.tar.gz",
            "sha256": "F1A5DB554874B27812E6286D242200430D9C5FB62BC04F4E59D6FE47D498AF5A",
            "strip_prefix": "xpack-gcc-14.2.0-1",
        }
    }
}

XPACK_GCC_REGISTRY = gen_archives_registry([
    XPACK_GCC_14_2_0,
])