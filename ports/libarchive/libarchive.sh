VERSION="3.8.8"
TAR="https://www.libarchive.org/downloads/libarchive-$VERSION.tar.xz"
WEBSITE="https://www.libarchive.org/"
DEPENDENCIES="zlib"

configure() {
	cmake -B build -S . --toolchain="$CMAKE_CROSS" -DCMAKE_INSTALL_PREFIX="$PREFIX" \
	-DZLIB_INCLUDE_DIR="$DESTDIR$PREFIX/include" -DZLIB_LIBRARY="-lz"
}

build() {
	make -C build -j$NPROC
}

install() {
	make -C build install DESTDIR="$DESTDIR"
}
