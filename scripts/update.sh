#!/bin/bash

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

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd $DIR

./check_connection.py
./get_urls.py
./sync.sh
./modify.sh
./swap.sh
./check_changes.sh
