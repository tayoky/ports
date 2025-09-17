GIT=https://github.com/tayoky/tash
COMMIT=d78769ee11a8da2f1dd44f820a1f0bb519b8f903

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
