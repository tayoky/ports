GIT=https://github.com/tayoky/tash
COMMIT=76038d21b1d78113e7ce7f8129c05deac26ce535

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
