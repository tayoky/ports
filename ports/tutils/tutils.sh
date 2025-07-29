GIT=https://github.com/tayoky/tutils
COMMIT=2ebfaa5df37a4290d94b9a28ae9343f54395f5a3

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
