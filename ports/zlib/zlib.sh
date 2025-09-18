VERSION=1.3.1
TAR=https://www.zlib.net/zlib-$VERSION.tar.gz

configure() {
	#thanks to bananymous for the --uname
	./configure --prefix=/usr --uname=stanix
}

build() {
	make -j$NPROC
}

install() {
	make install DESTDIR=${PREFIX%%/usr}
}
