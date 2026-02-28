VERSION="4.4.1"
TAR="https://ftp.gnu.org/gnu/make/make-$VERSION.tar.gz"
WEBSITE="https://www.gnu.org/software/make"

configure() {
	./configure --host="$HOST" --prefix=/usr  --without-guile --disable-job-server --disable-thread --disable-nls --disable-posix-spawn --enable-year-2038
}

build() {
	make -j$NPROC
}

install() {
	make install DESTDIR=${PREFIX%%/usr}
}
