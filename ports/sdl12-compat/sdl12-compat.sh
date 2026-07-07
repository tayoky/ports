GIT=https://github.com/libsdl-org/sdl12-compat
TAG=release-1.2.76
WEBSITE=https://libsdl.org/
DEPENDENCIES="sdl2-compat"

configure () {
	cmake -B build -S . --toolchain="$CMAKE_CROSS" -DCMAKE_INSTALL_PREFIX="$PREFIX" \
	-DSDL12TESTS=OFF -DSTANIX=ON -DUNIX=ON
}

build() {
	make -C build -j$NPROC
}

install() {
	make -C build install DESTDIR="$DESTDIR"

	# symlink sdl.pc so old programs can find it
	ln -sf "sdl12_compat.pc" "$DESTDIR/$PREFIX/lib/pkgconfig/sdl.pc"
}
