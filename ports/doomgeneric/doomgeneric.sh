GIT=https://github.com/ozkl/doomgeneric.git
COMMIT=dd975839780b4c957c4597f77ccadc3dc592a038
WEBSITE=https://ozkl.github.io/

build() {
	#pretty weird but make must be run in a sub dir
	cd doomgeneric
	make -f Makefile.stanix SYSROOT="$SYSROOT"
}

install() {
	cd doomgeneric
	cp ./doom "${PREFIX}/bin"
}
