#!/bin/sh

#source the config and export
. ./config.mk
export CC
export LD

#SRC is the directory of the port
export SRC="$PWD/ports/$1"

. $SRC/$1.sh

if [ "$GIT" != "" ] ; then
	cd git/$1
elif [ "$TAR" != "" ] ; then
	cd tar/$1
else
	echo "error : no git or tar specified"
	exit
fi

install
