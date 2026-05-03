VERSION=4.2.2
MIRROR=https://ftp.gnu.org/gnu/
TAR="$MIRROR/mpfr/mpfr-$VERSION.tar.xz"
WEBSITE=https://www.mpfr.org/

configure() {
	./configure --host="$HOST" --target="$HOST" \
	--prefix="$PREFIX"
}

build(){
	make all -j$NPROC
}

install(){
	make install-strip DESTDIR="$DESTDIR"
}
