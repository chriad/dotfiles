ia_base_dir=/media/chriad/ssd-45/ia

ia--mp3-in-item() {
    d=$ia_bas_dir/"${1}"
    mkdir -p -- $d && cd -- $d || return
    ia list --format "VBR MP3" --location "${1}" | tee "${1}".items
}
