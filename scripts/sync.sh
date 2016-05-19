#!/bin/bash

BASEURL=/home/nastori/sync/

#rm -rf $BASEURL/sync/alternative/*

while IFS='' read -r line || [[ -n "$line" ]]
do
    cd $BASEURL/sync/alternative/
    if [[ $line == http* ]]; then
        wget -nH -p $line
    elif [[ $line == s3* ]]; then
        echo s3cmd sync $line ./
	s3cmd sync $line ./
    else
        echo "Unknown/Invalid protocol"
    fi
done <$BASEURL/scripts/urls.txt

cp $BASEURL/scripts/urls.txt $BASEURL/sync/alternative/

exit
