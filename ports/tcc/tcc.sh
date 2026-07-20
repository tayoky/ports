GIT="https://github.com/TinyCC/tinycc"
COMMIT="fada98b1ce9ee0c36771183177218828ccb9b9de"
WEBSITE="https://bellard.org/tcc/"

configure() {
	./configure --prefix=$PREFIX --sysroot=$SYSROOT --targetos=stanix --enable-static --cc=$CC --triplet=x86_64-stanix \
    --sysincludepaths=/usr/include:/usr/local/include:$PREFIX/lib/tcc/include \
    --libpaths=/lib:/usr/lib:/usr/local/lib:$PREFIX/lib/tcc \
    --crtprefix=/usr/lib \
    --elfinterp=/usr/lib/ld-tlibc.so
    
	echo '#define CONFIG_TCC_SEMLOCK 0' >> config.h
}

build() {
	make XTCC=gcc XAR=$AR
}

install() {
	make install DESTDIR="$DESTDIR"
}
