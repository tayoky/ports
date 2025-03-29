#!/bin/sh

cd ports
cd $1
. ./$1.ini

if [ "$website"  ] ; then
	echo "website   : $website"
fi

if [ "$depencies" ] ; then
	echo "depencies : $(cat $depencies)"
fi
