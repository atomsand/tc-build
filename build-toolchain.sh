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
	--clang-vendor "atomsand-$(date +%D)" \
	--incremental \
	--lto "thin" \
	--targets "AArch64;ARM" \
	--shallow-clone
	
print "Start building binutils"
./build-binutils.py \
	--targets arm aarch64
