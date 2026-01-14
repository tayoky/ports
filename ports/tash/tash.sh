GIT=https://github.com/tayoky/tash
COMMIT=35adf36e0f563bf39774c6f9908cd5cd4d91717a

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
