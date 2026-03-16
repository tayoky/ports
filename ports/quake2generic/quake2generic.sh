GIT=https://github.com/ozkl/quake2generic.git
COMMIT=74d48cdb25a393032c6706344d406dc4f6f16ff3

build() {
	make -f Makefile-stanix
}

install() {
	cp build/quake2 "$PREFIX/bin"
}
