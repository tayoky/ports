GIT=https://github.com/ercanersoy/PSF-Fonts

install() {
	#first setup directory
	mkdir -p "$DESTDIR/$PREFIX/local/share/fonts"

	#copy all psf font
	cp ./*.psf "$DESTDIR/$PREFIX/local/share/fonts/"
}
