#!/bin/sh

SRC=$(realpath ./ports/$1)

#just in case variables weren't exported
. ./config.mk

. $SRC/$1.ini

if [ "$git" != "" ] ; then
	cd git/$1
elif [ "$tar" != "" ] ; then
	cd tar/$1
else
	echo "error : no git or tar specified"
	exit
fi

($install)
