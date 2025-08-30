VERSION='4.4.1'
TAR="https://ftp.gnu.org/gnu/make/make-$VERSION.tar.gz"

configure() {
	./configure --host="$HOST" --prefix=/usr  --without-guile --disable-job-server --disable-thread
}

build() {
	make -j$NPROC
}

install() {
	make install DESTDIR=$PREFIX
}
