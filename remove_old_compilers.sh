#!/bin/bash

KEEP_LAST=5
S3=s3://compiler-explorer/opt/

remove_older() {
    local compiler=$1
    for old_file in $(aws s3 ls ${S3} | grep -oE "${compiler}"'-trunk-[0-9]+.*' | sort | head -n -${KEEP_LAST}); do
        echo Removing ${S3}${old_file}
        aws s3 rm ${S3}${old_file}
    done
}

remove_older_master() {
    local compiler=$1
    for old_file in $(aws s3 ls ${S3} | grep -oE "${compiler}"'-master-[0-9]+.*' | sort | head -n -${KEEP_LAST}); do
        echo Removing ${S3}${old_file}
        aws s3 rm ${S3}${old_file}
    done
}

# try to keep this in the same order as admin-daily-builds.sh
remove_older llvm
remove_older gcc
remove_older gcc-lock3-contracts
remove_older gcc-lock3-contract-labels
remove_older gcc-cxx-modules
remove_older gcc-cxx-coroutines
remove_older gcc-embed
remove_older gcc-static-analysis
remove_older_master gcc-gccrs
remove_older clang
remove_older clang-assertions
remove_older clang-cppx
remove_older clang-cppx-ext
remove_older clang-cppx-p2320
remove_older clang-relocatable
remove_older clang-autonsdmi
remove_older clang-lifetime
remove_older clang-llvmflang
remove_older clang-parmexpr
remove_older clang-patmat
remove_older clang-embed
remove_older go
remove_older tinycc
remove_older cc65
remove_older_master mrustc
remove_older_master cproc
remove_older_master rustc-cg-gcc
remove_older arm32
remove_older arm64
