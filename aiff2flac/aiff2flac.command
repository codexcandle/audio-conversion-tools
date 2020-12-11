#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (aiff -> flac)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'
COMPRESSION_LEVEL=12		#0-12, default = 5

for f in *.aiff; do 
	ffmpeg -i "$f" -c:a flac "${f%.aiff}.flac" -compression_level "$COMPRESSION_LEVEL";
done