#!/bin/bash

pushd $BASEURL/sync/

rm -rf current
rm -rf alternative

if [ -f flag ]; then
    ln -s dir1 ./current
    ln -s dir2 ./alternative
    rm flag
else
    ln -s dir2 ./current
    ln -s dir1 ./alternative
    touch flag
fi

popd