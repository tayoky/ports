VERSION=0.4.2
GIT="https://github.com/facebook/zstd"
TAG="zstd-$VERSION"

configure() {
	:
}

build() {
	make default -j$NPROC
}

install() {
	make install DESTDIR="$DESTDIR"
}
