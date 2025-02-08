;;; use these keybindings in different configurations, i.e. spacemacs, vanilla,
;;; spacemacs-evil
;;; use c-h c (describe-key-briefly) to see the key name

(keymap-global-set "C-x <home>" 'execute-extended-command-for-buffer)
(keymap-global-set "C-x 8 _" '(lambda () (insert-char ?\​))) ;; zero width space for org-mode markup escape
(keymap-global-set "<kp-enter>" 'org-anki-sync-entry)
(keymap-global-set "<kp-delete>" 'org-anki-cloze-dwim)
(keymap-global-set "C-<f8>" 'ignore)
(keymap-global-set "C-<menu>" 'ignore)
(keymap-global-set "s-]" 'ignore)
;; (keymap-global-set "<menu>" 'ignore) ; this is the contex menu key, currently bound to execute-extended-command
(keymap-global-set "C-c l" 'org-store-link)

(keymap-global-set "C-x n s" 'sp-narrow-to-sexp)


;; C-c o : personal keybindings
(keymap-global-set "C-c o d" 'describe-minor-mode-from-indicator)
(keymap-global-set "C-c o m" 'consult-minor-mode-menu)
(keymap-global-set "C-c o l" 'dictionary-lookup-definition)

;; (keymap-global-set "s-:" '(lambda () (global-meow-mode 'toggle)))
(keymap-global-set "s-:" '(lambda () (lispy-mode 1)))

;; for undo only; symmetry with undo-redo C-M-_
;; TODO bind freed keys
;; (keymap-global-set "C-x u" ')
;; (keymap-global-set "C-/" ')

;; keymap-global-lookup
;; list-command-history
