(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(backup-by-copying t)
 '(backup-directory-alist '(("\".\"" . "\"~/.saves\"")))
 '(bibtex-completion-bibliography '("/home/chriad/.config/bibliographies/fixed-layout.bib"))
 '(bibtex-completion-pdf-field "file")
 '(blink-matching-delay 2)
 '(bmkp-last-as-first-bookmark-file nil)
 '(bookmark-default-file "/home/chriad/.config/emacs/bookmarks")
 '(company-backends '(company-capf company-semantic company-files))
 '(create-lockfiles nil)
 '(dap-python-executable "/media/chriad/nebula/anaconda3/bin/python")
 '(dash-docs-docsets-path "/home/chriad/.local/Zeal/Zeal/docsets")
 '(dash-docs-min-length 3)
 '(default-frame-alist
   '((buffer-predicate . spacemacs/useful-buffer-p)
     (font . "-ADBO-Source Code Pro-regular-normal-normal-*-16-*-*-*-m-0-iso10646-1")
     (fullscreen . fullheight)
     (internal-border-width . 0)
     (undecorated . t)
     (vertical-scroll-bars)
     (width text-pixels . 1920)
     (top . 0)
     (left . 0)))
 '(delete-old-versions t)
 '(dired-auto-revert-buffer 'dired-directory-changed-p)
 '(dired-listing-switches "-alh")
 '(dired-recursive-deletes 'always)
 '(eaf-config-location "/media/chriad/nebula/spacemacs-config-files/fork/eaf/")
 '(eaf-find-file-ext-blacklist '("epub"))
 '(eaf-markdown-extension-list '("md" "org"))
 '(eaf-org-override-pdf-links-store t)
 '(eaf-pdf-extension-list '("pdf" "xps" "oxps" "cbz" "fb2" "fbz"))
 '(emacs-lisp-mode-hook
   '(eldoc-mode highlight-defined-mode highlight-function-calls-mode eval-sexp-fu-flash-mode eldoc-mode flycheck-package-setup flycheck-elsa-setup elisp-slime-nav-mode auto-compile-mode overseer-enable-mode edebug-x-mode spacemacs//define-elisp-comment-text-object spacemacs//init-company-emacs-lisp-mode company-mode))
 '(enable-local-variables t)
 '(evil-collection-config
   '((buff-menu :defer t)
     (calc :defer t)
     (comint :defer t)
     (debug :defer t)
     (diff-mode :defer t)
     (dired :defer t)
     (edebug :defer t)
     (eldoc :defer t)
     (help :defer t)
     (image :defer t)
     (indent :defer t)
     (dired :defer t)
     (info :defer t)
     (replace :defer t)
     (outline :defer t)
     (process-menu :defer t)
     (simple :defer t)
     (tab-bar :defer t)
     (tabulated-list :defer t)
     (xref :defer t)))
 '(evil-collection-mode-list
   '((buff-menu "buff-menu")
     forge magit vterm eww dired quickrun))
 '(evil-emacs-state-modes
   '(sly-db-mode ediff-mode backtrace-mode package-menu-mode package-mode paradox-mode debugger-mode 5x5-mode bbdb-mode blackbox-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bs-mode bubbles-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode custom-theme-choose-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode dun-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode ess-help-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode gomoku-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-popup-mode magit-popup-sequence-mode mh-folder-mode monky-mode mpuz-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode notmuch-tree-mode pdf-outline-buffer-mode pdf-view-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode snake-mode solitaire-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-hg-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode))
 '(evil-insert-state-modes
   '(org-capture-mode eaf-edit-mode comint-mode erc-mode eshell-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode term-mode wdired-mode))
 '(evil-move-cursor-back nil)
 '(evil-org-use-additional-insert t)
 '(evil-want-Y-yank-to-eol nil)
 '(fortune-dir "~/.config/fortune")
 '(fortune-file "~/.config/fortune/fortunes")
 '(gist-ask-for-description t)
 '(gist-ask-for-filename t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-mru-bookmark-mode t)
 '(global-semantic-stickyfunc-mode t)
 '(global-visual-line-mode t)
 '(helm-apropos-fuzzy-match t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-candidate-number-limit 700)
 '(helm-completion-style 'emacs)
 '(helm-file-preview-mode nil nil (helm-file-preview))
 '(helm-file-preview-only-when-line-numbers nil)
 '(helm-firefox-default-directory "/home/chriad/snap/firefox/common/.mozilla/firefox/")
 '(helm-lisp-fuzzy-completion t)
 '(helm-move-to-line-cycle-in-source nil)
 '(helm-show-completion-display-function 'helm-display-buffer-popup-frame)
 '(helm-type-bookmark-actions
   '(("Jump to bookmark" . helm-bookmark-jump)
     ("Jump to BM other window" . helm-bookmark-jump-other-window)
     ("Jump to BM other frame" . helm-bookmark-jump-other-frame)
     ("Bookmark edit annotation" . bookmark-edit-annotation)
     ("Bookmark show annotation" . bookmark-show-annotation)
     ("Delete bookmark(s)" . helm-delete-marked-bookmarks)
     ("Edit Bookmark" . helm-bookmark-edit-bookmark)
     ("Describe Bookmark" . bmkp-describe-bookmark)
     ("Rename bookmark" . helm-bookmark-rename)
     ("Relocate bookmark" . bookmark-relocate)))
 '(hl-sexp-background-colors '("white smoke" "white"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(ignored-local-variable-values
   '((magit-todos-exclude-globs "elpa/")
     (org-confirm-babel-evaluate)))
 '(keycast-header-line-mode t)
 '(keycast-mode-line-mode nil)
 '(keyfreq-autosave-mode t)
 '(keyfreq-mode t)
 '(large-file-warning-threshold 100000000)
 '(lispy-completion-method 'helm)
 '(lispy-eval-display-style 'overlay)
 '(lsp-pyright-diagnostic-mode "workspace")
 '(markdown-hide-markup t)
 '(org-M-RET-may-split-line '((default)))
 '(org-blank-before-new-entry '((heading) (plain-list-item)))
 '(org-capture-mode-hook '(spacemacs//org-capture-start evil-insert-state) nil nil "Here the order is important. The evil-insert-state hook must come after.")
 '(org-cite-global-bibliography '("/home/chriad/.config/bibliographies/fixed-layout.bib"))
 '(org-clock-idle-time 10)
 '(org-clock-persist t)
 '(org-confirm-babel-evaluate nil)
 '(org-download-display-inline-images 'posframe)
 '(org-download-image-attr-list nil)
 '(org-download-image-org-width 700)
 '(org-download-screenshot-method "gnome-screenshot -a -f %s")
 '(org-ellipsis " ↴")
 '(org-export-headline-levels 6)
 '(org-fc-after-flip-hook '(org-hide-src-block-delimiters))
 '(org-fc-after-setup-hook nil)
 '(org-fc-directories '("~/agenda"))
 '(org-fc-review-history-file
   "/media/chriad/nebula/spacemacs-config-files/fork/org-fc-reviews.tsv")
 '(org-file-apps
   '(("\\.pdf\\'" . eaf-org-open-file)
     (auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.mkv\\'" . "eaf-org-open-file")
     ("\\.mp4\\'" . eaf-open)))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-insert-heading-respect-content t)
 '(org-journal-date-format "%d-%m-%Y")
 '(org-journal-dir "~/org-journal-fork")
 '(org-journal-enable-agenda-integration t)
 '(org-journal-file-format "%Y-%m-%d.org")
 '(org-journal-time-prefix "- ")
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail org-tempo ol-w3m ol-git-link ol-man))
 '(org-pdftools-free-pointer-color "#FF8C00")
 '(org-pdftools-free-pointer-icon "Insert")
 '(org-pdftools-free-pointer-opacity 0.4)
 '(org-pdftools-get-desc-function 'my/org-pdftools-get-desc-default)
 '(org-pdftools-markup-pointer-color "#CAE1FF")
 '(org-pdftools-markup-pointer-function 'pdf-annot-add-highlight-markup-annotation)
 '(org-pdftools-markup-pointer-opacity 0.5)
 '(org-pdftools-use-freepointer-annot t)
 '(org-protocol-default-template-key nil)
 '(org-roam-completion-everywhere t)
 '(org-roam-completion-system 'helm)
 '(org-roam-directory "/home/chriad/roam/")
 '(org-roam-file-completion-tag-position 'append)
 '(org-roam-find-file-hook
   '(org-roam-buffer--setup-redisplay-h org-roam--register-completion-functions-h org-roam--replace-roam-links-on-save-h org-roam-db-autosync--setup-update-on-save-h
                                        (lambda nil
                                          (call-interactively #'org-hide-properties))))
 '(org-roam-index-file "~/roam/index.org")
 '(org-roam-node-display-template "${title:*} ${tags:15}")
 '(org-startup-with-inline-images nil)
 '(org-superstar-headline-bullets-list '(8227 8227 8227 10047))
 '(org-superstar-remove-leading-stars t)
 '(package-selected-packages
   '(org-starless gist helm-firefox camcorder names toml-mode ron-mode racer rust-mode flycheck-rust cargo password-store-otp helm-pass password-store helm-bibtexkey helm-bibtex bibtex-completion biblio parsebib biblio-core symex helm-atoms run-command niceify-info elx helm-recoll comment-or-uncomment-sexp clhs ascii-table helm-emmet dyncloze dired-git-info nix-mode helm-nixos-options company-nixos-options nixos-options lsp-focus tiny tern npm-mode nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags counsel-gtags no-littering howdoyou poker org-variable-pitch org-roam evil-lispy org-mru-clock esup monkeytype speed-type typit org-page git mustache lisp-extra-font-lock highlight-indent-guides elisp-def sr-speedbar ein polymode anaphora websocket lispy achievements org-fc doct justify-kp dash-functional buttons keymap-utils dired-open dired-hacks-utils olivetti nov on-screen ob-sml sml-mode mic-paren helm-posframe stickyfunc-enhance srefactor highlight-defined sicp pdfgrep edebug-x helm-file-preview csv-mode org-roam-server ox-gfm scrollkeeper beacon lsp-ui lsp-treemacs lsp-origami origami helm-lsp lsp-mode flycheck-pos-tip pos-tip web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode simple-httpd helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data add-node-modules-path evil-motion-trainer edit-indirect helpful elisp-refs mmm-mode markdown-toc gh-md yaml-mode xterm-color vterm terminal-here shell-pop multi-term eshell-z eshell-prompt-extras esh-help pdf-tools tablist keycast command-log-mode orgit org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-journal org-download org-cliplink org-brain htmlize helm-org-rifle gnuplot evil-org wakatime-mode yasnippet-snippets unfill treemacs-magit smeargle mwim magit-svn magit-section magit-gitflow magit-popup helm-gitignore helm-git-grep helm-company helm-c-yasnippet gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy forge markdown-mode magit ghub closql emacsql-sqlite emacsql treepy git-commit with-editor transient company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs cfrs ht pfuture posframe toc-org symon symbol-overlay string-inflection spaceline-all-the-icons memoize all-the-icons spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless shut-up move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection annalist evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils pkg-info epl elisp-slime-nav editorconfig dumb-jump s dired-quick-sort devdocs define-word dash column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el hydra lv hybrid-mode font-lock+ evil goto-chg dotenv-mode diminish bind-map bind-key async))
 '(paradox-automatically-star nil)
 '(paradox-github-token t)
 '(paren-sexp-mode t)
 '(pdf-annot-activate-created-annotations nil)
 '(pdf-annot-list-follow-minor-mode-hook nil)
 '(pdf-annot-list-format '((page . 3) (type . 10) (label . 24) (date . 24)))
 '(pdf-annot-minor-mode-map-prefix [3 1])
 '(pdf-outline-display-labels t)
 '(pdf-view-display-size 'fit-height)
 '(pdf-view-midnight-colors '("white" . "black"))
 '(pdfgrep-options " -H -n -r ")
 '(persp-save-dir "/media/chriad/nebula/spacemacs-fork/.cache/layouts/")
 '(persp-use-workgroups t)
 '(projectile-known-projects-file
   "/media/chriad/nebula/spacemacs-fork/.cache/projectile-bookmarks.eld")
 '(projectile-project-search-path '("/home/chriad" "/home/chriad/emacs-projects"))
 '(racket-browse-url-function 'browse-url-firefox)
 '(racket-documentation-search-location ''local)
 '(reb-re-syntax 'rx)
 '(safe-local-variable-values
   '((eval spacemacs/toggle-line-numbers-on)
     (eval org-hide-src-block-delimiters)
     (eval
      (org-hide-properties))
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-step 1)
 '(symex-highlight-p t)
 '(treemacs-icons-dired-mode t)
 '(undo-tree-auto-save-history nil)
 '(version-control t)
 '(wakatime-cli-path "wakatime")
 '(wakatime-python-bin "python" t)
 '(warning-suppress-log-types '(((tar link)) (comp)))
 '(warning-suppress-types '((comp)))
 '(yas-snippet-dirs
   '("/media/chriad/nebula/spacemacs-fork/private/snippets/" "/media/chriad/nebula/spacemacs-fork/layers/+completion/auto-completion/local/snippets" yasnippet-snippets-dir yasnippet-classic-snippets-dir)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(newsticker-treeview-old-face ((nil (:inherit 'newsticker-treeview-face :foreground "#7c7c75"))))
 '(org-default ((t (:inherit default :weight semi-light))))
 '(org-document-title ((t (:inherit bold :foreground "#6c3163" :underline nil :height 1.4))))
 '(org-ellipsis ((t (:foreground "#4f97d7" :weight ultra-light :height 0.8))))
 '(org-level-1 ((t (:inherit bold :extend nil :weight normal :height 1.01 :width extra-condensed))))
 '(org-level-2 ((t (:inherit bold :extend nil :foreground "green" :weight normal :height 1.01))))
 '(org-level-3 ((t (:foreground "yellow" :weight semi-light :height 1.01))))
 '(org-meta-line ((t (:foreground "#da8b55" :slant normal :height 0.8))))
 '(org-todo ((t (:inherit bold :foreground "#dc752f" :weight semi-light)))))
