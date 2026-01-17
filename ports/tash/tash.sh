GIT=https://github.com/tayoky/tash
COMMIT=684953d571c55de69588d49b4d26cb64f56eaa8b

configure() {
	./configure --host="$HOST" --cc=$CC --prefix=$PREFIX
}

build() {
	make
}

install() {
	make install
}
