TAR=https://ftp.gnu.org/gnu/binutils/binutils-2.44.tar.xz
WEBSITE=https://www.gnu.org/software/binutils/

configure() {
	./configure --host=$HOST \
	--target=$HOST \
	--prefix=$PREFIX \
	--with-sysroot=/ \
	--with-build-sysroot=$SYSROOT \
	--disable-nls --disable-werror
}

build(){
	make all
}

insatll(){
	make install
}
