VERSION=4.0.49
TAR=http://ftp.gnu.org/gnu/mtools/mtools-$VERSION.tar.gz
WEBSITE=https://www.gnu.org/software/mtools/

configure() {
	./configure --host=$HOST --prefix=/usr CFLAGS=-Wno-error
}

build(){
	make all -j$NPROC
}

install(){
	make install DESTDIR=${PREFIX%%/usr}
}
