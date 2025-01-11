""

load("@bazel_utilities//toolchains:cc_toolchain_config.bzl", "cc_toolchain_config")

package(default_visibility = ["//visibility:public"])


filegroup(
    name = "toolchain_every_files",
    srcs = [
        "%{compiler_package}:toolchain_internal_every_files",
    ] + %{toolchain_extras_filegroups}
)

filegroup(
    name = "toolchain_internal_every_files",
    srcs = glob(["**"]),
)

cc_toolchain_config(
    name = "cc_toolchain_config_%{toolchain_id}",
    toolchain_identifier = "%{toolchain_id}",

    compiler_type = "gcc",

    toolchain_bins = {
        "%{compiler_package}:cpp": "cpp",
        "%{compiler_package}:cc": "cc",
        "%{compiler_package}:cxx": "cxx",
        "%{compiler_package}:as": "as",
        "%{compiler_package}:ar": "ar",
        "%{compiler_package}:ld": "ld",

        "%{compiler_package}:objcopy": "objcopy",
        "%{compiler_package}:strip": "strip",

        "%{compiler_package}:cov": "cov",

        "%{compiler_package}:size": "size",
        "%{compiler_package}:nm": "nm",
        "%{compiler_package}:objdump": "objdump",
        "%{compiler_package}:dwp": "dwp",
        "%{compiler_package}:dbg": "dbg",
    },
    
    toolchain_builtin_includedirs = [
        "%{compiler_package_path}lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}/include",
        "%{compiler_package_path}lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}/include-fixed",
        "%{compiler_package_path}lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}/include-fixed/x86_64-linux-gnu",

        "%{compiler_package_path}include/c++/%{gcc_version}",
        "%{compiler_package_path}include/c++/%{gcc_version}/x86_64-pc-linux-gnu",

        "/usr/include",
    ],

    copts = %{copts}, # [ "--no-standard-includes" ]
    conlyopts = %{conlyopts},
    cxxopts = %{cxxopts},
    linkopts = %{linkopts},
    defines = %{defines},
    includedirs = %{includedirs},
    linkdirs = [
        "%{compiler_package_path}lib/gcc/x86_64-pc-linux-gnu/%{gcc_version}",
        "%{compiler_package_path}x86_64-pc-linux-gnu/lib",
    ] + %{linkdirs},

    linklibs = %{linklibs},
)

cc_toolchain(
    name = "cc_toolchain_%{toolchain_id}",
    toolchain_identifier = "%{toolchain_id}",
    toolchain_config = ":cc_toolchain_config_%{toolchain_id}",
    
    # TODO: Current fix for Sandboxed build # "%{compiler_package}:all_files",
    all_files = ":toolchain_every_files",
    compiler_files = ":toolchain_every_files",
    linker_files = ":toolchain_every_files",
    ar_files = ":toolchain_every_files",
    as_files = ":toolchain_every_files",
    objcopy_files = ":toolchain_every_files",
    strip_files = ":toolchain_every_files",
    dwp_files = ":toolchain_every_files",
    coverage_files = ":toolchain_every_files",

    # dynamic_runtime_lib
    # static_runtime_lib
    # supports_param_files
)

toolchain(
    name = "toolchain",
    toolchain = ":cc_toolchain_%{toolchain_id}",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",

    exec_compatible_with = %{exec_compatible_with},
    target_compatible_with = %{target_compatible_with},
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


filegroup(
    name = "all_files",
    srcs = [
        "%{compiler_package}:toolchain_includes",
        "%{compiler_package}:toolchain_libs",
        "%{compiler_package}:toolchain_bins",
    ],
)

filegroup(
    name = "compiler_files",
    srcs = [
        "%{compiler_package}:toolchain_includes",
        "%{compiler_package}:cpp",
        "%{compiler_package}:cc",
        "%{compiler_package}:cxx",
    ],
)

filegroup(
    name = "linker_files",
    srcs = [
        "%{compiler_package}:toolchain_libs",
        "%{compiler_package}:cc",
        "%{compiler_package}:cxx",
        "%{compiler_package}:ld",
        "%{compiler_package}:ar",
    ],
)

filegroup(
    name = "coverage_files",
    srcs = [
        "%{compiler_package}:toolchain_includes",
        "%{compiler_package}:toolchain_libs",
        "%{compiler_package}:cc",
        "%{compiler_package}:cxx",
        "%{compiler_package}:ld",
        "%{compiler_package}:cov",
    ],
)

filegroup(
    name = "compiler_components",
    srcs = [
        "%{compiler_package}:cpp",
        "%{compiler_package}:cc",
        "%{compiler_package}:cxx",
        "%{compiler_package}:ar",
        "%{compiler_package}:ld",

        "%{compiler_package}:objcopy",
        "%{compiler_package}:strip",

        "%{compiler_package}:cov",

        "%{compiler_package}:nm",
        "%{compiler_package}:objdump",
        "%{compiler_package}:as",
        "%{compiler_package}:size",
        "%{compiler_package}:dwp",
        
        "%{compiler_package}:dbg",
    ],
)
