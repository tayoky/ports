GIT=https://github.com/tayoky/tutils
COMMIT=2f4cc24ebb548c4e3f26a3e672cecdf19177bcc6

configure() {

	./configure --host="$HOST" --with-CC="$CC" --prefix="$PREFIX"
}

build() {
	make
}

install() {
	make install
}
