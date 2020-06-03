#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (wav -> mp3)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'
TARGET_DIR='ogg'
QUALITY=5

mkdir -p $TARGET_DIR;

for f in *.wav; do 
	ffmpeg -i "$f" -c:a libvorbis -qscale:a $QUALITY "./${TARGET_DIR}/${f%.wav}.ogg"
done