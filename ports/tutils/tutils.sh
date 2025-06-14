GIT=https://github.com/tayoky/tutils
COMMIT=7c2d992e8f39a6a9a94b1cfce81a9d0303bed09b

configure() {
	#we need to specify custom CFLAGS
	CFLAGS='-Wall\
		-Wextra \
		-fno-stack-protector \
		-fno-stack-check \
		-fno-PIC \
		-mno-80387 \
		-mno-mmx \
		-mno-sse \
		-mno-sse2 \
		-mno-red-zone'

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX" --no-qsort --with-CFLAGS="$CFLAGS"
}

build() {
	make
}

install() {
	make install
}
