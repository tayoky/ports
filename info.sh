#!/bin/sh

cd ports
cd $1
. ./$1.ini

if [ "$website"  ] ; then
	echo "website     : $website"
fi

if [ "$git"  ] ; then
	echo "git repo    : $git"
fi

if [ "$dependencies" ] ; then
	echo "dependencies: $(cat $dependencies)"
fi
if [ "$info" ] ; then
	echo "description : $(cat $info)"
fi
