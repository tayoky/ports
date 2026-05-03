#!/bin/sh

. ./port.sh

port_init "$1" || exit 1

port_download || exit 1
port_configure || exit 1
port_build || exit 1
