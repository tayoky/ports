GIT=https://github.com/tayoky/tutils
COMMIT=90ae172c309de9710479cc899f87a54f43b031f1

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
