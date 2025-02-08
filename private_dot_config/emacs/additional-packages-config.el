;;; shared configuration between starter kits/distributions of additional
;;; packages

(use-package emacs
  :custom help-window-select t          ; select the help window
  )

(use-package highlight-defined
  :defer t
  :hook (emacs-lisp-mode . highlight-defined-mode))

(use-package ascii-table
  :defer t
  :init
  (setq ascii-table-base 10)
  (setq ascii-table-control 'caret))


(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package edebug-inline-result
    :ensure t
    :defer t
    ;; :custom (edebug-inline-result-backend 'posframe)
    :hook (edebug-mode . edebug-inline-result-mode))

(use-package highlight-function-calls
  :hook (emacs-lisp-mode . highlight-function-calls-mode))
