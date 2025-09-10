VERSION='6.5'
TAR="https://ftp.gnu.org/gnu/ncurses/ncurses-$VERSION.tar.gz"

configure() {
	./configure --host=$HOST --prefix=/usr \
	--with-pkg-config=$PKG_CONFIG \
	--with-pkg-config-libdir=/usr/lib/pkgconfig \
	--enable-pc-files \
	--enable-sigwinch \
	--disable-widec \
	--without-ada \
	--without-dlsym \
	--without-cxx-binding
}

build(){
	make all -j$NPROC
}

install(){
	make install DESTDIR=${PREFIX%%/usr}
}
