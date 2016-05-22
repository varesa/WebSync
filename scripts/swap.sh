#!/bin/bash

pushd /home/nastori/sync/sync >/dev/null

rm -rf current
rm -rf alternative

if [ -f flag ]; then
    ln -s dir1 ./current
    ln -s dir2 ./alternative
    rm -f flag
else
    ln -s dir2 ./current
    ln -s dir1 ./alternative
    touch flag
fi

popd >/dev/null
