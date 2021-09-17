export FZF_DEFAULT_OPTS="--multi --bind='f1:execute(less -f {}),`
`ctrl-y:execute(echo {} | xclip -selection clipboard)+abort,`
`ctrl-z:execute-silent(zathura {})+abort,`
`ctrl-h:execute(python ~/fzf-optparse.py|less -f),`
`ctrl-b:execute(echo {} | xargs -d '\n' feh -w),`
`ctrl-b:execute(feh {}),`
`ctrl-o:execute(cat {} >> ~/bla.file)+abort'"
