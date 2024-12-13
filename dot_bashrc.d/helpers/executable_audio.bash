#!/usr/bin/env bash
mp3--quality() { mutagen-inspect "${1}"  | grep '^- .*'; }

# TODO shadow original
m4b--aac2mp4() { /usr/local/bin/aac2mp4 "${@}"  2>&1 > /dev/null; }

m4b--cover() {
    MP4Box -dump-cover "${1}" -out cover.jpg
    # ffmpeg -i "$1" -map 0:v -map -0:V -c copy cover.jpg
}

m4b--remove-chaps() {
    for f in *.m4b ; do mp4chaps -r "${f}"; done
}
mp3--prefixcut() {
   for f in *.mp3 ; do mp3splt "${f}" 0."${1}" EOF -o out/@f ; done
}

mp3--postfixcut() {
   for f in *.mp3 ; do mp3splt "${f}" 0.0 EOF-0."${1}" -o out/@f ; done
}

m4b--prefixcut() {
    for f in *.m4b ; do ffmpeg -ss 00:00:"${1}" -i "${f}" -c:v copy -c:a copy ./out/"${f}" ; done
}

m3u--files() {
    grep -v "^#" "${1}" 2>&1 | sed 's|Podcasts/||g'
}


mp3--merge-chapters() {
    local a
    local b
    a="${1}"
    b="${2}"
    tr '"' '`' < "$b" > "${b%txt}"clean.txt
    sed 's/^.*$/"&"/g' "${b%txt}"clean.txt > "${b%txt}"quoted.txt
    paste "${a}" "${b%txt}"quoted.txt |tr -d '\t' > "${b%txt}"out.csv
}


m4a--prefixcut-inplace ()
{
    mkdir out
    for f in *.m4a ; do
        ffmpeg -ss 00:00:"${1}" -i "${f}" -c:v copy -c:a copy ./out/"${f}";
        /usr/bin/mv -f ./out/"${f}" "${f}"; done
    rm -rf ./out
}

# example: mp3--bulk-title-here chaps.txt
# chaps.txt: file with titles each on one line
mp3--bulk-title-here() {
    dos2unix "${1}"
    operon clear 'title' *.mp3
    ls -1 *.mp3 > flist.txt
    paste flist.txt "$1" > out.txt
    while IFS=$'\t' read -r fname title ; do
        operon add 'title' "${title}" "${fname}"
        # printf '%s\n' "$fname"
        # printf '%s\n' "$title"
    done < out.txt
    rm flist.txt out.txt
}


function m4b--rmlyrics() {
    # remove lyrics from source file before using LosslessCut
    fil="$1"
    case $fil in
      *.m4b)
        mp4tags -r "lyrics" "${fil}"
        ;;

      *.mp3)
        operon clear lyrics "${fil}"
        ;;

      *)
        exit 1
        ;;
    esac
}


function audacity--labels-to-csv() {
    # some file exported by audacity called Labels.txt
    fil="$1"
    csvformat -t -D, "${fil}" > "${fil%txt}"csv
}

function m4b--title() {
    # Set title to filename in LosslessCut output
    for rc in *.m4b; do
        operon fill --dry-run "<title>.m4b" "$rc"
        operon fill "<title>.m4b" "$rc"
    done
    for rc in *.mp3; do
        operon fill --dry-run "<title>.mp3" "$rc"
        operon fill "<title>.mp3" "$rc"
    done

}

# TODO extension m4a
# TODO emacsclient --eval "(message Edit chapters, then press SPC F d)"
mp4chaps--pipeline() {
    local fname="${1}"
    mp4chaps -x "${fname}"
    emacsclient --create-frame --alternate-editor= "${fname%m4b}chapters.txt"
    mp4chaps -r "${fname}"
    mp4chaps -i "${fname}"
}


quodlibet--transfer-ratings () {
    # 0. export favs from musicolet as Favorites.m3u
    # 0. quodlibet-rate-up.bash <(m3u--files Favorites.m3u)
    # 1. save queue to playlist `tmp`
    # 2. Panned browser: ~playlists=tmp
    # 3. Manipulate ratings
    # 4. empty queue, delete playlist `tmp`, remove favs from musicolet
    quodlibet-rate-up.bash <(m3u--files "${1}")
}
