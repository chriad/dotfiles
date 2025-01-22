ia_base_dir=/media/chriad/ssd-45/ia

ia--mp3-in-item() {
    d=$ia_base_dir/"${1}"
    mkdir -p -- $d && cd -- $d || return
    ia list --format "VBR MP3" --location "${1}" | tee "${1}".items
}

# retrieve all metadata from mp3's like title,album etc.
# don't need --location, can be constructed with `name`
ia--mp3-metadata-in-item() {
    d=$ia_base_dir/"${1}"
    mkdir -p -- $d && cd -- $d || return
    ia list -v --all --format "VBR MP3" "${1}" > "${1}".tsv
}

ia--inspect() {
    csvcut -t -c 'name,album,comment' "${1}" |csvlook
}

ia--drop-uninteresting() {
    csvcut -t --not-columns 'height,crc32,summation,md5,rotation,width,source,original,sha1' "${1}" | csvformat -U 2 --out-quotechar '"' > "${1%tsv}"filtered.csv
}

# ia download identifier <file>.mp3
ia--download() {
    d=$ia_base_dir/"${1}"
    mkdir -p -- $d && cd -- $d || return
    ia download "${1}" "${2}"
}
