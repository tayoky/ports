#!/bin/sh

./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"

#we gonne need the sysroot in the patched makefile
echo "SYSROOT=$SYSROOT" >> config.mk

#we need to specify custom CFLAGS
echo 'CFLAGS = -Wall \
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
	-mcmodel=kernel\
	-Dx86_64' >> config.mk

#custom LDFLAGS not that this one only work on the patched makefile
echo 'LDFLAGS += \
    -nostdlib \
    -static \' >> config.mk