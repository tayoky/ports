#!/bin/sh

. ./port.sh

port_init "$1" || exit 1

if test -n "$2" ; then
	export DESTDIR="$(realpath -m "$2")"
fi

port_install
