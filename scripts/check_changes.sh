#!/bin/bash

BASEURL=/home/nastori/sync
CUR=$BASEURL/sync/current
ALT=$BASEURL/sync/alternative

if [[ "$(ls $CUR/)" == "" ]]; then
    exit
fi

if [[ "$(ls $ALT/)" == "" ]]; then
    exit
fi



current=$(md5sum $BASEURL/sync/current/* | cut -d ' ' -f 1)
alt=$(md5sum $BASEURL/sync/alternative/* | cut -d ' ' -f 1)

if [[ "$current" != "$alt" ]]; then
    echo Changes detected, clearing alt.
    rm -rf $BASEURL/sync/alternative/*
fi


exit
