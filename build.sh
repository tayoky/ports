#!/bin/sh

#default build and configure
configure() {
	true
}

build() {
	true
}

#source the config and export
. ./config.mk
export CC
export LD
export AS
export AR
export NM
export PKGCONFIG

#SRC is the directory of the port
export SRC="$PWD/ports/$1"

#source the config file
. $SRC/$1.sh

#some configs stuff
NPROC=$(nproc)

#if tar download tar instead of cloning repo
if [ "$TAR" != "" ] ; then
	mkdir -p tar
	cd tar
	NAME=$(basename "$TAR")
	if [ ! -s $NAME ] ; then
		echo "download $TAR"
		curl $TAR > $NAME
	fi
	if [ ! -d $1 ] ; then
		tar xf $NAME
		mv ${NAME%%.tar*} $1
	fi
else
	#clone the repo
	mkdir -p git
	cd git
	git clone --depth=1 $GIT --recurse $1
	if [ "$COMMIT" != "" ] ; then
		(cd $1 && git fetch --depth=1 origin $COMMIT && git checkout --detach $COMMIT )
	fi
	if [ "$TAG" != "" ] ; then
		(cd $1 && git fetch --depth=1 origin refs/tags/$TAG:refs/tags/$TAG && git checkout --detach $TAG)
	fi
fi
cd $1

#now apply the patch if needed
if [ -d $SRC/patch ] ; then
	echo "apply patch"
	for PATCH in $(ls $SRC/patch) ; do
		patch -ruN -f -p1 -i $SRC/patch/$PATCH
	done
fi

#run configuration if any
(configure)

#run build if any
(build)
