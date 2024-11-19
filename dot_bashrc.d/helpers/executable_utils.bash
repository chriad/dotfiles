# select a parent directory of the current, means cd parent
p() {
    local declare dirs=()
    get_parent_dirs() {
        if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
        if [[ "${1}" == '/' ]]; then
            for _dir in "${dirs[@]}"; do echo $_dir; done
        else
            get_parent_dirs $(dirname "$1")
        fi
    }
    local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
    cd "$DIR"
}

# Another fd - cd into the selected directory
# This one differs from the above, by only showing the sub directories and not
#  showing the directories within those.
d() {
    # DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
        DIR=`fdfind ".*" -d 1 --type d 2> /dev/null | fzf-tmux` \
            && cd "$DIR"
}

mkcdir ()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

chriad--add-bak-ext() {
    fd -e "${1}" -x cp "{}" "{}".bak
}

chriad--motd() {
    # on a LBS (linux base system) compliant system
    whatis true | cut -d- -f2 | cut -c2-
}

apt--installedp() {
    apt list --installed 2>/dev/null | grep "${1}"
}

# jar file is not executable
dra--update-epubcheck() {
    p="/media/chriad/ext4/SOFTWARE"
    dra download --select "epubcheck-{tag}.zip" -o $p/epubcheck-current.zip w3c/epubcheck
    unzip $p/epubcheck-current.zip
    pa=`unzip -Z -1 epubcheck-current.zip "*/epubcheck.jar"`
    ln -sf $p/$pa ~/.local/bin/
    rm $p/epubcheck-current.zip
    # chmod +x ludusavi
    # mv ludusavi "$HOME"/.local/bin/
}

guix--vm() {
    qemu-system-x86_64 \
        -nic user,model=virtio-net-pci \
        -enable-kvm -m 2048 \
        -device virtio-blk,drive=guix-live \
        -device virtio-serial-pci,id=virtio-serial0,max_ports=16,bus=pci.0,addr=0x5 \
        -chardev spicevmc,name=vdagent,id=vdagent \
        -device virtserialport,nr=1,bus=virtio-serial0.0,chardev=vdagent,name=com.redhat.spice.0 \
        -drive if=none,file=/media/chriad/ssd-45/guix-system.img,id=guix-live
}

parlement-dl() {
    curl "${1}" -o vid
    curl "${2}" -o sub
    tt convert -i sub --itype ttml -o sub.srt
    ffmpeg -hide_banner -loglevel warning -nostats -i vid -i sub.srt -map 0:v -map 0:a -map 1 -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=eng "Parlement S""${3}""E""${4}".mp4

    rm vid sub sub.srt
}

screencast() {
    wf-recorder -a -f /home/chriad/Videos/"${1}".mkv
}

# # use gdebi instead of dpkg
# dpkg () {
#     local OPTIND OPTARG
#     local real_command="gdebi"
#     local command_args=()
#     while getopts :i opt; do
#         case $opt in
#             i) command_args+=( "--apt-line" ) ;;
#             ?) echo "unknown option: -$OPTARG" >&2
#             return 1
#             ;;
#         esac
#     done
#     shift $((OPTIND - 1))

#     "$real_command" "${command_args[@]}" "$@"
# }
