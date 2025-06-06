GIT=https://github.com/ercanersoy/PSF-Fonts

install() {
	#first setup directory
	mkdir -p ${PREFIX}/local/share/consolefonts

	#copy all psf font
	cp ./*.psf ${PREFIX}/local/share/consolefonts/
}
