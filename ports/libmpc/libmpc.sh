VERSION="1.4.1"
TAR="$GNU_MIRROR/mpc/mpc-$VERSION.tar.xz"
WEBSITE="https://www.multiprecision.org/"

configure() {
	./configure --host="$HOST" --target="$HOST" \
	--prefix="$PREFIX" --with-sysroot="$SYSROOT"
}

build(){
	make all -j$NPROC
}

install(){
	make install-strip DESTDIR="$DESTDIR"
}
