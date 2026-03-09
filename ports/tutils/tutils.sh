GIT=https://github.com/tayoky/tutils
COMMIT=bdf736e2ef3f1d1f6e158c45b0c1dae2aec8f4b1

configure() {
	# disable dynamic linking linking
	CFLAGS="$CFLAGS -static" ./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
