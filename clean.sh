#!/bin/sh

#source the config file
. ./ports/$1/$1.ini

#delete the repo
rm -fr git/$1
