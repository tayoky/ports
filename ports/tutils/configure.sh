#!/bin/sh

#we need to specify custom CFLAGS
CFLAGS='-Wall\
    -Wextra \
    -std=gnu11 \
    -ffreestanding \
    -fno-stack-protector \
    -fno-stack-check \
    -fno-PIC \
    --sysroot=${SYSROOT}\
    -isystem=${SYSROOT}/usr/include \
	-m64 \
	-march=x86-64 \
	-mno-80387 \
	-mno-mmx \
	-mno-sse \
	-mno-sse2 \
	-mno-red-zone \
	-mcmodel=kernel'

./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX" --no-qsort --with-CFLAGS="$CFLAGS"

#custom LDFLAGS not that this one only work on the patched makefile
echo 'LDFLAGS += \
    -nostdlib \
    -static' >> config.mk

#the original configure script don't use LD
echo LD="$LD" >> config.mk

#the configure script don't support SYSROOT
echo "SYSROOT=$SYSROOT" >> config.mk