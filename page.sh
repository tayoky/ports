#!/bin/sh


mkdir -p pages
PAGE="$PWD/pages/$1.md"

cd ports
cd $1
. ./$1.sh

test -z "$NAME" && NAME="$1"

echo "---
title: $NAME
---" > "$PAGE"
if test -n "$DESC" ; then
	echo "$DESC"
	echo ""
fi >> "$PAGE"

echo "## infos" >> "$PAGE"
test -n "$VERSION" && echo "version : $VERSION" >> "$PAGE"
test -n "$WEBSITE" && echo "website : $WEBSITE" >> "$PAGE"
test -n "$GIT"     && echo "git     : $GIT" >> "$PAGE"
test -n "$TAR"     && echo "tar     : $TAR" >> "$PAGE"
echo "" >> "$PAGE"

echo "## build
To build, once stanix's core is compiled, run
\`\`\`sh
cd ports
./build.sh $1
./install $1
\`\`\`
" >> "$PAGE"

echo '## manifest
```sh' >> "$PAGE"
cat $1.sh >> "$PAGE"
echo "\`\`\`
This package manifest and it's associed patches can be found at https://github.com/tayoky/ports/blob/main/ports/$1
" >> "$PAGE"
