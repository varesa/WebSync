#!/bin/sh

# Check for duplicate process

pids="$(pidof -x update.sh)"
count="$(echo \"$pids\" | wc -w)"

case "$count" in
1)  echo "starting download" # I am the only on running
    ;;
*)  echo "already running, aborting"
    exit
    ;;
esac

BASE=/home/pi/site/scripts/
cd $BASE

./check_connection.py 1>/dev/null
./get_urls.py 1>/dev/null
./sync.sh 1>/dev/null
./modify.sh 1>/dev/null
./swap.sh 1>/dev/null
./check_changes.sh 1>/dev/null
