#!/bin/sh

# pack a release

DATE=$(date '+%Y-%m-%d-%H-%M-%S')

ASSET_URL="https://github.com/tayoky/ports/releases/download/$DATE"

cd packages

echo "Ports release of $DATE for Stanix" > "NOTES.md"
echo "Below are precompileds for various Stanix packages" >> "NOTES.md"
echo "| package | version | signature |" >> "NOTES.md"
echo "| ------- | ------- | --------- |" >> "NOTES.md"
for ARCHIVE in *.tar.gz ; do
    PACKAGE="${ARCHIVE%%.tar.gz}"
    eval $(tar -xOf "$ARCHIVE" usr/local/tapm/$PACKAGE.ini 2> /dev/null || echo "version=uknown")
    SIG="$(sha256sum "$ARCHIVE" | cut -d " " -f1)"
    echo "| [$PACKAGE]($ASSET_URL/$PACKAGE.tar.gz) | $version | $SIG |"
done >> "NOTES.md"

gh release create "$DATE" --title "$DATE" --notes-file "NOTES.md" *.tar.gz
