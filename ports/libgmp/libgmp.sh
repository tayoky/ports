VERSION=6.3.0
TAR="$GNU_MIRROR/gmp/gmp-$VERSION.tar.xz"
WEBSITE=https://gmplib.org/

configure() {
	./configure --host="$HOST" \
	--prefix="$PREFIX" --disable-cxx
}

build() {
	make all -j$NPROC
}

install() {
	make install-strip DESTDIR="$DESTDIR"
}
