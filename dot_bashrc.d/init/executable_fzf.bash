[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# export FZF_DEFAULT_OPTS="--multi --bind='f1:execute(less -f {}),`
# `ctrl-y:execute(echo {} | xclip -selection clipboard)+abort,`
# `ctrl-z:execute-silent(zathura {})+abort,`
# `ctrl-h:execute(python ~/fzf-optparse.py|less -f),`
# `ctrl-b:execute(echo {} | xargs -d '\n' feh -w),`
# `ctrl-f:execute(feh {}),`
# `ctrl-v:execute(mpv --really-quiet {} &),`
# `ctrl-e:execute(chezmoi edit {}),`
# `ctrl-x:execute(chezmoi merge ~/{}),`
# `ctrl-o:execute(cat {} >> ~/bla.file)+abort'"

# use ctrl+m with alias cm

source $chriad_software/fzf-tab-completion/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'


fzf--browse-playlist-favs() {
    local favs='/home/chriad/.local/share/chezmoi/ignored/@Favorites.xspf'
    xpath -q -e '//title' "${favs}" | sed -e ':a;N;$!ba;s/<[^>]*>//g' |tail --lines +2 |fzf
}

koreader--ebook-view ()
{
    local d;
    d=/media/chriad/ssd-45/KOReader-Books
    fd --prune -e epub --base-directory $d | fzf --bind="enter:become(koreader /media/chriad/ssd-45/KOReader-Books/{} 2>&1 > /dev/null & disown)"
}
