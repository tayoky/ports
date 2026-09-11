VERSION="5.4.7"
TAR="https://www.lua.org/ftp/lua-$VERSION.tar.gz"

configure() {
	:
}

build() {
	make -j$NPROC
}

install() {
	make install INSTALL_TOP="$DESTDIR$PREFIX"
}
