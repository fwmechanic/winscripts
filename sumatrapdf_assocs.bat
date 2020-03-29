@echo off
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
