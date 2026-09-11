GIT=https://github.com/libsdl-org/sdl2-compat
VERSION=2.32.70
TAG=release-$VERSION
WEBSITE=https://libsdl.org/
DEPENDENCIES="sdl3"

configure () {
	cmake -B build -S . --toolchain="$CMAKE_CROSS" -DCMAKE_INSTALL_PREFIX="$PREFIX" \
	-DSDL2COMPAT_X11=OFF -DSDL2COMPAT_TESTS=OFF -DSDL2COMPAT_VENDOR_INFO="Stanix"
}

build() {
	make -C build -j$NPROC
}

install() {
	make -C build install DESTDIR="$DESTDIR"
}
