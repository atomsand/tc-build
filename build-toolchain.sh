#!/bin/bash

set -e

print()
{
    echo -e "\e[1;31m$*\e[0m"	
}

print "Start building LLVM"
./build-llvm.py \
	--assertions \
	--build-type "Release" \
	--clang-vendor "AtomSand-$(date +%D)" \
	--incremental \
	--lto "thin" \
	--targets "AArch64;ARM" \
	--use-good-revision \
 	--additional-build-arguments "CLANG_REPOSITORY_STRING=GitHub.com/AtomSand"

print "Start building binutils"
./build-binutils.py \
	--targets arm aarch64
