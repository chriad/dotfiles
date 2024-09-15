;;;; spacemacs private ``o'' keymap

;;; use c-h c (describe-key-briefly) to see the key name
;; (keymap-global-set (kbd "Spc-C-Spc") 'execute-extended-command-for-buffer)
(keymap-global-set "C-x <home>" 'execute-extended-command-for-buffer)
(keymap-global-set "C-x 8 _" '(lambda () (insert-char ?\​))) ;; zero width space for org-mode markup escape
(keymap-global-set "<kp-enter>" 'ignore)
(keymap-global-set "<kp-delete>" 'ignore)
(keymap-global-set "C-<f8>" 'ignore)
(keymap-global-set "s-]" 'ignore)

;;; remapping

;; TODO does not interop with pp+
(global-set-key [remap eval-expression] 'pp-eval-expression)

;; -----------------

(defcustom chriad-search-plist nil "Pairs of search function suffixes and their locations"
  :type '(alist :key-type string :value-type string))

(defmacro chriad/build-search-functions ()
  (ignore))

(defun chriad/search-dpt ()
  (interactive)
  ;; (fzf-find-file-in-dir (getenv "QUADERNO_SYNC_PATH"))
  (fzf-find-file-in-dir "/media/chriad/ext4/dpt-mirror/dpt"))


(defun chriad/search-dotfilers ()
  ;; jump to a dir of some person
  (interactive)
  (helm-find-files-1 "~/gh-dotfiles/"))

;; TODO must also search package-directory-list for guix
;; TODO use symbol at point as default search term
(defun chriad/search-elpa ()
  "Search for code in packages. "
  (interactive)
    (let ((root-helm-ag-base-command "rg --smart-case --no-heading --color=never -t el"))
      (spacemacs/helm-files-do-rg package-user-dir)))

(defun chriad/search-systemd-units ()
  (interactive)
      (spacemacs/helm-files-do-rg "/usr/lib/systemd/user"))

(defun chriad/search-dotfiles ()
  (interactive)
      (spacemacs/helm-files-do-rg ""))

(defun chriad/search-roam ()
  (interactive)
      (spacemacs/helm-files-do-rg org-roam-directory))

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


;;; global personal bindings

;; note to self: order alphabetically
;; use transpose lines to order: SPC x t l
(spacemacs/declare-prefix "o" "private keymap")

;; a
(spacemacs/set-leader-keys "oa" 'projectile-add-known-project)

;; b
(spacemacs/declare-prefix  "ob" "bookmarks")
(spacemacs/set-leader-keys "obt" 'bmkp-jump-to-type-other-window)
(spacemacs/set-leader-keys "obs" 'bmkp-bookmark-file-switch-jump)
(spacemacs/set-leader-keys "obi" 'bmkp-set-info-bookmark-with-node-name)

;; c
(spacemacs/declare-prefix  "oc" "customize")
(spacemacs/set-leader-keys "oca" 'customize-apropos) ;; show n
(spacemacs/set-leader-keys "ocb" 'customize-browse) ;; show n
(spacemacs/set-leader-keys "ocg" 'customize-group)
(spacemacs/set-leader-keys "oco" 'customize-option-other-window) ;; show 1
(spacemacs/set-leader-keys "ocs" 'customize-set-value) ;; set 1
(spacemacs/set-leader-keys "ocv" 'customize-variable)

;; d
(spacemacs/declare-prefix  "od" "describe")
(spacemacs/set-leader-keys "odb" 'describe-bindings)
(spacemacs/set-leader-keys "odm" 'describe-minor-mode-from-indicator)
(spacemacs/set-leader-keys "odp" 'describe-personal-keybindings)

;; D
(defalias 'debug-cancel-on-entry 'cancel-debug-on-entry)
(spacemacs/declare-prefix  "oD" "debug")
(spacemacs/declare-prefix  "oDd" "Debug")
(spacemacs/set-leader-keys "oDdc" 'debug-cancel-on-entry)
(spacemacs/set-leader-keys "oDde" 'debug-on-entry)
(spacemacs/set-leader-keys "oDdq" 'toggle-debug-on-quit) ;; didn't get that error message just before emacs shutdown?
(spacemacs/declare-prefix  "oDe" "edebug")
(spacemacs/set-leader-keys "oDei" 'edebug-inline-result-mode) ;; toggle
(spacemacs/set-leader-keys "oDee" 'edebug-on-entry)
(spacemacs/set-leader-keys "oDec" 'edebug-cancel-on-entry)

;; f
(spacemacs/declare-prefix  "of" "files")
(spacemacs/set-leader-keys "ofa" 'chriad/find-custom-aliases)
(spacemacs/set-leader-keys "ofb" 'chriad/find-bashrc)
(spacemacs/set-leader-keys "ofB" 'chriad/find-custom-bookmark-file)
(spacemacs/set-leader-keys "ofc" 'chriad/find-custom-settings)
;; ofd -> chezmoi prefix
(spacemacs/set-leader-keys "ofe" 'chriad/find-dotfile)
(spacemacs/set-leader-keys "off" 'chezmoi-find)
(spacemacs/set-leader-keys "ofk" 'chriad/find-custom-keymap)

(spacemacs/declare-prefix  "oo" "org")
(spacemacs/set-leader-keys "ool" 'ace-link-org)
(spacemacs/set-leader-keys "oor" 'org-ref-cite-insert-helm)
(spacemacs/set-leader-keys "oop" 'org-previous-link)
(spacemacs/set-leader-keys "oon" 'org-next-link)
(spacemacs/declare-prefix  "ooC" "org clocks")
(spacemacs/set-leader-keys "ooCi" 'org-mru-clock-in)
(spacemacs/set-leader-keys "ooCr" 'org-mru-clock-select-recent-task)

(spacemacs/declare-prefix  "om" "menu")
(spacemacs/set-leader-keys "omm" 'minions-minor-modes-menu)

(spacemacs/declare-prefix  "os" "search")
(spacemacs/set-leader-keys "osq" 'chriad/search-dpt)
(spacemacs/set-leader-keys "ose" 'chriad/search-elpa)
(spacemacs/set-leader-keys "osd" 'chriad/search-dotfiles)
(spacemacs/set-leader-keys "osD" 'chriad/search-dotfilers)
(spacemacs/set-leader-keys "osr" 'chriad/search-roam)
(spacemacs/set-leader-keys "oss" 'chriad/search-systemd-units)
(spacemacs/set-leader-keys "ot" 'terminal-here-launch)


;; h
(spacemacs/declare-prefix  "oh" "helm")
(spacemacs/set-leader-keys "ohd" 'helm-disable-minor-mode)
(spacemacs/set-leader-keys "ohe" 'helm-enable-minor-mode)
(spacemacs/set-leader-keys "ohf" 'helm-firefox-bookmarks)
(spacemacs/set-leader-keys "ohc" 'helm-lisp-completion-at-point)
(spacemacs/set-leader-keys "oho" 'helm-org-in-buffer-headings)
(spacemacs/set-leader-keys "oht" 'helm-org-capture-templates)

(spacemacs/declare-prefix  "ohy" "helm-yas")
(spacemacs/set-leader-keys "ohyr" 'helm-yas-create-snippet-on-region)
(spacemacs/set-leader-keys "ohyy" 'spacemacs/helm-yas)

(spacemacs/declare-prefix  "ohi" "helm info")
(spacemacs/set-leader-keys "ohii" 'helm-info)
(spacemacs/set-leader-keys "ohiu" 'helm-info-use-package)

(spacemacs/declare-prefix  "ohie" "helm-info-{lisp related}")
(spacemacs/set-leader-keys "ohiei" 'helm-info-eintr)
(spacemacs/set-leader-keys "ohiem" 'helm-info-emacs)
(spacemacs/set-leader-keys "ohiel" 'helm-info-elisp)
(spacemacs/set-leader-keys "ohiec" 'helm-info-cl)

;; n
(spacemacs/declare-prefix  "on" "navigate")
(spacemacs/set-leader-keys "onf" 'select-frame-by-name)
(spacemacs/set-leader-keys "ons" 'sway-focus-container)
(spacemacs/set-leader-keys "onb" 'spacemacs/switch-to-buffer-other-frame)

;; p
(spacemacs/declare-prefix  "op" "play") ;; games
(spacemacs/declare-prefix  "opa" "achievements")
(spacemacs/set-leader-keys "opal" 'achievements-list-achievements)

(spacemacs/set-leader-keys "opc" 'world-clock)

(spacemacs/declare-prefix  "opf" "fortune")
(spacemacs/set-leader-keys "opfm" 'fortune-message)
(spacemacs/set-leader-keys "opfr" 'fortune-from-region)

(spacemacs/set-leader-keys "opw" 'spacemacs/count-words-analysis)

;; (spacemacs/set-leader-keys "ot" 'tab-bar-new-tab)

;; (spacemacs/declare-prefix "or" "roam")
;; (spacemacs/set-leader-keys "orn" 'my/navigate-note)
;; (spacemacs/set-leader-keys "orh" 'org-roam-create-note-from-headline)

;; w
(spacemacs/declare-prefix  "ow" "which key")
(spacemacs/set-leader-keys "owf" 'which-key-show-full-major-mode)
(spacemacs/set-leader-keys "owj" 'which-key-show-major-mode)
(spacemacs/set-leader-keys "owi" 'which-key-show-minor-mode-keymap)

;; x
;;; stuff that fits nowhere else?
(spacemacs/declare-prefix  "ox" "sometimes useful")
(spacemacs/set-leader-keys "oxp" 'spacemacs/paradox-list-packages)
(spacemacs/set-leader-keys "oxe" 'epkg-list-packages)


;;;; mode specific personal bindings ---------------

;;; eww-mode
;; l
(spacemacs/declare-prefix-for-mode 'eww-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'eww-mode "ol" 'ace-link-eww)

;;; emacs-lisp-mode
(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "mo" "custom")

;; t
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "ot" 'tiny-expand)
;; e
(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "moe" "debug")
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "oei" 'edebug-x-show-instrumented)
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "oee" 'edebug-eval-top-level-form)


;; ----------------

;; same as RET; mouse-save-then-kill is dangerous
;; (define-key dired-mode-map [mouse-3] 'dired-mouse-find-file) ; right click opens inplace

;; (define-key spacemacs-pdf-view-mode-map (kbd "s a") 'pdf-view-auto-slice-minor-mode)
;; (define-key pdf-view-mode-map (kbd "<tab>") 'other-window)

;; nonstandard keys


(define-key lisp-interaction-mode-map (kbd "C-e") 'pp-eval-last-sexp)



;; (defun add-f-to-keyquiz ()
;;   ;; TODO disambiguate map
;;   ;; (("helm-command-map" "h h") ("ctl-x-map" "c h h") ("global-map" "C-x c h h"))
;;   (interactive)
;;   (add-to-list 'key-quiz--custom-keys-alist (cons (car (cdr (car (helpful--keymaps-containing helpful--sym)))) (symbol-name helpful--sym))))

;; (evil-define-key 'normal helpful-mode-map (kbd "s") 'add-f-to-keyquiz)
