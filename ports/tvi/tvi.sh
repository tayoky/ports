GIT=https://github.com/tayoky/tvi
COMMIT=cb2b4d9f564c011e390f5c0dd706d831e86cfa7e

configure() {
	# disable dynamic linking linking
	./configure --host="$HOST" --cc="$CC" --prefix="/usr"
}

build() {
	make
}

install() {
	make install DESTDIR=${PREFIX%%/usr}
}
