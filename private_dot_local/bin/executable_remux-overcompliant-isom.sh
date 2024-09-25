#!/usr/bin/env bash
# convert bad files for audio player

infile="${1}"
outfile="${infile%m4b}"out.m4b
MP4Box -raw audio "${infile}" -out tmp
MP4Box -dump-cover "${infile}" -out cover.jpg
ffmpeg -i "${infile}" -f ffmetadata - 2> /dev/null  > metadata.txt

ffmpeg -hide_banner \
       -i tmp \
       -f ffmetadata -i metadata.txt -c copy -map_metadata 1 \
       -map '0:0' '-c:0' copy \
       -movflags '+faststart' \
       -default_mode infer_no_subs \
       -ignore_unknown \
       -strict experimental -f mp4 -y "${outfile}"

rm metadata.txt ./tmp
