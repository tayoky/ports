GIT=https://git.ffmpeg.org/ffmpeg
TAG=n8.1.2
WEBSITE=https://www.ffmpeg.org/
DEPENDENCIES="sdl2-compat"

configure () {
	# TODO : remove --disable-asm when we get posix_memalign
	./configure --prefix="$PREFIX" \
	--target-os="none" --arch="${HOST%%-*}" \
	--disable-asm --disable-inline-asm \
	--cc="$CC" --cxx="$CXX" \
	--enable-cross-compile \
	--enable-shared \
	--enable-gpl \
	--enable-version3 \
	--disable-openssl
}

build() {
	make -j$NPROC
}

install() {
	make install DESTDIR="$DESTDIR"
}
