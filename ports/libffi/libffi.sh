VERSION=3.8.0
TAR="https://github.com/libffi/libffi/releases/download/v$VERSION/libffi-$VERSION.tar.gz"

configure() {
	./configure --host="$HOST" \
	--prefix="$PREFIX"
}

build() {
	make all -j$NPROC
}

install() {
	make install-strip DESTDIR="$DESTDIR"
}
