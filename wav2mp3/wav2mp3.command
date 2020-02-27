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
TARGET_DIR='mp3s'
BIT_RATE=320000

mkdir -p $TARGET_DIR;

for f in *.wav; do 
	ffmpeg -i "$f" -b:a $BIT_RATE "./${TARGET_DIR}/${f%.wav}.mp3"
done