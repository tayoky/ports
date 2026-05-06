#!/bin/sh

. ./port.sh

port_init "$1" || exit 1

if [ "$NAME" ] ; then
	echo "name        : $NAME"
fi

if [ "$VERSION" ] ; then
	echo "version     : $VERSION"
fi

if [ "$WEBSITE" ] ; then
	echo "website     : $WEBSITE"
fi

if [ "$GIT" ] ; then
	[ "$COMMIT" ] || COMMIT="HEAD"
	echo "git repo    : $GIT#$COMMIT"
fi

if [ "$TAR" ] ; then
	echo "tar         : $TAR"
fi

if [ "$dependencies" ] ; then
	echo "dependencies: $(cat $dependencies)"
fi
if [ "$DESC" ] ; then
	echo "description : $DESC"
fi
