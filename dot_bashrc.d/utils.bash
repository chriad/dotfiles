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

add-bak-ext() {
    fd -e "${1}" -x cp "{}" "{}".bak
}
