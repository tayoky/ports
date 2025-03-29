include config.mk

#export so subscript and submakefile can use it
export PREFIX
export HOST
export CC
export LD

#make the list of port
PORTS = $(shell echo ports/*/ | xargs -n 1 basename)

warn-all :
	$(warning are you sure you want to build every port ? if yes run make all)

all : ${PORTS}

% : ports/%
	./build.sh $@
clean :
	$(foreach PORT, ${PORTS} , ./clean.sh ${PORT} && ) true
	rm -fr git

config.mk :
	$(error run ./configure before running make)
