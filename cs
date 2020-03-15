#!/usr/bin/env bash

die() { printf %s "${@+$@$'\n'}" 1>&2 ; exit 1 ; }

winpwd="$(cygpath -w "$(pwd)")"
echo "winpwd=$winpwd"
set -x
# exec start '"'"$winpwd"'"' //D "$winpwd" "$COMSPEC"
"$COMSPEC" //c start '"'"$winpwd"'"' //D "$winpwd" "$COMSPEC"
