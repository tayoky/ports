GIT=https://github.com/tayoky/tash
COMMIT=6a77f520e291cb42359810569aa740ea9c8a993c

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
