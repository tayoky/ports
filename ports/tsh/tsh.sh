GIT=https://github.com/tayoky/tsh
COMMIT=529c3a4bca9677b8194fa51916d98ba9e16e3eb0

configure() {
	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"

	#we need to specify custom CFLAGS
	echo 'CFLAGS = -fno-stack-protector \
		-fno-stack-check \
		-fno-PIC \
		-mno-80387 \
		-mno-mmx \
		-mno-red-zone '>> config.mk
}

build() {
	make
}

install() {
	make install
}
