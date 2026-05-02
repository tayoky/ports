GIT=https://github.com/tayoky/tutils
COMMIT=4b24a77a1d4c40d52bd709ec952022d3a68d9d72

configure() {
	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
