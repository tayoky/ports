GIT=https://github.com/Wrench56/KritiC

build() {
	make static CC=$CC LD=$LD CFLAGS=-DKRITIC_DISABLE_REDIRECT PLATFORM=stanix
}

install() {
	mkdir -p "$DESTDIR/$PREFIX/lib" && cp build/libkritic.a "$DESTDIR/$PREFIX/lib"
}
