#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (flac -> aiff)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'

for f in *.flac; do 
	ffmpeg -i "$f" "${f%.flac}.aiff"; done
done