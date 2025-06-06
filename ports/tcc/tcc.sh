GIT=https://github.com/TinyCC/tinycc

configure() {
	./configure --prefix=$PREFIX --sysroot=$SYSROOT --targetos=stanix --enable-static --cc=$CC --triplet=x86_64-stanix --extra-cflags='-Wall
    -Wextra
    -std=gnu11
    -fno-stack-protector
    -fno-stack-check
    -fno-PIC
    -static' 

	echo '#define CONFIG_TCC_STATIC 1
	#define CONFIG_TCC_SEMLOCK 0' >> config.h
}

build() {
	make
}

install() {
	make install
}
