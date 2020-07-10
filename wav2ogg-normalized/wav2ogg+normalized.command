#!/bin/bash
# PURPOSE:  FFMPEG Audio Conversion Script (wav -> ogg-normalized)

echo "-------------------------|" $TITLE "|"

cd "$(dirname "$BASH_SOURCE")" ||
{
    echo "Error getting script directory" >&2
    exit 1
}

# VAR ################################
TITLE='FFMPEG Audio Conversion Script'
FORMAT_START='wav';
FORMAT_TARGET='ogg';
DIR_TEMP='temp'
DIR_FINAL='converted+normalized'
QUALITY=5
DEBUG=true

# 1. make "normalized" wav files
mkdir -p $DIR_TEMP;

for f in *.wav; do 
	ffmpeg-normalize "$f" -o "./${DIR_TEMP}/${f%.wav}.${FORMAT_START}" -nt rms
done

# 2. convert "normalized" files to target format
mkdir -p $DIR_FINAL;

cd $DIR_TEMP;

for f in *.wav; do 
	ffmpeg -i "$f" -c:a libvorbis -qscale:a $QUALITY "../${DIR_FINAL}/${f%.wav}.${FORMAT_TARGET}"
done

# 3. clean-up
cd "../";

if [ "$DEBUG" = false ]; then
	rm -r $DIR_TEMP;
fi