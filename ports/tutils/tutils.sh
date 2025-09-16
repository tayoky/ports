GIT=https://github.com/tayoky/tutils
COMMIT=a0778b3a62c296cc8f9405cbe8dae9b16a6d2baf

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
