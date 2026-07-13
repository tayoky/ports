GIT=https://github.com/libsdl-org/SDL_mixer
TAG=release-2.8.2
WEBSITE=https://libsdl.org/
DEPENDENCIES="sdl2-compat"

configure () {
	cmake -B build -S . --toolchain="$CMAKE_CROSS" -DCMAKE_INSTALL_PREFIX="$PREFIX" \
	-DSDL2MIXER_DEPS_SHARED=OFF \
	-DSDL2MIXER_MIDI_FLUIDSYNTH=OFF \
	-DSDL2MIXER_WAVPACK=OFF \
	-DSDL2MIXER_OPUS=OFF \
	-DSDL2MIXER_MOD=OFF
}

build() {
	make -C build -j$NPROC
}

install() {
	make -C build install DESTDIR="$DESTDIR"
}
