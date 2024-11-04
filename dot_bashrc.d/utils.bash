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
    # file=/media/chriad/ssd-45/guix-system.img
    qemu-system-x86_64 \
        -nic user,model=virtio-net-pci \
        -enable-kvm -m 2048 \
        -device virtio-blk,drive=myhd \
        -drive if=none,file=/media/chriad/ssd-45/guix-system.img,id=myhd
}
