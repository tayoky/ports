#!/bin/sh

# install a package
PACKAGE="$1"

. ./port.sh

port_init "$PACKAGE" || exit 1

if ! test -f "packages/$PACKAGE.tar.gz" ; then
	./download.sh "$PACKAGE"
fi

tar -xf "packages/$PACKAGE.tar.gz" -C "$DESTDIR"
