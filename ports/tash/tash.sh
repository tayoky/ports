GIT=https://github.com/tayoky/tash
TAG=v0.1.0

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
