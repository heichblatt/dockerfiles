#!/usr/bin/env bash

set +e

log() {
        echo -e "$0: $*"
}

for df in $(find . -name Dockerfile) ; do
        image=$(dirname "$df"|cut -d\/ -f2-)
        log Building "$image"..
        pushd "$image"
        docker build --rm --no-cache --pull=true -t local/"$image" . || ERRORS="$ERRORS $df"
        popd
done

[ -z "${ERRORS}" ] || ( echo ERRORS\: "$ERRORS" ; exit 1 )
