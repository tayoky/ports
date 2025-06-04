#!/bin/sh

#source the config
#just in case it wasen't aready done
. ./config.mk

export CC
export LD

cd ports/$1

#SRC is where all the script are
export SRC="$PWD"

#source the config file
. ./$1.ini

cd ../..

#if tar download tar instead of clonging repo
if [ "$tar" != "" ] ; then
	mkdir -p tar
	cd tar
	curl "$tar" > $(basename "$tar")
	exit
else
	#clone the repo
	mkdir -p git
	cd git
	git clone --depth=1 $git --recurse $1
	if [ "$commit" != "" ] ; then
		(cd $1 && git fetch --depth=1 origin $commit && git checkout $commit)
	fi
fi

#now apply the patch if needed
if [ "$patch" != "" ] ; then
	echo $(cd $1 && git apply ${SRC}/$patch)
fi

#run configuration if any
(cd $1 ; $configure)

#run build if any
(cd $1 ; $build)
