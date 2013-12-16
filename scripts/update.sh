#!/bin/sh

BASE=/home/pi/site/scripts/
cd $BASE

./get_urls.py 1>/dev/null
./sync.sh 1>/dev/null
#./modify.sh 1>/dev/null
./swap.sh 1>/dev/null
