""

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "toolchain_internal_every_files",
    srcs = glob(["**"]),
)

###################
####### gcc #######
###################

filegroup(
    name = "cpp",
    srcs = ["bin/cpp%{extention}"],
)
filegroup(
    name = "cc",
    srcs = ["bin/gcc%{extention}"],
)
filegroup(
    name = "cxx",
    srcs = ["bin/g++%{extention}"],
)
filegroup(
    name = "as",
    srcs = ["bin/as%{extention}"],
)
filegroup(
    name = "ar",
    srcs = ["bin/ar%{extention}"],
)
filegroup(
    name = "ld",
    srcs = ["bin/ld%{extention}"],
)

filegroup(
    name = "objcopy",
    srcs = ["bin/objcopy%{extention}"],
)
filegroup(
    name = "strip",
    srcs = ["bin/strip%{extention}"],
)

filegroup(
    name = "cov",
    srcs = ["bin/gcov%{extention}"],
)

filegroup(
    name = "size",
    srcs = ["bin/size%{extention}"],
)
filegroup(
    name = "nm",
    srcs = ["bin/nm%{extention}"],
)
filegroup(
    name = "objdump",
    srcs = ["bin/objdump%{extention}"],
)
filegroup(
    name = "dwp",
    srcs = ["bin/dwp%{extention}"],
)

filegroup(
    name = "dbg",
    srcs = ["bin/gdb%{extention}"],
)

filegroup(
    name = "toolchain_includes",
    srcs = glob([
        "lib/gcc/x86_64-w64-mingw32/%{gcc_version}/include/**",
        "lib/gcc/x86_64-w64-mingw32/%{gcc_version}/include-fixed/**",
        "x86_64-w64-mingw32/include/**",
        "include/**",
    ]),
)

filegroup(
    name = "toolchain_libs",
    srcs = glob([
        "lib/gcc/x86_64-w64-mingw32/%{gcc_version}/*",
        "x86_64-w64-mingw32/lib/*",
        "lib/*",
    ]),
)

filegroup(
    name = "toolchain_bins",
    srcs = glob([
        "x86_64-w64-mingw32/bin/*%{extention}",
        "bin/*%{extention}",
    ]),
)
