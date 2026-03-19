GIT=https://github.com/tayoky/tutils
TAG=v0.7.0

configure() {
	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
