VERSION=25.2.2
TAR="https://mesa3d.org/archive/mesa-$VERSION.tar.xz"

configure() {
	mkdir -p build
	cd build

	meson setup .. \
      --prefix=/usr   \
      --buildtype=release \
      --cross-file "$MESON_CROSS" \
      -D platforms=[] \
      -D gallium-drivers=softpipe  \
      -D vulkan-drivers=[]   \
      -D valgrind=disabled \
      -D glx=disabled
}

build() {
	cd build
	meson compile
}

install() {
	meson install --destdir="${PREFIX%%/usr}"
}
