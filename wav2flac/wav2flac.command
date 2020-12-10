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
COMPRESSION_LEVEL=12		# 0-12, default = 5

for f in *.wav; do 
	ffmpeg -i "$f" -c:a -compression_level $OMPRESSION_LEVEL flac "${f%.wav}.flac"; 
done