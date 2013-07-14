#!/bin/sh -x

ndk-build -j8
find obj -name objs | xargs rm -rf
OUT=usr
mv obj $OUT
mv $OUT/local $OUT/lib
cp -r include $OUT/include
cp openssl.version $OUT

TARBALL=openssl-android.tar.bz2
tar -cjf $TARBALL $OUT
