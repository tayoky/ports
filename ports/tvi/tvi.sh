GIT=https://github.com/tayoky/tvi
COMMIT=98057ef484ebe08c6e3b5168a5776bce4ac76f2e

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
