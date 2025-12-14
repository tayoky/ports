GIT=https://github.com/tayoky/tutils
COMMIT=003331837a2cd24c9ec6f23780dd9fafad19479f

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
