#!/bin/sh

./configure --prefix=$PREFIX --sysroot=$SYSROOT --targetos=stanix --enable-static --cc=$CC --triplet=x86_64-stanix --extra-cflags='-Wall
    -Wextra
    -std=gnu11
    -ffreestanding
    -fno-stack-protector
    -fno-stack-check
    -fno-PIC
    --sysroot='$SYSROOT'
    -isystem='$SYSROOT'/usr/include
	-m64
	-march=x86-64
	-mno-mmx
	-mno-sse2
	-mno-red-zone
	-mcmodel=kernel
	-Dx86_64' --extra-ldflags='--sysroot="'$SYSROOT'"
    -nostdlib -nodefaultlibs
    -static
    '$SYSROOT'/usr/lib/crt0.o
    -L '$SYSROOT'/usr/lib/ -lc' 

echo '#define CONFIG_TCC_STATIC 1
#define CONFIG_TCC_SEMLOCK 0
#define TARGETOS_stanix 1' >> config.h