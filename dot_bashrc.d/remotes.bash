hib() {
    local x=`cat /etc/hosts | egrep -v '^#' | cut -d" " -f3 | egrep -v '^$' | uniq | fzf`
    ssh "${x}" -t sudo systemctl hibernate
}

wolan() {
    local x=`cat /etc/hosts | egrep -v '^#' | cut -d" " -f3 | egrep -v '^$' | uniq | fzf`
    wakeonlan -f ~/.config/wol/"${x}".wol
}

con() {
   local x=`cat /etc/hosts | egrep -v '^#' | cut -d" " -f3 | egrep -v '^$' | uniq | fzf`
   ping -c1 "$x" >/dev/null 2>&1 || { wakeonlan -f ~/.config/wol/"${x}".wol; until ping -c1 "$x" >/dev/null 2>&1; do echo -n "."; done; echo ; }
   kitten ssh "$x"
}
