#!/bin/bash

UPSTREAM_VERSION="$2"
FILENAME="$3"
ORIGDIR="`pwd`"
ZIP_FILENAME="$ORIGDIR/../relaxngDatatype-$UPSTREAM_VERSION.zip"
TARGZ_FILENAME="$ORIGDIR/../librelaxng-datatype-java_$UPSTREAM_VERSION.orig.tar.gz"
TEMPDIR="`mktemp -d`"

cd "$TEMPDIR"

echo "Unpacking .zip"
unzip "$ZIP_FILENAME"
DIRNAME="`ls`"

echo "Removing pre-built documentation and JARs"
rm -fvr "$DIRNAME/doc/"*
find -iname '*.jar' -print0 | xargs -0 rm -fv

echo "Repackaging .tar.gz"
tar czfv "$TARGZ_FILENAME" "$DIRNAME"

echo "Removing temporary directory"
cd "$ORIGDIR"
rm -fr "$TEMPDIR"

echo "Finished"

