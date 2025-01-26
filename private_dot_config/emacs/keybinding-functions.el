(defcustom chriad-search-plist nil "Pairs of search function suffixes and their locations"
  :type '(alist :key-type string :value-type string))

(defmacro chriad/build-search-functions ()
  (ignore))

(defun chriad/search-dpt ()
  (interactive)
  ;; (fzf-find-file-in-dir (getenv "QUADERNO_SYNC_PATH"))
  ;; (fzf-find-file-in-dir "/media/chriad/ext4/dpt-mirror/dpt")
  (let ((consult-fd-args '("fd --extension pdf --full-path")))
    (consult-fd "/media/chriad/ext4/dpt-mirror/dpt"))
  )

(defun chriad--insert-key-markup (key)
  (interactive "kType key sequence: ")
  (insert (format "%s" (help-key-description key nil))))

(defun chriad/search-dotfilers ()
  ;; jump to a dir of some person
  (interactive)
  (consult-ripgrep "~/gh-dotfiles/"))

;; TODO
;; (defun chriad/search-dotfilers-dir ()
;;   ;; jump to a dir of some person
;;   (interactive)
;;   (let ((consult-grep-args '("grep --files-with-matches -r")))
;;     (consult-grep "~/gh-dotfiles/")))


;; TODO must also search package-directory-list for guix
;; TODO use symbol at point as default search term
(defun chriad/search-elpa ()
  "Search for code in packages. "
  (interactive)
  (let ((consult-ripgrep-args (concat consult-ripgrep-args " -t elisp")))
    (consult-ripgrep package-user-dir)))


(defun chriad/search-emacs ()
  "Search for code in packages. "
  (interactive)
  (let ((consult-ripgrep-args (concat consult-ripgrep-args " -t elisp -t gzip")))
    (consult-ripgrep "/home/chriad/.guix-profile/share/emacs/29.4/lisp/")))

(defun chriad/search-layers ()
  "Search for code in packages. "
  (interactive)
  (let ((consult-ripgrep-args (concat consult-ripgrep-args " -t elisp")))
    (consult-ripgrep "/media/chriad/nebula/spacemacs-fork/layers")))



(defun chriad/search-systemd-units ()
  (interactive)
  (spacemacs/helm-files-do-rg "/usr/lib/systemd/user"))

(defun chriad/search-dotfiles ()
  (interactive)
  (spacemacs/helm-files-do-rg ""))

(defun chriad/search-roam ()
  (interactive)
  (consult-ripgrep org-roam-directory))

(defun chriad/search-spacemacs-core ()
  (interactive)
  (consult-ripgrep "/media/chriad/nebula/spacemacs-fork/core"))

(defun chriad/find-custom-aliases ()
  (interactive)
  ;; (find-file (concat (getenv "BASH_IT") "/aliases/custom.aliases.bash")
  (chezmoi-find (concat "/home/chriad/.bash_it" "/aliases/custom.aliases.bash")))

(defun chriad/find-custom-keymap ()
  (interactive)
  (chezmoi-find "/home/chriad/.config/emacs/o-keymap.el"))

(defun chriad/find-custom-settings ()
  (interactive)
  (find-file "/home/chriad/.local/share/chezmoi/ignored/emacs-custom.el"))

(defun chriad/find-custom-bookmark-file ()
  (interactive)
  (switch-to-buffer (find-file-noselect "/home/chriad/.config/emacs/bookmarks")))

(defun chriad/find-bashrc ()
  (interactive)
  (chezmoi-find "/home/chriad/.bashrc"))

(defun chriad/find-dotfile ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (chezmoi-find (dotspacemacs/location)))
