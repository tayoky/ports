GIT=https://github.com/tayoky/tutils
COMMIT=d5fa288701cdf8b62244b0253e0d9cb51fc32ce1

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
