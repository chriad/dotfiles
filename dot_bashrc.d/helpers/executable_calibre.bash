calibre--ebook-edit() {
    local d
    d=$CALIBRE_ROOT/reflowable
    ebook-edit "$d/$(fd --prune -e epub --base-directory $d |fzf)"
}

# TODO check for empty result and abort
calibre--ebook-view() {
    local d
    d=$CALIBRE_ROOT/reflowable
    ebook-viewer "$d/$(fd --prune -e epub --base-directory $d |fzf)"
}

calibre--cd-data-folders() {
    local d
    d=$CALIBRE_ROOT/reflowable
    cd "$d/$(fd --prune -t d --base-directory $d --glob "data" |fzf --preview 'ls {}')"
    # fd --prune -t d --base-directory $d --glob "data" |fzf --bind  "enter:execute(cd \"/media/chriad/ssd-45/reflowable/{+}\")+accept"
}

calibre--switch-data-folders() {
    local d
    d=$CALIBRE_ROOT/reflowable
    DIR=`fd --prune -t d --base-directory $d --glob "data" | fzf-tmux` && cd $d/"$DIR"
}

calibre--favorites() {
    calibredb list -s "#rating:true" | fzf --header-lines 1
}

calibre--search-title() { calibredb list -s title:"${1}"; }


koreader--ebook-view ()
{
    local d;
    d=/media/chriad/ssd-45/KOReader-Books
    fd --prune -e epub --base-directory $d | fzf --bind="enter:execute(koreader /media/chriad/ssd-45/KOReader-Books/{} 2>&1 > /dev/null &)+accept"
}
