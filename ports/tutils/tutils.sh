GIT=https://github.com/tayoky/tutils
COMMIT=2e40709d590a138738dd355cdfd050317529fbab

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
