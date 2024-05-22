#!/usr/bin/env bash

cd ..
CWD=$(pwd)
MEDIA_DIR="$CWD/media"
EXIF_LOC="$HOME/Downloads/Image-ExifTool-12.85/exiftool"
QPDF_LOC="$HOME/Downloads/qpdf/build/qpdf/qpdf"




qpdf_linearize_files() {

    for f in $1/*.pdf ; do

        $QPDF_LOC --linearize "$f" --replace-input
        RET=$?

        if [ $RET -ne 0 ]; then
            echo "ERROR = $RET"
        fi

    done
}

#pdfseparate ./media/general-flyers/W8\ Flier\ -\ 10\ languages.pdf %d.pdf



$EXIF_LOC -all:all= $MEDIA_DIR/*.pdf
RET=$?
if [ $RET -eq 0 ]; then
    rm $MEDIA_DIR/*.pdf_original
fi


qpdf_linearize_files $MEDIA_DIR