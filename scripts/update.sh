#!/bin/sh

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export BASEURL="$( cd -P "$( dirname "$SOURCE" )" && pwd )/../"

pushd $BASEURL

./scripts/get_urls.py 1>/dev/null
./scripts/sync.sh 1>/dev/null
./scripts/modify.sh 1>/dev/null
./scripts/swap.sh 1>/dev/null

popd