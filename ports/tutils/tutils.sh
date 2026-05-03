GIT=https://github.com/tayoky/tutils
COMMIT=ba00c74218b91097fd592840e05ae2edb763407c

configure() {
	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install DESTDIR="$DESTDIR"
}
