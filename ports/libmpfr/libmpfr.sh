VERSION="4.2.2"
TAR="$GNU_MIRROR/mpfr/mpfr-$VERSION.tar.xz"
WEBSITE="https://www.mpfr.org/"
DEPENDENCIES="libgmp"

configure() {
	./configure --host="$HOST" --target="$HOST" \
	--prefix="$PREFIX"
}

build() {
	make all -j$NPROC
}

install() {
	make install-strip DESTDIR="$DESTDIR"
}
