GIT=https://github.com/tayoky/tash
COMMIT=5eb58d0bcc6ece5db4c80f87f69653d57fa6f38b

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
