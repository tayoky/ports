GIT=https://github.com/tayoky/tutils
COMMIT=a58515420b950ca10d9e3957b8c07216ca188b0c

configure() {
	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
