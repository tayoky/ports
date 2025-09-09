TAR=https://ftp.gnu.org/gnu/binutils/binutils-2.44.tar.xz
WEBSITE=https://www.gnu.org/software/binutils/

configure() {
	./configure --host=$HOST \
	--target=$HOST \
	--prefix=/usr \
	--with-sysroot=/ \
	--with-build-sysroot=$SYSROOT \
	--disable-nls --disable-werror \
	CFLAGS="-D_Thread_local=" #stupid tls workaround
}

build(){
	make all -j$NPROC
}

install(){
	make install-strip DESTDIR=${PREFIX%%/usr}
}
