#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (wav -> aiff)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VARS ###########################################################
TITLE='FFMPEG Audio Conversion Script'

for f in *.wav; do 
	ffmpeg -y -i "$f" "${f%.wav}.aiff"; 
done