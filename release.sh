#!/bin/sh

# pack a release

DATE=$(date '+%Y-%m-%d-%H-%M-%S')

echo "Ports release of $DATE for Stanix" > "NOTES.md"
echo "Below are precompileds for various Stanix packages" >> "NOTES.md"
echo "| package | signature |" >> "NOTES.md"
echo "| ------- | --------- |" >> "NOTES.md"
for i in packages/*.tar.gz.sha256 ; do
    SIG_FILE="${i##packages/}"
    PACKAGE="${SIG_FILE%%.tar.gz.sig}"
    SIG="$(cat $i)"
    echo "| $PACKAGE | $SIG |"
done >> "NOTES.md"

gh release create "$DATE" --title "$DATE" --notes-file "NOTES.md" packages/*.tar.gz
