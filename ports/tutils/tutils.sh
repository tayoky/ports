GIT=https://github.com/tayoky/tutils
COMMIT=6fdf8a2860b85705447841039ec2bd8b6726977d

configure() {
	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
