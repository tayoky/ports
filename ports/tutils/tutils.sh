GIT=https://github.com/tayoky/tutils
COMMIT=528eae8c46b0bbcd87679b2d6f822375fcfc5357

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
