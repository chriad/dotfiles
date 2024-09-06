;;;; spacemacs private ``o'' keymap

;; (keymap-global-set (kbd "Spc-C-Spc") 'execute-extended-command-for-buffer)
;; (global-set-key (kbd "s-]") 'tab-next)
;; (global-set-key (kbd "s-[") 'tab-previous)
;; (global-set-key (kbd "s-c") 'helm-lisp-completion-at-point)
;; (keymap-global-set "s-y" 'spacemacs/helm-yas)

;; -----------------

;; TODO use find
(defun chriad/search-dpt ()
  (interactive)
  (helm-find-1 (file-name-as-directory "/media/chriad/ext4/dpt-mirror/dpt")))


;; TODO must also search package-directory-list for guix
;; TODO use symbol at point as default search term
(defun chriad/search-elpa ()
  "Search for code in packages. "
  (interactive)
    (let ((root-helm-ag-base-command "rg --smart-case --no-heading --color=never -t el"))
      ;; (spacemacs/helm-files-do-rg (concat configuration-layer--elpa-root-directory emacs-version "/" configuration-layer-elpa-subdirectory)
      (spacemacs/helm-files-do-rg package-user-dir)))


             ;;   "Search in current directory with `rg'."
;;   (interactive)

;; note to self: order alphabetically
(spacemacs/declare-prefix "o" "private keymap")
(spacemacs/set-leader-keys "oa" 'projectile-add-known-project)


(spacemacs/declare-prefix "ob" "bookmarks")
(spacemacs/set-leader-keys "obt" 'bmkp-jump-to-type-other-window)
(spacemacs/set-leader-keys "obs" 'bmkp-bookmark-file-switch-jump)
(spacemacs/set-leader-keys "obi" 'bmkp-set-info-bookmark-with-node-name)

(spacemacs/declare-prefix "ow" "which key")
(spacemacs/set-leader-keys "owf" 'which-key-show-full-major-mode)
(spacemacs/set-leader-keys "owj" 'which-key-show-major-mode)
(spacemacs/set-leader-keys "owi" 'which-key-show-minor-mode-keymap)

;;; stuff that fits nowhere else?
(spacemacs/declare-prefix "ox" "sometimes useful")
(spacemacs/set-leader-keys "oxp" 'spacemacs/paradox-list-packages)
(spacemacs/set-leader-keys "oxe" 'epkg-list-packages)

(spacemacs/declare-prefix "od" "describe")
(spacemacs/set-leader-keys "odb" 'describe-bindings)
(spacemacs/set-leader-keys "odm" 'describe-minor-mode-from-indicator)

(spacemacs/declare-prefix "oc" "customize")
(spacemacs/set-leader-keys "ocg" 'customize-group)
(spacemacs/set-leader-keys "ocv" 'customize-variable)
(spacemacs/set-leader-keys "ocs" 'customize-set-value) ;; set 1
(spacemacs/set-leader-keys "oco" 'customize-option-other-window) ;; show 1
(spacemacs/set-leader-keys "ocb" 'customize-browse) ;; show n
(spacemacs/set-leader-keys "oca" 'customize-apropos) ;; show n

(spacemacs/declare-prefix "oo" "org")
(spacemacs/set-leader-keys "ool" 'ace-link-org)
(spacemacs/set-leader-keys "oor" 'org-ref-cite-insert-helm)
(spacemacs/set-leader-keys "oop" 'org-previous-link)
(spacemacs/set-leader-keys "oon" 'org-next-link)
(spacemacs/declare-prefix "ooC" "org clocks")
(spacemacs/set-leader-keys "ooCi" 'org-mru-clock-in)
(spacemacs/set-leader-keys "ooCr" 'org-mru-clock-select-recent-task)

(spacemacs/declare-prefix "om" "menu")
(spacemacs/set-leader-keys "omm" 'minions-minor-modes-menu)

(spacemacs/declare-prefix "os" "search")
(spacemacs/set-leader-keys "osq" 'chriad/search-dpt)
(spacemacs/set-leader-keys "ose" 'chriad/search-elpa)

(spacemacs/set-leader-keys "ot" 'terminal-here-launch)

(spacemacs/declare-prefix "oh" "helm")
(spacemacs/set-leader-keys "ohd" 'helm-disable-minor-mode)
(spacemacs/set-leader-keys "ohe" 'helm-enable-minor-mode)
(spacemacs/set-leader-keys "ohf" 'helm-firefox-bookmarks)
(spacemacs/set-leader-keys "ohc" 'helm-lisp-completion-at-point)
(spacemacs/set-leader-keys "oho" 'helm-org-in-buffer-headings)
(spacemacs/set-leader-keys "oht" 'helm-org-capture-templates)
(spacemacs/declare-prefix "ohy" "helm-yas")
(spacemacs/set-leader-keys "ohyy" 'spacemacs/helm-yas)
(spacemacs/set-leader-keys "ohyr" 'helm-yas-create-snippet-on-region)


(spacemacs/declare-prefix "ohi" "helm info")
(spacemacs/set-leader-keys "ohii" 'helm-info)
(spacemacs/set-leader-keys "ohiu" 'helm-info-use-package)
(spacemacs/declare-prefix  "ohie" "helm-info-{lisp related}")
(spacemacs/set-leader-keys "ohiei" 'helm-info-eintr)
(spacemacs/set-leader-keys "ohiem" 'helm-info-emacs)
(spacemacs/set-leader-keys "ohiel" 'helm-info-elisp)
(spacemacs/set-leader-keys "ohiec" 'helm-info-cl)

;; games
(spacemacs/declare-prefix "op" "play")
(spacemacs/declare-prefix "opa" "achievements")
(spacemacs/set-leader-keys "opal" 'achievements-list-achievements)


(spacemacs/set-leader-keys "opf" 'fortune-from-region)
;; (spacemacs/set-leader-keys "opc" 'chronometer)
(spacemacs/set-leader-keys "opc" 'world-clock)
(spacemacs/set-leader-keys "opw" 'spacemacs/count-words-analysis)
;; (spacemacs/set-leader-keys "opa" 'academic-phrases)

;; (spacemacs/set-leader-keys "ot" 'tab-bar-new-tab)

;; (spacemacs/declare-prefix "or" "roam")
;; (spacemacs/set-leader-keys "orn" 'my/navigate-note)
;; (spacemacs/set-leader-keys "orh" 'org-roam-create-note-from-headline)

;; ----------------

;; same as RET; mouse-save-then-kill is dangerous
;; (define-key dired-mode-map [mouse-3] 'dired-mouse-find-file) ; right click opens inplace

;; (define-key spacemacs-pdf-view-mode-map (kbd "s a") 'pdf-view-auto-slice-minor-mode)
;; (define-key pdf-view-mode-map (kbd "<tab>") 'other-window)

;; nonstandard keys

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


(spacemacs/declare-prefix "on" "navigate")
(spacemacs/set-leader-keys "onf" 'select-frame-by-name)
(spacemacs/set-leader-keys "ons" 'sway-focus-container)
(spacemacs/set-leader-keys "onb" 'spacemacs/switch-to-buffer-other-frame)


(spacemacs/declare-prefix "of" "files")
(spacemacs/set-leader-keys "off" 'chezmoi-find)
(spacemacs/set-leader-keys "ofa" 'chriad/find-custom-aliases)
;; ofd -> chezmoi prefix
(spacemacs/set-leader-keys "ofe" 'chriad/find-dotfile)
(spacemacs/set-leader-keys "ofc" 'chriad/find-custom-settings)
(spacemacs/set-leader-keys "ofk" 'chriad/find-custom-keymap)
(spacemacs/set-leader-keys "ofB" 'chriad/find-custom-bookmark-file)
(spacemacs/set-leader-keys "ofb" 'chriad/find-bashrc)

;; (spacemacs/set-leader-keys "srh" 'helm-rg)

;; ---------------

;;; eww-mode
(spacemacs/declare-prefix-for-mode 'eww-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'eww-mode "ol" 'ace-link-eww)

;;; emacs-lisp-mode
(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "ot" 'tiny-expand)
(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "moe" "edebug")
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "oei" 'edebug-x-show-instrumented)
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "oee" 'edebug-eval-top-level-form)

;; define-key
(define-key lisp-interaction-mode-map (kbd "C-e") 'pp-eval-last-sexp)
;; open toc also from annots buffer
;; (eval-after-load "pdf-annot"
;;   (define-key pdf-annot-list-mode-map (kbd "o") #'(lambda () (interactive) (pdf-outline pdf-annot-list-document-buffer t)))
;;   )
(defun add-f-to-keyquiz ()
  ;; TODO disambiguate map
  ;; (("helm-command-map" "h h") ("ctl-x-map" "c h h") ("global-map" "C-x c h h"))
  (interactive)
  (add-to-list 'key-quiz--custom-keys-alist (cons (car (cdr (car (helpful--keymaps-containing helpful--sym)))) (symbol-name helpful--sym))))

(evil-define-key 'normal helpful-mode-map (kbd "s") 'add-f-to-keyquiz)
