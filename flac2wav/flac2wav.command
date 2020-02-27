#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (flac -> wav)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'

for f in *.flac; do 
	ffmpeg -i "$f" "${f%.flac}.wav"; done
done