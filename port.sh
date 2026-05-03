# main port manager

port_init () {
	if test "$#" != 1 ; then
		echo "usage : port_init PORT"
		return 1
	fi

	# source the config and export
	. ./config.mk
	export CC
	export CXX
	export LD
	export AS
	export AR
	export NM
	export STRIP
	export PKGCONFIG
	export CFLAGS
	export NPROC=$(nproc)
	export MESON_CROSS="$(realpath ./meson-cross.txt)"
	export CMAKE_CROSS="$(realpath ./cmake-cross.cmake)"
	test -z "$SYSROOT" && SYSROOT="/"
	test -z "$DESTDIR" && DESTDIR="$SYSROOT"
	export PREFIX
	export SYSROOT
	export DESTDIR
	export PKG_CONFIG_DIR=''
	export PKG_CONFIG_LIBDIR="$SYSROOT$PREFIX/lib/pkgconfig"
	export PKG_CONFIG_PATH="$PKG_CONFIG_LIBDIR"
	export PKG_CONFIG_SYSROOT_DIR="$SYSROOT"

	# find tmp dir
	: "${TMPDIR:=${TMP:=${TEMP:-/tmp}}}"

	# use the toolchain from the main stanix repo if available
	if test -d "../toolchain/bin" ; then
		export PATH="$(realpath ../toolchain/bin):$PATH"
	fi

	# default, in case the port don't set them
	VERSION="unknow"
	NAME="$1"

	# PORT is the port dir
	export PORT="$(realpath "ports/$NAME")"

	# default build and configure
	configure() {
		:
	}

	build() {
		:
	}

	# source the port script
	. "$PORT/$NAME.sh"

	# SRC is where the source code is
	if test -n "$TAR" ; then
		export SRC="$(realpath -m "tar/$NAME")"
	elif test -n "$GIT" ; then
		export SRC="$(realpath -m "git/$NAME")"
	else
		echo "no TAR or GIT was specified, invalid port"
		return 1
	fi
}

port_download_file () {
	if test "$#" != 2 ; then
		echo "usage : port_download_file URL OUT"
		return 1
	fi
	URL="$1"
	OUT="$2"

	if test -s "$OUT" ; then
		# already exist do not redownload
		return 0
	fi

	echo "downloading $URL ..."
	curl -L "$URL" -o "$OUT"
}

port_unpack () {
	if test "$#" != 2 ; then
		echo "usage : port_unpack TAR OUT"
		return 1
	fi
	ARCHIVE="$1"
	OUT="$2"
	if test -d "$OUT" ; then
		# already unpacked
		return 0
	fi
	echo "unpacking $ARCHIVE..."
	
	# extract to tmp
	mkdir -p "$TMPDIR/$ARCHIVE"
	tar xf "$ARCHIVE" -C "$TMPDIR/$ARCHIVE"

	# move the child dir to main one
	mv -T "$TMPDIR/$ARCHIVE"/*/ "$OUT"
	rm -fr "$TMPDIR/$ARCHIVE"

	# HACK : we should move this out
	FIRST=true
	return 0
}

port_clone () {
	if test "$#" != 2 ; then
		echo "usage : port_clone GIT OUT"
		return 1
	fi

	GIT="$1"
	OUT="$2"

	if test -d "$OUT" ; then
		# already cloned
		return 0
	fi
	git clone --depth=1 "$GIT" --recurse "$OUT"
}

port_clone_commit () {
	if test "$#" != 3 ; then
		echo "usage : port_clone_commit GIT COMMIT OUT"
		return 1
	fi

	GIT="$1"
	COMMIT="$2"
	OUT="$3"

	port_clone "$GIT" "$OUT" || return 1
	git -C "$OUT" fetch --depth=1 origin "$COMMIT" && git -C "$OUT" checkout --detach "$COMMIT"
}

port_clone_tag () {
	if test "$#" != 3 ; then
		echo "usage : port_clone_tag GIT TAG OUT"
		return 1
	fi

	GIT="$1"
	TAG="$2"
	OUT="$3"

	port_clone "$GIT" "$OUT" || return 1
	git -C "$OUT" fetch --depth=1 origin refs/tags/"$TAG":refs/tags/"$TAG" && git -C "$OUT" checkout --detach "$TAG"
}

port_apply_patches () {
	if [ -d "$PORT/patch" ] ; then
		echo "apply patches..."
		for PATCH in "$PORT/patch"/*.patch ; do
			patch -ruN -f -p1 -i "$PATCH"
		done
	fi
}

port_download () {
	FIRST=false

	# if needed download tar instead of cloning repo
	if test -n "$TAR" ; then
		TAR_NAME=$(basename "$TAR")
		mkdir -p tar
		cd tar
		port_download_file "$TAR" "$TAR_NAME" || return 1
		port_unpack "$TAR_NAME" "$NAME" || return 1
	elif test -n "$GIT" ; then
		mkdir -p git
		cd git
		if test -n "$TAG" ; then
			port_clone_tag "$GIT" "$TAG" "$NAME" || return 1
		elif test -n "$COMMIT" ; then
			port_clone_commit "$GIT" "$COMMIT" "$NAME" || return 1
		fi
		FIRST=true
	fi

	cd "$SRC" || return 1

	if [ "$FIRST" = "true" ] ; then 
		# now apply the patch if needed
		port_apply_patches
	fi
	return 0
}

port_configure () {
	cd "$SRC" || return 1
	(configure)
}

port_build () {
	cd "$SRC" || return 1
	(build)
}

port_install () {
	cd "$SRC" || return 1
	(install)
}
