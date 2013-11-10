#!/bin/sh

BASEURL=/home/pi/site

rm -rf $BASEURL/sync/alternative/*

while read line
do
    cd $BASEURL/sync/alternative/
    wget -nH -p $line
done <$BASEURL/scripts/urls.txt

cp $BASEURL/scripts/urls.txt ./

exit