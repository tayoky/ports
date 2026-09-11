#!/bin/sh

. ./port.sh

port_init "$1" || exit 1

# make the directories where to install
PACKAGE="$(realpath -m "packages/$NAME")"
rm -fr "$PACKAGE"
mkdir -p "$PACKAGE/$PREFIX"

# set DESTDIR
export DESTDIR="$PACKAGE"

port_install

# generate the package info file
cd "$PACKAGE"
mkdir -p "$DESTDIR$PREFIX/tapm"
echo "package=$NAME
version=$VERSION
dependecies=$DEPEDENCIES" > "$DESTDIR$PREFIX/tapm/$NAME.ini"

# make the tar
tar -cz * -f ../$NAME.tar.gz

# generate sig
cd ..
sha256sum $NAME.tar.gz | cut -d " " -f1 > $NAME.tar.gz.sha256
