GIT=https://github.com/tayoky/tvi
COMMIT=20929ba6923388f689ef3e554dcc27aefd767f03

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
