TAR=https://ftp.gnu.org/gnu/binutils/binutils-2.44.tar.xz
WEBSITE=https://www.gnu.org/software/binutils/

configure() {
	./configure --target=$TARGET --prefix=$PREFIX --with-sysroot=$SYSROOT --disable-nls --disable-werror
}
