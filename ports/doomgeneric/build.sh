#!/bin/sh

#pretty weird but make must be run in a sub dir
cd doomgeneric
make -f Makefile.stanix SYSROOT="$SYSROOT"
