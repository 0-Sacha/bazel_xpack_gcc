""

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "toolchain_internal_every_files",
    srcs = glob(["**"]),
)


filegroup(
    name = "cpp",
    srcs = ["bin/cpp"],
)
filegroup(
    name = "cc",
    srcs = ["bin/gcc"],
)
filegroup(
    name = "cxx",
    srcs = ["bin/g++"],
)
filegroup(
    name = "as",
    srcs = ["bin/as"],
)
filegroup(
    name = "ar",
    srcs = ["bin/ar"],
)
filegroup(
    name = "ld",
    srcs = ["bin/ld"],
)

filegroup(
    name = "objcopy",
    srcs = ["bin/objcopy"],
)
filegroup(
    name = "strip",
    srcs = ["bin/strip"],
)

filegroup(
    name = "cov",
    srcs = ["bin/gcov"],
)

filegroup(
    name = "size",
    srcs = ["bin/size"],
)
filegroup(
    name = "nm",
    srcs = ["bin/nm"],
)
filegroup(
    name = "objdump",
    srcs = ["bin/objdump"],
)
filegroup(
    name = "dwp",
    srcs = ["bin/dwp"],
)

filegroup(
    name = "dbg",
    srcs = ["bin/gdb"],
)


filegroup(
    name = "toolchain_includes",
    srcs = glob([
        "lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}/include/**",
        "lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}/include-fixed/**",
        "x86_64-pc-linux-gnu/include/**",
        "include/**",
    ], allow_empty = True),
)

filegroup(
    name = "toolchain_libs",
    srcs = glob([
        "lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}/*",
        "x86_64-pc-linux-gnu/lib/*",
        "lib/*",
    ], allow_empty = True),
)

filegroup(
    name = "toolchain_bins",
    srcs = glob([
        "x86_64-pc-linux-gnu/bin/*",
        "bin/*",
    ], allow_empty = True),
)
