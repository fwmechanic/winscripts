#!/usr/bin/env bash

die() { printf %s "${@+$@$'\n'}" 1>&2 ; exit 1 ; }

[[ -x "$COMSPEC" ]] || die "COMSPEC not defined?"
comspec="$(cygpath --unix "$COMSPEC")"
echo "comspec=$comspec"
cmdinternal() ( "$comspec" //c "$@" )

cmdinternal "ftype" "EPUBx" ; echo "cmd returned $?"
cmdinternal "ftype" "EPUB"  ; echo "cmd returned $?"

exit

ftype EPUB=
if exist "%LOCALAPPDATA%\SumatraPDF\SumatraPDF.exe"         ftype EPUB="%LOCALAPPDATA%\SumatraPDF\SumatraPDF.exe" "%%1"
if exist "c:\Program Files (x86)\SumatraPDF\SumatraPDF.exe" ftype EPUB="c:\Program Files (x86)\SumatraPDF\SumatraPDF.exe" "%%1"
if exist "c:\Program Files\SumatraPDF\SumatraPDF.exe"       ftype EPUB="c:\Program Files\SumatraPDF\SumatraPDF.exe" "%%1"
ftype EPUB

assoc .EPUB=EPUB
assoc .CHM=EPUB
assoc .LIT=EPUB
assoc .FB2=EPUB
assoc .MOBI=EPUB
assoc .djv=EPUB
assoc .djvu=EPUB
