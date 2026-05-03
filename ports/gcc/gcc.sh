VERSION=12.2.0
MIRROR="https://ftp.gnu.org/gnu"
TAR="$MIRROR/gcc/gcc-$VERSION/gcc-$VERSION.tar.xz"
WEBSITE=https://www.gnu.org/software/gcc/

configure() {
	./configure --host="$HOST" \
	--target="$HOST" \
	--prefix="$PREFIX" \
	--with-sysroot=/ \
	--with-build-sysroot=$SYSROOT \
	--disable-nls --disable-werror \
	--enable-shared \
	--disable-multilib --enable-shared --enable-threads=posix \
	--enable-languages=c,c++ \
	CFLAGS="-D_Thread_local=" #stupid tls workaround
}

build(){
	make all-gcc -j$NPROC
	make all-target-libgcc -j$NPROC
	make all-target-libstdc++-v3 -j$NPROC
}

install(){
	make install-strip-gcc DESTDIR="$DESTDIR"
	make install-strip-target-libgcc DESTDIR="$DESTDIR"
	make install-strip-target-libstdc++-v3 DESTDIR="$DESTDIR"
}
