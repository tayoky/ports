#!/bin/sh

./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"

#we need to specify custom CFLAGS
echo 'CFLAGS = -Wall \
    -Wextra \
    -std=gnu11 \
    -fno-stack-protector \
    -fno-stack-check \
    -fno-PIC \
	-mno-80387 \
	-mno-mmx \
	-mno-red-zone '>> config.mk