GIT=https://github.com/tayoky/tutils
COMMIT=2e40709d590a138738dd355cdfd050317529fbab

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
