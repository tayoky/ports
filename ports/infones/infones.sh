GIT=https://github.com/jay-kumogata/InfoNES
COMMIT=4debf50a819ea3de9ddbd267ea4bc95560f35146

configure () {
	cmake -B build -S . --toolchain="$CMAKE_CROSS" -DCMAKE_INSTALL_PREFIX="$PREFIX" \
	-DSDL_INCLUDE_DIR="$DESTDIR$PREFIX/include/SDL" \
	-DSDL_LIBRARY="-lSDL"
}

build() {
	make -C build -j$NPROC
}

install() {
	cp build/InfoNES "$DESTDIR/$PREFIX/bin"
}
