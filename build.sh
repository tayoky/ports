#!/bin/sh

#source the config
#just in case it wasen't aready done
. ./config.mk

cd ports/$1

#SRC is where all the script are
export SRC="$PWD"

#source the config file
. ./$1.ini

cd ../..

#clone the repo
mkdir -p git
cd git
git clone $git --recurse $1

#now apply the patch if needed
if [ "$patch" != "" ] ; then
	echo $(cd $1 && git apply ${SRC}/$patch)
fi

#run configuration if any
(cd $1 ; $configure)

#run build if any
(cd $1 ; $build)
