GIT=https://github.com/tayoky/tld
COMMIT=da3e4842ff3f8cdd2c11de7b472ef7bd370398aa

configure() {
	./configure --host="$HOST" --cc="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
