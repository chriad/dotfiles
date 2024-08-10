;;;; spacemacs private ``o'' keymap

(global-set-key (kbd "C-`") 'spacemacs/shell-pop-ansi-term)
;; (global-set-key (kbd "<f5>") 'helm-org-in-buffer-headings)
;; (global-set-key (kbd "s-]") 'tab-next)
;; (global-set-key (kbd "s-[") 'tab-previous)
;; (global-set-key (kbd "s-c") 'helm-lisp-completion-at-point)
;; (global-set-key (kbd "s-j") 'bookmark-jump)
;; (global-set-key (kbd "s-s") 'select-frame-by-name)
;; (keymap-global-set "s-y" 'spacemacs/helm-yas)

;; -----------------

;; note to self: order alphabetically
(spacemacs/declare-prefix "o" "private keymap")
(spacemacs/set-leader-keys "oa" 'projectile-add-known-project)


(spacemacs/declare-prefix "ow" "which key")
(spacemacs/set-leader-keys "owf" 'which-key-show-full-major-mode)
(spacemacs/set-leader-keys "owj" 'which-key-show-major-mode)
(spacemacs/set-leader-keys "owi" 'which-key-show-minor-mode-keymap)

;;; stuff that fits nowhere else?
(spacemacs/declare-prefix "ox" "sometimes useful")
(spacemacs/set-leader-keys "oxb" 'select-frame-by-name)
(spacemacs/set-leader-keys "oxp" 'spacemacs/paradox-list-packages)
(spacemacs/set-leader-keys "oxe" 'epkg-list-packages)
(spacemacs/set-leader-keys "oxt" 'edebug-eval-top-level-form)

(spacemacs/declare-prefix "od" "describe")
(spacemacs/set-leader-keys "odb" 'describe-bindings)
(spacemacs/set-leader-keys "odm" 'describe-minor-mode-from-indicator)

(spacemacs/declare-prefix "oc" "customize")
(spacemacs/set-leader-keys "ocg" 'customize-group)
(spacemacs/set-leader-keys "ocv" 'customize-variable)
(spacemacs/set-leader-keys "ocb" 'customize-browse)

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
(spacemacs/set-leader-keys "ot" 'terminal-here-launch)

(spacemacs/declare-prefix "oh" "helm")
(spacemacs/set-leader-keys "ohd" 'helm-disable-minor-mode)
(spacemacs/set-leader-keys "ohe" 'helm-enable-minor-mode)
(spacemacs/set-leader-keys "ohf" 'helm-firefox-bookmarks)
(spacemacs/set-leader-keys "ohc" 'helm-lisp-completion-at-point)
(spacemacs/set-leader-keys "oho" 'helm-org-in-buffer-headings)
(spacemacs/set-leader-keys "oht" 'helm-org-capture-templates)
(spacemacs/set-leader-keys "ohy" 'spacemacs/helm-yas)
(spacemacs/declare-prefix "ohi" "helm info")
(spacemacs/set-leader-keys "ohii" 'helm-info)
(spacemacs/set-leader-keys "ohiu" 'helm-info-use-package)
(spacemacs/declare-prefix  "ohie" "helm-info-{lisp related}")
(spacemacs/set-leader-keys "ohiei" 'helm-info-eintr)
(spacemacs/set-leader-keys "ohiem" 'helm-info-emacs)
(spacemacs/set-leader-keys "ohiel" 'helm-info-elisp)
(spacemacs/set-leader-keys "ohiec" 'helm-info-cl)

(spacemacs/declare-prefix "op" "play")
;; (spacemacs/set-leader-keys "opd" 'doctor)
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

(defun spacemacs/find-custom-alias-file ()
  (interactive)
  ;; (find-file (concat (getenv "BASH_IT") "/aliases/custom.aliases.bash")
  (chezmoi-find (concat "/home/chriad/.bash_it" "/aliases/custom.aliases.bash")))

(defun spacemacs/find-custom-keymap-file ()
  (interactive)
  (chezmoi-find "/home/chriad/.config/emacs/o-keymap.el"))

(defun spacemacs/find-custom-bookmark-file ()
  (interactive)
  (switch-to-buffer (find-file-noselect "/home/chriad/.config/emacs/bookmarks")))


(defun spacemacs/find-bashrc ()
  (interactive)
  (switch-to-buffer (find-file-noselect "/home/chriad/.bashrc")))


(spacemacs/declare-prefix "of" "files")
(spacemacs/set-leader-keys "ofa" 'spacemacs/find-custom-alias-file)
(spacemacs/set-leader-keys "ofo" 'spacemacs/find-custom-keymap-file)
(spacemacs/set-leader-keys "ofB" 'spacemacs/find-custom-bookmark-file)
(spacemacs/set-leader-keys "ofb" 'spacemacs/find-bashrc)

;; (spacemacs/set-leader-keys "srh" 'helm-rg)

;; ---------------

(spacemacs/declare-prefix-for-mode 'eww-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'eww-mode "ol" 'ace-link-eww)

(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "ot" 'tiny-expand)

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
