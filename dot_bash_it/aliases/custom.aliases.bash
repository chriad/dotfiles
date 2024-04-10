# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'
alias l=exa

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# taskset -c <x> : reserve processor, make faster
alias adb--wifi="adb connect 192.168.2.167:5555"
alias dmesg="dmesg -wL" # color and --tail

# flatpak --command
alias gpodder="taskset -c 0 /usr/bin/flatpak run --command=/app/bin/gpodder org.gpodder.gpodder 2> /dev/null &"
alias gpo='flatpak run --command=/app/bin/gpo org.gpodder.gpodder'
alias operon='flatpak run --command=operon io.github.quodlibet.QuodLibet'
alias ebook-meta='flatpak run --command=ebook-meta com.calibre_ebook.calibre'

alias s="kitten ssh"
alias catp="cat -p"
alias fzf--screencasts="rg -g /home/chriad/Videos/Screencasts/*.{mkv,mp4,ogv,webm} --files 2> /dev/null | fzf --bind='enter:execute(mpv {})'"
alias reload_custom_aliases=". ~/.bash_it/aliases/custom.aliases.bash"
alias digikam="QT_QPA_PLATFORM=xcb digikam 2> /dev/null &"
alias task--count="task count status:pending"
alias gedit=gnome-text-editor

# 1 letter
alias n='nautilus . &'
alias e="emacsclient --no-wait --create-frame --alternate-editor="
alias a="alias|fzf"
alias T="task|fzf"
alias zz="ls|fzf"
alias recollcmd=recollq

# ffmpeg
# alias ffmpeg='ffmpeg -hide_banner -loglevel warning -nostats '
alias ffplay='ffplay -hide_banner -autoexit '
alias ffprobe='ffprobe -hide_banner  '

alias cpdf="cpdf 2>/dev/null"
alias cpdf--help-browse='cpdf -help | fzf'
alias cpdf--list-bookmarks="cpdf -list-bookmarks"
alias cpdf--list-annotations="cpdf -list-annotations-json"
alias space='gdu /media/chriad -sd'

alias losslesscut-export='nohup snap run losslesscut_export &'

# simplest alias
alias fd=fdfind
alias mp4box=MP4Box
alias cat=batcat
alias ripgrep=rg
alias z=zathura
alias say=spd-say
alias lilipond=lilypond
alias pdf2text=pdftotext
alias powershell=pwsh
alias info=pinfo
alias lisp=clisp
alias chriad-browse--kernel-handbook="www-browser /usr/share/doc/debian-kernel-handbook/kernel-handbook.html"
alias chriad-browse--racket="www-browser /usr/share/doc/racket/r5rs/index.html"

# first order alias
alias detox="detox --remove-trailing"
alias mv="mv -ivu"
alias cp="cp -ivu"
alias rmd="sudo rm -r"
alias cpd="sudo cp -r"
alias rmff='rm -rf'

# navigation
alias torhome='cd /home/chriad/.local/share/torbrowser/tbb/x86_64/tor-browser/Browser/Downloads'
alias firefoxhome='cd /home/chriad/snap/firefox/common/.mozilla/firefox/n1icf8cs.default-1634140706732'
alias lolc='cd /media/chriad/ext4/losslesscut'

# flatpak
alias calibre=com.calibre_ebook.calibre
alias quodlibet=io.github.quodlibet.QuodLibet

# quodlibet
alias quodlibet--taskset="taskset -c 1 io.github.quodlibet.QuodLibet 2> /dev/null &"
alias quodlibet--playlists='cat /home/chriad/.var/app/io.github.quodlibet.QuodLibet/config/quodlibet/lists/queries.saved 2> /dev/null | paste -sd"\t\n" | fzf --delimiter="\t" --with-nth=1 --bind "enter:execute(echo {2})+abort"'
alias quodlibet--sync='cat ~/.var/app/io.github.quodlibet.QuodLibet/config/quodlibet/config | grep  synchronize_to_device_query | fzf --bind "enter:execute(echo {})+abort"'

alias ipynb-view="jupyter nbconvert --stdout --to markdown"
alias cl-repl="sbcl --eval '(ql:quickload :cl-repl)' --eval '(cl-repl:main)' --quit"
alias remote-diff='git diff master..origin/master'
alias gpol='gpo -q list 2> /dev/null | paste -sd"\t\n" | fzf --delimiter="\t" --with-nth=1 --bind "enter:execute(echo {2})+abort"'
alias tt='gio trash' # to trash
alias nethogs="nethogs -v 3"
alias fzfp="fzf --preview='batcat --color=always {}'"
alias uncaps='xdotool key Caps_Lock'
alias bdfr='conda run -n py39 python3 -m bdfr'

# chezmoi
alias cs='chezmoi status 2>/dev/null'
# alias cm="chezmoi managed --include files,symlinks | fzf --bind='enter:execute(chezmoi merge ~/{})'"
alias cm="chezmoi status 2>/dev/null | sed -e 's/^[ \t]*//' | fzf --bind='enter:execute(chezmoi merge ~/{2})'"
alias cc='chezmoi cd'

# alias firefox="firefox -P -no-remote" # multiple concurrent profiles
alias jpdf="java -jar /media/chriad/ext4/SOFTWARE/jpdftweak-linux-x64-1.1/jpdftweak.jar" # use flatpak version
alias ls-git-cwd='find . -name "*.git" -type d'
alias git-summary='/home/chriad/git-summary/git-summary'
# alias bio="recoll -c /media/chriad/E/BOOKS-and-CODE/.recoll/"
# alias recr="recoll -c /media/chriad/E/CALIBRE_LIBRARIES/R/.recoll/"
# alias rasp="recoll -c /media/chriad/E/CALIBRE_LIBRARIES/raspberrypi/.recoll/"
# alias pyth="recoll -c /media/chriad/E/CALIBRE_LIBRARIES/PYTHON/.recoll/"
# alias rescue-emacs="killall -s USR2 emacs"
alias raspb-connect="screen /dev/ttyUSB0 115200"
# alias regex-buddy="wine /home/chriad/.wine/dosdevices/c\:/Program\ Files\ \(x86\)/JGsoft/RegexBuddy3/RegexBuddy.exe"
alias lisp-works="/usr/local/lib64/LispWorksPersonal/lispworks-personal-7-1-2-amd64-linux"
alias et="emacsclient -t"
alias c2='cd ../../'
# alias xpdf="~/Desktop/XpdfReader-linux64-4.01.01/xpdf"
alias gsadd='git submodule add'
alias bfg="java -jar /home/chriad/bfg-1.13.0.jar"
alias mpv--debug="mpv --input-test --force-window --idle --osc=no" #mpv debug to show keybindings
alias rsbcl='rlwrap sbcl'
alias git-aliases='bash-it help aliases git|fzf'
# alias xc='xclip -selection clipboard'
# alias remotek='telnet 192.168.0.6 2323'
# exact match by default
# alias=fzf='fzf -e'
# alias ls="exa"
alias enw="emacs -nw"
alias pretty-json="python2 -mjson.tool"
#Unfortunately doesn't work
#alias ;s=ls
alias pdf--fzf="rg -g *.pdf --files|fzf"
alias fzf--pdf="rg -g *.pdf --files|fzf"
alias asciiplay="asciinema play"
# alias mpv="mpv --input-unix-socket=$HOME/.mpv/socket"
# alias mpv="mpv --really-quiet --input-ipc-server=$HOME/.mpv/socket --osd-font-size=10"
# alias mpv2="mpv --really-quiet --input-ipc-server=/tmp/mpvsocket --idle"
# alias mpv="nohup mpv --really-quiet --input-ipc-server=$HOME/.mpv/socket &"
alias fzf--video="rg -g '*.{mkv,mp4,ogv,webm}' --files 2> /dev/null | fzf --bind='enter:execute(mpv {})'"
alias mpv--add-to-playlist-here="rg -g '*.{mkv,mp4,ogv,webm,m4a}' --files 2> /dev/null | mpv --playlist=-" # use ENTER to advance to next item in playlist
# alias ee="set -o emacs"
# alias vv="set -o vi"
alias al='ls -AFlah'
# alias pdfgrep='pdfgrep -Hn -C 3 --recursive -m 10'
# alias mplayer="mplayer -vo sdl"
alias remove_whitespaces="rename 's/ /-/g' *"
# alias kill-key-mon="kill $(ps aux| grep key-mon | grep python | awk '{print $2}')"
# alias b="WD=\$(pwd);cd /media/chriad/E/MENDELEY_WATCHED;zathura \"\$(fzf)\";cd \$WD"
# alias key-mon="key-mon &"
# alias diff=colordiff
alias mplayer="mplayer -af scaletempo"
# alias python="ptpython"
# alias vim0="nvim -u NONE -N"
# alias ini="vim ~/.config/nvim/init.vim"
alias clipit="xclip -selection clipboard" # use e.g. ls | clipit
alias gitaliases="git config --list"

alias largefiles="ls -Slr| head -n10"
alias findbig="/usr/bin/find ./ -type f -print0 | xargs -0 du | sort -n | tail -n 100 | cut -f2 | xargs -I{} du -sh {}"
alias findbigdir="/usr/bin/find ./ -maxdepth 1 -type d -print0 | xargs -0 du --max-depth=1 | sort -n | tail -n 50 | tail -n +1 | cut -f2 | xargs -I{} du -sh {}"

# alias puddletag="puddletag ."

# alias sckill='kill $(ps -C screenkey -o pid=)'
# Path to the bash it configuration
# alias clip='xclip -selection clipboard'
alias bashit--active-aliases="bashit show aliases | grep '\[x\]'"
alias lst='exa -snew|tail'
alias fuzb='source ~/fzf-chrome-bookmarks/fzf-chrome-bookmarks.sh'
alias catf='cat <<eof>README.org'
# alias youtube-dl-geo='/usr/local/bin/youtube-dl --geo-bypass-country de'
alias diff-spacemacs='meld ~/.dotfiles/spacemacs ~/.emacs.d/core/templates/.spacemacs.template'
alias scan-home-network="sudo nmap -sn 192.168.1.0/24"
# alias igv="/media/chriad/IGV_Linux_2.7.2/igv.sh"
# alias keycode="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
# alias which="type -p"
alias git-summary='/home/chriad/git-summary/git-summary'
alias pdf--txt='pdftotext -layout -eol unix -nopgbrk'
alias ipinfo='curl ipinfo.io'
# alias pvcli=protonvpn-cli
# alias subscriptions='ytcc -o xsv subscriptions -a name|fzf'

# execs
alias pdf--pdfbox-debugger-app='env _JAVA_AWT_WM_NONREPARENTING=1 java -jar /home/chriad/.local/bin/debugger-app-3.0.0-alpha2.jar'
alias pdf--pdfbox-app='env _JAVA_AWT_WM_NONREPARENTING=1 java -jar /home/chriad/.local/bin/pdfbox-app-3.0.0-alpha2.jar'
alias epub--epubcheck='java -jar ~/.local/bin/epubcheck.jar'
alias textricator='~/textricator-9.2.56/textricator'
alias jpdf="java -jar /media/chriad/ext4/SOFTWARE/jpdftweak-linux-x64-1.1/jpdftweak.jar" # use flatpak version
alias retro-term="/home/chriad/github_scripts/cool-retro-term/Cool-Retro-Term-1.1.1-x86_64.AppImage"

# chriad-mount sdi1 usb
chriad-mount() {
   sudo mount -o uid=chriad,gid=chriad,rw,defaults /dev/"${1}" /home/chriad/"${2}"
}

#call with asciimux "session_name_here" "file_name_here", must
#have ""
ghist() {
    git log --oneline --name-only $1
}

# pipe this to file for reference for static playlists
dump-playlist-here() {
    youtube-dl --get-title "$1" -o "%(playlist_index)d    %(title)s.%(ext)s" &> "$1".dump
}

dump-metadata() {
	ffmpeg -i "$1" -f ffmetadata - 2> /dev/null
}

git_diff_pdf() {
    yes | git difftool --tool=diffpdf $1
}

emby-poster-here() {
	# first copy pic from firefox contex menu into clipboard: "Copy Image"
	xclip -selection clipboard -t image/png -o > folder.png
}

youtube-dl-audio() {
    /usr/local/bin/youtube-dl --extract-audio --restrict-filenames --write-info-json --write-description --write-auto-sub --sub-lang en --audio-format mp3 "$1"
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


# fdd- cd to selected directory
# mnemonic cd down -> show all subdirectories

# cdd() {
#   local dir
#   dir=$(/usr/bin/find ${1:-.} -path '*/\.*' -prune \
#                   -o -type d -print 2> /dev/null | fzf +m) &&
#   cd "$dir"
# }



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
ldir() {
	locate -0 "*/$1" | xargs -0 -n1 dirname
}
