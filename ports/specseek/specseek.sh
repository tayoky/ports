GIT=https://github.com/Mellurboo/SpecSeek/
COMMIT="91d05697c889c898be4ee08adaf1fb9bb08606f7"

build(){
	make specseek_64 CFLAGS=-mno-sse
}

install(){
	cp bin/gcc/64/specseek_64 $PREFIX/bin/specseek
}
