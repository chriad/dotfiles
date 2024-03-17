;;;; spacemacs private ``o'' keymap

(global-set-key (kbd "C-`") 'spacemacs/shell-pop-ansi-term)
(global-set-key (kbd "C-c r") 'org-roam-capture)
(global-set-key (kbd "s-.") 'org-next-link)
(global-set-key (kbd "s-,") 'org-previous-link)
;; (global-set-key (kbd "<f5>") 'helm-org-in-buffer-headings)
(global-set-key (kbd "s-]") 'tab-next)
(global-set-key (kbd "s-[") 'tab-previous)
;; (global-set-key (kbd "s-c") 'helm-lisp-completion-at-point)
(global-set-key (kbd "s-j") 'bookmark-jump)
;; (global-set-key (kbd "s-s") 'select-frame-by-name)
(global-set-key (kbd "s-b") 'org-roam-switch-to-buffer)
(keymap-global-set "s-y" 'spacemacs/helm-yas)

;; -----------------

;; note to self: order alphabetically
(spacemacs/declare-prefix "o" "private keymap")
(spacemacs/set-leader-keys "oa" 'projectile-add-known-project)
(spacemacs/set-leader-keys "ob" 'describe-bindings)
(spacemacs/declare-prefix "oc" "customize")
(spacemacs/set-leader-keys "ocg" 'customize-group)
(spacemacs/set-leader-keys "ocv" 'customize-variable)
(spacemacs/set-leader-keys "ocb" 'customize-browse)
(spacemacs/declare-prefix "oo" "org")
(spacemacs/set-leader-keys "ool" 'ace-link-org)
(spacemacs/set-leader-keys "oor" 'org-ref-cite-insert-helm)
(spacemacs/declare-prefix "ooC" "org clocks")
(spacemacs/set-leader-keys "ooCi" 'org-mru-clock-in)
(spacemacs/set-leader-keys "ooCr" 'org-mru-clock-select-recent-task)
(spacemacs/declare-prefix "oi" "info")
(spacemacs/set-leader-keys "oii" 'helm-info)
(spacemacs/set-leader-keys "oih" 'helm-info-use-package)
(spacemacs/declare-prefix "om" "menu")
(spacemacs/set-leader-keys "omm" 'minions-minor-modes-menu)
(spacemacs/declare-prefix "os" "search")
(spacemacs/set-leader-keys "ot" 'terminal-here-launch)
(spacemacs/declare-prefix "oh" "helm")
(spacemacs/set-leader-keys "ohd" 'helm-disable-minor-mode)
(spacemacs/set-leader-keys "ohc" 'helm-lisp-completion-at-point)
(spacemacs/set-leader-keys "oho" 'helm-org-in-buffer-headings)

;; (spacemacs/set-leader-keys "ot" 'tab-bar-new-tab)
;; (spacemacs/set-leader-keys "oh" 'eaf-open-pdf-from-history)

;; (spacemacs/declare-prefix "oc" "useful commands")
;; (spacemacs/set-leader-keys "oce" 'epkg-list-packages)

;; (spacemacs/declare-prefix "or" "roam")
;; (spacemacs/set-leader-keys "orn" 'my/navigate-note)
;; (spacemacs/set-leader-keys "orh" 'org-roam-create-note-from-headline)

;; ----------------

;; same as RET; mouse-save-then-kill is dangerous
(define-key dired-mode-map [mouse-3] 'dired-mouse-find-file) ; right click opens inplace

;; (define-key spacemacs-pdf-view-mode-map (kbd "s a") 'pdf-view-auto-slice-minor-mode)
;; (define-key pdf-view-mode-map (kbd "<tab>") 'other-window)

;; (define-key org-noter-doc-mode-map (kbd "<f9>") 'org-noter-sync-current-page-or-chapter)
;; (define-key org-noter-notes-mode-map (kbd "<f9>") 'org-noter-sync-current-note)

;; nonstandard keys

(defun spacemacs/find-custom-alias-file ()
  (interactive)
  (find-file (concat (getenv "BASH_IT") "/aliases/custom.aliases.bash")))

(spacemacs/set-leader-keys "fea" 'spacemacs/find-custom-alias-file)

;; (spacemacs/set-leader-keys "srh" 'helm-rg)

;; ---------------

(spacemacs/declare-prefix-for-mode 'eww-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'eww-mode "ol" 'ace-link-eww)

(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "mo" "custom")
(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "ot" 'tiny-expand)


;; (spacemacs/declare-prefix-for-mode 'org-mode "mo" "custom")
;; (spacemacs/set-leader-keys-for-major-mode 'org-mode "op" 'org-toggle-properties)
;; (spacemacs/set-leader-keys-for-major-mode 'org-mode "os" 'org-hide-src-block-delimiters)
