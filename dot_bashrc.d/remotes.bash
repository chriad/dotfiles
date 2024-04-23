hib() {
    local x=`cat /etc/hosts | egrep -v '^#' | cut -d" " -f3 | egrep -v '^$' | uniq | fzf`
    ssh "${x}" -t sudo systemctl hibernate
}

wolan() {
    local x=`cat /etc/hosts | egrep -v '^#' | cut -d" " -f3 | egrep -v '^$' | uniq | fzf`
    wakeonlan -f ~/.config/wol/"${x}".wol
}
