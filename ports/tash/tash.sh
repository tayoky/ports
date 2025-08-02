GIT=https://github.com/tayoky/tash
COMMIT=3fbcd3dd11895eb517deed84c6ee8ce8787cbe94

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
