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
	-Dx86_64'

echo '#define CONFIG_TCC_STATIC 1
#define CONFIG_TCC_SEMLOCK 0' >> config.h

echo 'LDFLAGS+= \
    -nostdlib \
    -static \
    -L '$SYSROOT'/lib/ -lc'>> config.mak