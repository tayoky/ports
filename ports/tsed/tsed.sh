GIT=https://github.com/StercusMax/tsed
COMMIT=b06cfec6e119e0e1c1771068558a1688c338dde8

configure() {
	true
}

build() {
	$CC main.c -o tsed
}

install() {
	mkdir -p $PREFIX/bin
	cp tsed $PREFIX/bin
}
