GIT=https://github.com/StercusMax/tsed
COMMIT=d540eb7967d6446d887086aface2172bd918d289

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
