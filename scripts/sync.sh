#!/bin/sh

rm -rf $BASEURL/sync/alternative/*

while read line
do
    cd $BASEURL/sync/alternative/
    wget -nH -p $line
done <$BASEURL/urls.txt

cp $BASEURL/scripts/urls.txt $BASEURL/sync/alternative/

exit
