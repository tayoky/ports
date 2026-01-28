GIT=https://github.com/tayoky/tash
COMMIT=c81635b7993f960e65ee842a6fe7cf44da241460

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
