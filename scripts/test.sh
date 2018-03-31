#!/usr/bin/env bash


TOOLCHAIN=`node -p "require('nodeos-cross-toolchain')"`

source $TOOLCHAIN/scripts/adjustEnvVars.sh || exit 1


LIBC="lib/ld-musl-$CPU_PORT.so.1"

expected="bin
dev
lib
proc
sbin
dev/console
init
etc
etc/os-release
lib/libc.so
$LIBC
lib/libgcc_s.so.1
lib/libstdc++.so.6.0.21
lib/libstdc++.so.6
bin/init
sbin/init"

OUT_FILE=`mktemp`.cpio.gz


npm start -- -o $OUT_FILE -p install-dependencies || exit 2


# Files list
result=`gunzip -c $OUT_FILE | cpio -t`

test "$result" = "$expected" || exit 3


# 'sbin/init' platform
result=`mktemp`

gunzip -c $OUT_FILE | cpio -i -H newc --to-stdout init > $result || exit 4

file $result | grep -q $LIBC || exit 5
