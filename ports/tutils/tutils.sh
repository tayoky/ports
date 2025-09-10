GIT=https://github.com/tayoky/tutils
COMMIT=e56353c6962865aa44470a3d321f66b15d31d14e

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
