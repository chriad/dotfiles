# From laptop
# to programatically untoggle caps lock if it is stuck
alias fd=fdfind
alias calibredb='flatpak run --command=calibredb com.calibre_ebook.calibre'
alias tt='gio trash' # to trash
alias nethogs="nethogs -v 3"
alias fzfp="fzf --preview='batcat --color=always {}'"
alias uncaps='xdotool key Caps_Lock'
alias bdfr='conda run -n py39 python3 -m bdfr'
alias cs='chezmoi status'
alias cm='chezmoi managed --include files,symlinks | fzf'
alias cc='chezmoi cd'
# alias firefox="firefox -P -no-remote" # multiple concurrent profiles
alias jpdf="java -jar /home/chriad/jpdftweak-linux-x64-1.1/jpdftweak.jar"
alias ls-git-cwd='find . -name "*.git" -type d'
alias git-summary='/home/chriad/git-summary/git-summary'
alias retro-term="/home/chriad/github_scripts/cool-retro-term/Cool-Retro-Term-1.1.1-x86_64.AppImage"
alias bio="recoll -c /media/chriad/E/BOOKS-and-CODE/.recoll/"
alias recr="recoll -c /media/chriad/E/CALIBRE_LIBRARIES/R/.recoll/"
alias rasp="recoll -c /media/chriad/E/CALIBRE_LIBRARIES/raspberrypi/.recoll/"
alias pyth="recoll -c /media/chriad/E/CALIBRE_LIBRARIES/PYTHON/.recoll/"
alias rescue-emacs="killall -s USR2 emacs"
alias raspb-connect="screen /dev/ttyUSB0 115200"
alias regexp-buddy="wine /home/chriad/.wine/dosdevices/c\:/Program\ Files\ \(x86\)/JGsoft/RegexBuddy3/RegexBuddy.exe"
alias lisp-works="/usr/local/lib64/LispWorksPersonal/lispworks-personal-7-1-2-amd64-linux"
alias et="emacsclient -t"
alias e="emacsclient --no-wait"
alias c2='cd ../../'
alias xpdf="~/Desktop/XpdfReader-linux64-4.01.01/xpdf"
alias gsadd='git submodule add'
alias bfg="java -jar /home/chriad/bfg-1.13.0.jar"
alias detox="detox --remove-trailing"
alias mpvd="mpv --input-test --force-window --idle --osc=no" #mpv debug to show keybindings
alias cat="batcat"
alias ripgrep="rg"
alias z="zathura"
alias rsbcl='rlwrap sbcl'
alias say='spd-say'
alias lilipond='lilypond'
alias git-aliases='bash-it help aliases git|fzf'
alias lisp="clisp"
alias mv="mv -ivu"
alias cp="cp -ivu"
alias rmd="sudo rm -r"
alias cpd="sudo cp -r"
alias xc='xclip -selection clipboard'
alias remotek='telnet 192.168.0.6 2323'
# exact match by default
# alias=fzf='fzf -e'
alias ls="ls --color=auto -h"
alias ls="exa"
alias enw="emacs -nw"
alias rmff='rm -rf'
alias pdf2text='pdftotext'
alias pretty-json="python2 -mjson.tool"
#Unfortunately doesn't work
#alias ;s=ls
alias zz="ls|fzf"
alias a="alias|fzf"
alias lspdf="rg -g *.pdf --files|fzf"
alias asciiplay="asciinema play"
# alias mpv="mpv --input-unix-socket=$HOME/.mpv/socket"
# alias mpv="mpv --really-quiet --input-ipc-server=$HOME/.mpv/socket --osd-font-size=10"
# alias mpv2="mpv --really-quiet --input-ipc-server=/tmp/mpvsocket --idle"
# alias mpv="nohup mpv --really-quiet --input-ipc-server=$HOME/.mpv/socket &"
alias fuzv="rg -g '*.{mkv,mp4,ogv,webm}' --files 2> /dev/null | fzf --bind='enter:execute(mpv {})'"
alias mpv-playlist="rg -g '*.{mkv,mp4,ogv,webm}' --files 2> /dev/null | mpv --playlist=-"
# alias ee="set -o emacs"
alias largefiles="ls -Slr| head -n10"
# alias vv="set -o vi"
alias al='ls -AFlah'
# alias pdfgrep='pdfgrep -Hn -C 3 --recursive -m 10'
# alias mplayer="mplayer -vo sdl"
alias remove_whitespaces="rename 's/ /-/g' *"
alias kill-key-mon="kill $(ps aux| grep key-mon | grep python | awk '{print $2}')"
alias b="WD=\$(pwd);cd /media/chriad/E/MENDELEY_WATCHED;zathura \"\$(fzf)\";cd \$WD"
alias key-mon="key-mon &"
# alias diff=colordiff
alias mplayer="mplayer -af scaletempo"
# alias python="ptpython"
alias vim0="nvim -u NONE -N"
alias ini="vim ~/.config/nvim/init.vim"
alias clipit="xclip -selection clipboard" # use e.g. ls | clipit
alias gitaliases="git config --list"
alias findbig="/usr/bin/find ./ -type f -print0 | xargs -0 du | sort -n | tail -n 100 | cut -f2 | xargs -I{} du -sh {}"
alias findbigdir="/usr/bin/find ./ -maxdepth 1 -type d -print0 | xargs -0 du --max-depth=1 | sort -n | tail -n 50 | tail -n +1 | cut -f2 | xargs -I{} du -sh {}"
alias sckill='kill $(ps -C screenkey -o pid=)'
# Path to the bash it configuration
alias clip='xclip -selection clipboard'
alias bashit_active_aliases="bashit show aliases | grep '\[x\]'"
alias n='nautilus .'
alias lst='ls -snew|tail'
alias fuzb='source ~/fzf-chrome-bookmarks/fzf-chrome-bookmarks.sh'
alias pdfbox='java -jar /home/chriad/pdfbox/pdfbox-app-3.0.0-RC1.jar'
alias textricator='~/textricator-9.2.56/textricator'
alias catf='cat <<eof>README.org'
alias youtube-dl-geo='/usr/local/bin/youtube-dl --geo-bypass-country de'
alias diff-spacemacs='meld ~/.dotfiles/spacemacs ~/.emacs.d/core/templates/.spacemacs.template'
alias scan-home-network="sudo nmap -sn 192.168.43.0/24"
alias igv="/media/chriad/IGV_Linux_2.7.2/igv.sh"
alias keycode="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
# alias which="type -p"
alias git-summary='/home/chriad/git-summary/git-summary'
alias pdf-txt='pdftotext -layout -eol unix -nopgbrk'
alias powershell='pwsh'
alias ipinfo='curl ipinfo.io'

alias subscriptions='ytcc -o xsv subscriptions -a name|fzf'

#call with asciimux "session_name_here" "file_name_here", must
#have ""
ghist() {
    git log --oneline --name-only $1
}


# pipe this to file for reference for static playlists
dump-playlist() {
    youtube-dl --get-filename "$1" -o "%(playlist_index)d    %(title)s"
}

dump-metadata() {
	ffmpeg -i "$1" -f ffmetadata - 2> /dev/null
}

git_diff_pdf() {
    yes | git difftool --tool=diffpdf $1
}

youtube-dl-audio() {
    /usr/local/bin/youtube-dl--extract-audio --restrict-filenames --write-info-json --write-description --write-auto-sub --sub-lang en --audio-format mp3 "$1"
}
# youtube-dl-playlist() {
#     /usr/local/bin/youtube-dl -i -c -o '/media/chriad/E/YOUTUBE-PLAYLISTS/%(channel)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' --write-info-json --write-thumbnail --write-description --add-metadata --write-auto-sub --sub-lang en "$1"
# }

thumbnail() {
    pdftoppm -f 1 -l 1 -scale-to 1024 -png  $1 thumb
}

asciimux() {
    cd $ASCIINEMA_HOME
    filename=$2.json
    test -f $filename || touch $filename
    asciinema rec "$filename" -c "tmux attach -t $1"
}
arec() {
    filename=$ASCIINEMA_HOME/"$1".json
    test -f $filename || touch $filename
    asciinema rec $filename

}

extract-url-pdf ()
{
    pdfx -v "$1" -o urls.txt
}

mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

mpv_p() {
    mpv --really-quiet --input-ipc-server=/tmp/mpvsocket --idle --playlist="$@"
}
# do_install "$(sudo make install)"
do_install() {
    #do things with parameters like $1 such as
    "$1" > >(tee -a stdout.log) 2> >(tee -a stderr.log >&2) | less
}

# obsolete
# open_pdf_in_vim() {
#     pdftotext -layout  $1 - | nvim -
# }

# fzf_pdf() {
#     fzf -m --print0 | xargs -0 -I {} sh -c "pdfgrep -m 10 -n -C 3 $1 '{}' | fzf --ansi -d: -n 1"
# }

pdf-metadata() {
    pdfx -v $1 -o ${1%.pdf}.pdf-metadata
}

fzf_pdf() {
    # cd media/chriad/E/CALIBRE_LIBRARIES/NEXUS_QUARANTINE;
    fzf -m --print0 | xargs -0 -I {} sh -c "pdfgrep -m 10 -n -C 3 $1 '{}' | fzf"
}
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

# fdd- cd to selected directory
# mnemonic cd down -> show all subdirectories
cdd() {
  local dir
  dir=$(/usr/bin/find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

mendel () {
    WD=$(pwd)
    cd /home/chriad/Zotero/storage/
    local DIR open
    declare -A already
    DIR="${HOME}/.cache/pdftotext"
    mkdir -p "${DIR}"
    if [ "$(uname)" = "Darwin" ]; then
        open=open
    else
        open="gio open"
    fi

    {
    ag -g ".pdf$"; # fast, without pdftotext
    ag -g ".pdf$" \
    | while read -r FILE; do
        local EXPIRY HASH CACHE
        HASH=$(md5sum "$FILE" | cut -c 1-32)
        # Remove duplicates (file that has same hash as already seen file)
        [ ${already[$HASH]+abc} ] && continue # see https://stackoverflow.com/a/13221491
        already[$HASH]=$HASH
        EXPIRY=$(( 86400 + $RANDOM * 20 )) # 1 day (86400 seconds) plus some random
        CMD="pdftotext -f 1 -l 1 '$FILE' - 2>/dev/null | tr \"\n\" \"_\" "
        CACHE="$DIR/$HASH"
        test -f "${CACHE}" && [ $(expr $(date +%s) - $(date -r "$CACHE" +%s)) -le $EXPIRY ] || eval "$CMD" > "${CACHE}"
        echo -e "$FILE\t$(cat ${CACHE})"
    done
    } | fzf -e  -d '\t' \
        --preview-window up:75% \
        --preview '
                v=$(echo {q} | tr " " "|");
                echo {1} | grep -E "^|$v" -i --color=always;
                pdftotext -f 1 -l 1 {1} - | grep -E "^|$v" -i --color=always' \
        | awk 'BEGIN {FS="\t"; OFS="\t"}; {print "\""$1"\""}' \
        | xargs $open > /dev/null 2> /dev/null
    cd $WD
            }

# alias acro='"/mnt/c/Program Files (x86)\Adobe\Acrobat 11.0\Acrobat\Acrobat.exe"'
# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
f() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

bdfr-c() {
	CMD="conda run -n py39 python3 -m bdfr\
			   clone\
			   --file-scheme {TITLE}\
			   -l '$1'\
			   /home/chriad/reddit-archive"
	eval "$CMD"
}

# A quick way to pull this image, video, without metadata. For metadata, use clone
bdfr-d() {
	CMD="conda run -n py39 python3 -m bdfr\
			   download\
			   --file-scheme {TITLE}\
			   -l '$1'\
			   /home/chriad/reddit-archive"
	eval "$CMD"
}
