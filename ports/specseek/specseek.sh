GIT=https://github.com/Mellurboo/SpecSeek/
COMMIT="47f51c62de8e8142a8ecb47b65b19cc7fd60b2c7"

build(){
	make specseek_64 CFLAGS=-mno-sse
}

install(){
	cp bin/gcc/64/specseek_64 $PREFIX/bin/specseek
}
