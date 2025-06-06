GIT=https://github.com/Wrench56/KritiC

build() {
	make static CC=$CC LD=$LD CFLAGS=-DKRITIC_DISABLE_REDIRECT PLATFORM=stanix
}

install() {
	mkdir -p $PREFIX/lib && cp build/libkritic.a $PREFIX/lib
}
