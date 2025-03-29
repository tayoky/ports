#!/bin/sh

cd $1

#source the config file
. ./$1.ini

#run clean if any
(cd $1 ; $clean)

#delete the repo
rm -fr $1
