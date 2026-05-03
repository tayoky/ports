GIT=https://github.com/tayoky/tash
COMMIT=5bc2f93e9b1a4a0f016f4e15404153eb2b3d3aab

configure() {
	./configure --host="$HOST" --cc=$CC --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install DESTDIR="$DESTDIR"
}
