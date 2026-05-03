GIT=https://github.com/Mellurboo/SpecSeek/
COMMIT="fede6a5dad6aeaf664dd65543691ad888cc6d037"

build(){
	make specseek_64 CFLAGS=-mno-sse
}

install(){
	mkdir -p "$DESTDIR/$PREFIX/bin"
	cp bin/gcc/64/specseek_64 "$DESTDIR/$PREFIX/bin/specseek"
}
