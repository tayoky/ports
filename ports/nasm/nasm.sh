VERSION=2.16.03
TAR=https://www.nasm.us/pub/nasm/releasebuilds/$VERSION/nasm-$VERSION.tar.xz

configure() {
	#thanks bananymous for the --disable-gdb
	./configure --host="$HOST" --prefix="$PREFIX" --disable-gdb
}

build() {
	make
}

install() {
	make install
}
