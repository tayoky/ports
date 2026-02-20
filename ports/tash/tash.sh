GIT=https://github.com/tayoky/tash
COMMIT=b1dc57dd60829d5c5827f37fe7086b27adcdcc2a

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
