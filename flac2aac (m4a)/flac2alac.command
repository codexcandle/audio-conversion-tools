#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (flac -> alac)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'

for f in *.flac; do 
	ffmpeg -i "$f" -vf "crop=((in_w/2)*2):((in_h/2)*2)" -c:a alac "${f%.flac}.m4a"; 
	mp4art --add cover.jpg "${f%.flac}.m4a";
done