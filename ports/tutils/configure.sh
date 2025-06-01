#!/bin/sh

#we need to specify custom CFLAGS
CFLAGS='-Wall\
    -Wextra \
    -std=gnu11 \
    -ffreestanding \
    -fno-stack-protector \
    -fno-stack-check \
    -fno-PIC \
	-mno-80387 \
	-mno-mmx \
	-mno-sse \
	-mno-sse2 \
	-mno-red-zone'

./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX" --no-qsort --with-CFLAGS="$CFLAGS"