VERSION="6.5"
TAR="$GNU_MIRROR/ncurses/ncurses-$VERSION.tar.gz"
WEBSITE=https://invisible-island.net/ncurses

configure() {
	./configure --host="$HOST" --prefix="$PREFIX" \
	--with-pkg-config=$PKG_CONFIG \
	--with-pkg-config-libdir=/usr/lib/pkgconfig \
	--enable-pc-files \
	--enable-sigwinch \
	--disable-widec \
	--without-ada \
	--without-dlsym \
	--without-cxx-binding
}

build() {
	make all -j$NPROC
}

install() {
	make install DESTDIR="$DESTDIR"
}
