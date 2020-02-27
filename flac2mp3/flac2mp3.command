#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (flac -> mp3)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'

for f in *.flac; do 
	ffmpeg -i "$f" -c:a libmp3lame -q:a 0 "${f%.flac}.mp3"; 
done