#!/usr/bin/env bash
set +e
OLDPWD="$PWD"

for df in $(find . -name Dockerfile) ; do
        image=$(dirname "$df"|cut -d\/ -f2-)
	echo Building "$image"..
        cd "$image"
        docker build --rm --no-cache --pull=true -t local/"$image" . || ERRORS="$ERRORS $df"
        cd "$OLDPWD"
done

[ -z "${ERRORS}" ] || ( echo ERRORS\: "$ERRORS" ; exit 1 )
