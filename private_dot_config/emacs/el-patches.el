;; (el-patch-feature magit)
;; (with-eval-after-load 'magit
;;     (transient-define-prefix magit-run ()
;;       "Run git or another command, or launch a graphical utility."
;;       [["Run git subcommand"
;;         ("!" "in repository root"   magit-git-command-topdir)
;;         ("p" "in working directory" magit-git-command)]
;;        ["Run shell command"
;;         ("s" "in repository root"   magit-shell-command-topdir)
;;         ("S" "in working directory" magit-shell-command)]
;;        ["Launch"
;;         ("k" "gitk"                 magit-run-gitk)
;;         ("a" "gitk --all"           magit-run-gitk-all)
;;         ("b" "gitk --branches"      magit-run-gitk-branches)
;;         ("g" "git gui"              magit-run-git-gui)
;;         ("m" "git mergetool --gui"  magit-git-mergetool)]])
  

;; ;;;###autoload
;; (defun magit-git-command-topdir (command)
;;   "Execute COMMAND asynchronously; display output.

;; Interactively, prompt for COMMAND in the minibuffer. \"git \" is
;; used as initial input, but can be deleted to run another command.

;; COMMAND is run in the top-level directory of the current
;; working tree."
;;   (interactive (list (magit-read-shell-command t "git ")))
;;   (magit--shell-command command (magit-toplevel))
;;   ))
