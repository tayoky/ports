#!/bin/sh

#default build and configure
configure() {
	true
}

build() {
	true
}

# source the config and export
. ./config.mk
export CC
export CXX
export LD
export AS
export AR
export NM
export STRIP
export PKGCONFIG
export CFLAGS

# use the toolchain from the main stanix repo if available
if test -d "../toolchain/bin" ; then
	export PATH="$(realpath ../toolchain/bin):$PATH"
fi

# PORT is the directory of the port
export PORT="$PWD/ports/$1"

# find tmp dir
if test -z "$TMPDIR" ; then
	: "${TMPDIR:=${TMP:=${TEMP:-/tmp}}}"
fi

VERSION="unknow"
NAME="$1"
# source the port file
. "$PORT/$1.sh"

# some configs stuff
export NPROC=$(nproc)
export MESON_CROSS="$(realpath ./meson-cross.txt)"
export CMAKE_CROSS="$(realpath ./cmake-cross.cmake)"

FIRST=false

# if needed download tar instead of cloning repo
if [ "$TAR" != "" ] ; then
	TAR_NAME=$(basename "$TAR")
	TAR_DIR=${TAR_NAME%%.tar*}
	mkdir -p tar
	cd tar
	if [ ! -s "$TAR_NAME" ] ; then
		echo "downloading $TAR..."
		curl -L "$TAR" -o "$TAR_NAME"
	fi
	if [ ! -d $1 ] ; then
		echo "unpacking $TAR_NAME..."
		# extract to tmp
		mkdir -p "$TMPDIR/$TAR_DIR"
		tar xf "$TAR_NAME" -C "$TMPDIR/$TAR_DIR"
		# move the child dir to main one
		mv -T "$TMPDIR/$TAR_DIR"/*/ "$1"
		rm -fr "$TMPDIR/$TAR_DIR"
		FIRST=true
	fi
else
	# clone the repo
	mkdir -p git
	cd git
	if [ ! -d $1 ] ; then
		git clone --depth=1 $GIT --recurse $1
	fi
	if [ "$COMMIT" != "" ] ; then
		(cd $1 && git fetch --depth=1 origin $COMMIT && git checkout --detach $COMMIT )
	fi
	if [ "$TAG" != "" ] ; then
		(cd $1 && git fetch --depth=1 origin refs/tags/$TAG:refs/tags/$TAG && git checkout --detach $TAG)
	fi
	FIRST=true
fi
cd $1 || exit 1

if [ "$FIRST" = "true" ] ; then 
	# now apply the patch if needed
	if [ -d $PORT/patch ] ; then
		echo "apply patch"
		for PATCH in "$PORT/patch"/*.patch ; do
			patch -ruN -f -p1 -i "$PORT/patch/$PATCH"
		done
	fi
fi

# run configuration if any
(configure)

# run build if any
(build)
