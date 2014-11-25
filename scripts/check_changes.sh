#!/bin/bash

BASEURL=/home/pi/site


current=$(md5sum $BASEURL/sync/current/* | cut -d ' ' -f 1)
alt=$(md5sum $BASEURL/sync/alternative/* | cut -d ' ' -f 1)

#echo $current
#echo $alt

if [[ "$current" != "$alt" ]]; then
    echo Changes detected, clearing alt.
    rm -rf $BASEURL/sync/alternative/*
fi


exit
