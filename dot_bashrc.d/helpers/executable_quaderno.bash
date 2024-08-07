# quaderno

export QUADERNO_STATIC_IP="192.168.2.199"
export QUADERNO_SYNC_PATH="/media/chriad/ext4/dpt-mirror/dpt"

quaderno() { dptrp1 --addr "$QUADERNO_STATIC_IP" "${@}" ; }

quaderno--sync() { dptrp1 --addr "$QUADERNO_STATIC_IP" sync "$QUADERNO_SYNC_PATH"; }

quaderno--download() { dptrp1 --addr "$QUADERNO_STATIC_IP" download "${1}" ./ ; }

quaderno--delete() { dptrp1 --addr "$QUADERNO_STATIC_IP" delete "${1}" ; }

quaderno--list-rootdir-documents() {
    dptrp1 --addr "$QUADERNO_STATIC_IP" list-documents | grep '^[^/]*/[^/]*$'
}

quaderno--list-all-documents() {
    dptrp1 --addr "$QUADERNO_STATIC_IP" list-documents
}

alias quaderno--upload="dptrp1 --addr 192.168.2.199 upload"

quaderno--pdffd() {
    local path="$QUADERNO_ROOT/dpt"
    fdfind -e pdf . $path 2> /dev/null | fzf --bind='enter:execute(emacsclient -c {}  &>/dev/null &)+abort,ctrl-r:become(org.kde.okular {}),ctrl-p:become(pdfarranger {})'
    # fdfind -e pdf . $path 2> /dev/null | fzf --bind='enter:execute(flatpak run org.kde.okular {}  &>/dev/null &)+abort'
    # fdfind -e pdf . $path 2> /dev/null | fzf --bind='enter:execute(sioyek {} &)+abort'
}
alias pdffd=quaderno--pdffd

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
