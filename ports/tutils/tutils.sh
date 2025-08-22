GIT=https://github.com/tayoky/tutils
COMMIT=1609e1b482fd23a7ccf408a9d47e22c8cf490923

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
