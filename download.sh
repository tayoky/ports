#!/bin/sh

PATTERN="*"

if test -n "$1" ; then
	PATTERN="$1.tar.gz"
fi

gh release download --pattern "$PATTERN" --dir "packages"
