# mkv--embed-title-from-filename() {
#     #echo '00001-Einfuhrung_zur_Vorlesung_uber_D3.js.mkv' | sed s/^0*// | sed s/\.mkv// | tr "_" " "
#     title=`basename "${1}`
#     mkvpropedit  --add title="${title}"

# }

ffmpeg--discard-zero-frames() {
    # cmd | xargs -I _ mv _ _.bak 
    for f in *.mp3 ; do ffprobe -v error "${f}" 2>&1 > /dev/null | egrep -v "size" | cut -d: -f1 ; done
}


ffmpeg--fingerprint-swr2-forum() {
    ffmpeg -hide_banner -t 00:00:07.000 -i "${1}" -map 0:a -f md5 - 2> /dev/null
}



ffmpeg--dump-metadata() {
	  ffmpeg -i "$1" -f ffmetadata - 2> /dev/null
}
ffprobe--json() {
    ffprobe -v quiet -print_format json -show_format -show_streams "$1"
}
ffmpeg--arte-merge-streams() {
    vid="$1"
    aud="$2"
    sub="$3"
    name="$4"
    ffmpeg -i "${vid}" -i "${aud}" -i "${sub}" -map 0:v -map 1:a -map 2 -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=eng "${name}".mp4
}

ffmpeg--arte-merge-combined() {
    vid_aud="$1"
    sub="$2"
    name="$3"
    ffmpeg -hide_banner -loglevel warning -nostats -i "${vid_aud}" -i "${sub}" -map 0:v -map 0:a -map 1 -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=eng "${name}".mp4
}

ffmpeg--dump-metadata() {
	  ffmpeg -i "$1" -f ffmetadata - 2> /dev/null
}

# Audiobook-stream-1-video-mjpeg.mkv
ffmpeg--mjpeg2jpeg() {
    ffmpeg -i "${1}" -bsf:v mjpeg2jpeg cover.jpg
}
