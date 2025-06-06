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

#SRC is the directory of the port
export SRC="$PWD/ports/$1"

#source the config file
. $SRC/$1.sh

#if tar download tar instead of cloning repo
if [ "$TAR" != "" ] ; then
	mkdir -p tar
	cd tar
	curl $TAR > $(basename "$TAR")
	tar xf $TAR
else
	#clone the repo
	mkdir -p git
	cd git
	git clone --depth=1 $GIT --recurse $1
	if [ "$COMMIT" != "" ] ; then
		(cd $1 && git fetch --depth=1 origin $COMMIT && git checkout $COMMIT)
	fi
fi
cd $1

#now apply the patch if needed
if [ -d $SRC/patch ] ; then
	git apply $SRC/patch/*.patch
fi

#run configuration if any
(configure)

#run build if any
(build)
