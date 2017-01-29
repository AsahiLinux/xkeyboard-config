#! /bin/sh

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

ORIGDIR=`pwd`
cd $srcdir

autopoint --force
AUTOPOINT='intltoolize --automake --copy' autoreconf -v --install --force || exit 1

cd $ORIGDIR || exit $?
if test -z "$NOCONFIGURE"; then
    exec $srcdir/configure "$@"
fi
