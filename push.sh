#!/usr/bin/env bash
set +e
OLDPWD="$PWD"

for df in $(find . -name Dockerfile) ; do
        image=$(dirname "$df"|cut -d\/ -f2-)
        echo Pushing "$image"..
        cd "$image"
        ( docker tag local/"$image" heichblatt/"$image" && docker push heichblatt/"$image" ) || ERRORS="$ERRORS $df"
        cd "$OLDPWD"
done

[ -z "${ERRORS}" ] || ( echo ERRORS\: "$ERRORS" ; exit 1 )
