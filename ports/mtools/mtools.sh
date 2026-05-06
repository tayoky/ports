VERSION="4.0.49"
TAR="$GNU_MIRROR/mtools/mtools-$VERSION.tar.gz"
WEBSITE="https://www.gnu.org/software/mtools/"

configure() {
	./configure --host="$HOST" --prefix="$PREFIX" CFLAGS=-Wno-error
}

build() {
	make all -j$NPROC
}

install() {
	make install DESTDIR="$DESTDIR"
}
