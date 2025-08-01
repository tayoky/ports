GIT=https://github.com/tayoky/tutils
COMMIT=75a357428f3d2d7a6ab06636d62f21f8e29abbf1d

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
