GIT=https://github.com/tayoky/tash
COMMIT=601f1655b6325afbd4de11c125fcb54cb1e362a2

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
