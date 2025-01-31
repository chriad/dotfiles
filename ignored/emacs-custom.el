(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-mode-hook
   '(#[0 "\302\10\303\"\204\15\0\304\10\303\305#\210\306\11\307\310\311$\210\304\11\312\313#\207"
         [Info-mode-map Info-mode-menu lookup-key "j" define-key bmkp-info-jump define-key-after
                        [bmkp-info-jump]
                        (menu-item "Jump to an Info Bookmark" bmkp-info-jump :help "Jump to a bookmarked Info node")
                        Go\ to\ Node...
                        [bookmarks-here]
                        (menu-item "Bookmarks Here" bmkp-here-menu :enable
                                   (and bmkp-add-bookmarks-here-menu-flag
                                        (bmkp-exists-this-file/buffer-bookmarks-p)))]
         5]
     turn-on-font-lock
     (lambda nil
       (turn-off-evil-mode))))
 '(achievements-mode t)
 '(backup-by-copying t)
 '(backup-directory-alist '(("\".\"" . "\"~/.saves\"")))
 '(bibtex-completion-pdf-field "file")
 '(blink-matching-delay 2)
 '(bmkp-bmenu-commands-file
   "/home/chriad/.local/share/chezmoi/ignored/emacs/.emacs-bmk-bmenu-commands.el")
 '(bmkp-bmenu-image-bookmark-icon-file
   "~/.local/share/chezmoi/ignored/emacs/bookmark-plus/BookmarkPlusImageFileDefaultIcon")
 '(bmkp-eww-generate-buffer-flag nil)
 '(bmkp-last-as-first-bookmark-file nil)
 '(bmkp-properties-to-keep '(tags annotation visits))
 '(bmkp-propertize-bookmark-names-flag t)
 '(bookmark-bmenu-file-column 50)
 '(bookmark-default-file "/home/chriad/.local/share/chezmoi/ignored/emacs/bookmarks")
 '(bookmark-inhibit-context-functions
   '(auth-source-pass-file-name-p auth-source-file-name-p epa-file-name-p))
 '(bookmark-save-flag 1)
 '(bookmark-use-annotations nil)
 '(calibredb-library-alist
   '(("/media/chriad/ssd-45/reflowable")
     ("/media/chriad/ssd-45/fixed-layout")) t)
 '(command-log-mode-is-global t)
 '(command-log-mode-key-binding-open-log [67 45 99 32 111])
 '(command-log-mode-window-font-size 1)
 '(command-log-mode-window-size 50)
 '(company-backends '(company-capf company-semantic company-files))
 '(completions-detailed t)
 '(create-lockfiles nil)
 '(dash-docs-docsets-path "/home/chriad/.local/Zeal/Zeal/docsets")
 '(dash-docs-min-length 3)
 '(dash-fontify-mode-lighter " Dash")
 '(debugger-stack-frame-as-list t)
 '(default-frame-alist
   '((font . "-ADBO-Source Code Pro-regular-normal-normal-*-16-*-*-*-m-0-iso10646-1")
     (buffer-predicate . spacemacs/useful-buffer-p)
     (font . "-ADBO-Source Code Pro-regular-normal-normal-*-16-*-*-*-m-0-iso10646-1")
     (fullscreen . fullheight)
     (internal-border-width . 0)
     (undecorated . t)
     (width text-pixels . 1920)
     (top . 0)
     (left . 0)))
 '(delete-old-versions t)
 '(desktop-auto-save-timeout 20)
 '(desktop-save-mode nil nil nil "TODO: running as daemon -> problem restoring; use activities.el")
 '(dictionary-server nil nil nil "Automatic: First try localhost, then dict.org after confirmation")
 '(dired-auto-revert-buffer 'dired-directory-changed-p)
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh")
 '(dired-mode-hook
   '(pdf-occur-dired-minor-mode
     (closure
         (t)
         nil
       (dired-hide-details-mode))
     #[0 "\302\10\303\"\211\203\16\0\211\304=\203\24\0\305\10\303\306#\210\302\10\307\"\262\1\211\203$\0\211\304=\203*\0\305\10\307\310#\210\210\10\311\312\313\314\301!\203_\0\11\262\4\2AA\262\3\1AA\262\2\211AA\262\1\305\4\315\316\4\"\317#\210\305\4\315\316\5\"\320#\210\305\4\321\322#\207\305\4\315\316\6\6\"\323#\210\305\4\315\316\4\"\324#\210\305\4\315\316\5\"\325#\210\305\4\326\327#\207"
         [dired-mode-map diredp-bookmark-menu lookup-key "J" undefined define-key bmkp-dired-jump "\12" bmkp-dired-this-dir-jump
                         (menu-bar subdir separator-bmkp)
                         (menu-bar subdir bmkp-dired-jump)
                         (menu-bar subdir bmkp-dired-this-dir-jump)
                         boundp apply vector
                         (menu-item "Jump to a Dired Bookmark For This Dir" bmkp-dired-this-dir-jump :help "Jump to a bookmarked Dired buffer for this directory")
                         (menu-item "Jump to a Dired Bookmark" bmkp-dired-jump :help "Jump to a bookmarked Dired buffer")
                         [bookmarks-here]
                         (menu-item "Here" bmkp-here-menu :enable
                                    (and bmkp-add-bookmarks-here-menu-flag
                                         (bmkp-exists-this-file/buffer-bookmarks-p)))
                         ("--")
                         (menu-item "Jump to a Dired Bookmark For This Dir" bmkp-dired-this-dir-jump :help "Jump to a bookmarked Dired buffer for this directory")
                         (menu-item "Jump to a Dired Bookmark" bmkp-dired-jump :help "Jump to a bookmarked Dired buffer")
                         [bookmarks-here]
                         (menu-item "Here" bmkp-here-menu :enable
                                    (and bmkp-add-bookmarks-here-menu-flag
                                         (bmkp-exists-this-file/buffer-bookmarks-p)))]
         9]
     #[0 "\301\300!\210\302\211\20\207"
         [bookmark-make-record-function make-local-variable bmkp-make-dired-record]
         2]
     dired-extra-startup spacemacs//transient-hook-\(lambda\ nil\ \(let\ \(\(dired-quick-sort-suppress-setup-warning\ \'message\)\)\ \(dired-quick-sort-setup\)\)\)))
 '(dired-recursive-deletes 'always)
 '(doc-view-mupdf-use-svg t)
 '(doc-view-svg-background nil)
 '(doc-view-svg-foreground nil)
 '(eaf-config-location "/media/chriad/nebula/spacemacs-config-files/fork/eaf/")
 '(eaf-find-file-ext-blacklist '("epub"))
 '(eaf-markdown-extension-list '("md" "org"))
 '(eaf-org-override-pdf-links-store t)
 '(eaf-pdf-extension-list '("pdf" "xps" "oxps" "cbz" "fb2" "fbz"))
 '(edebug-inline-result-backend 'popup)
 '(edebug-print-length 100)
 '(emacs-lisp-mode-hook
   '((lambda nil
       (setq-local bookmark-make-record-function #'lib-bookmark-make-record))
     highlight-defined-mode highlight-function-calls-mode eval-sexp-fu-flash-mode flycheck-package-setup flycheck-elsa-setup elisp-slime-nav-mode auto-compile-mode overseer-enable-mode edebug-x-mode elisp-def-mode spacemacs//define-elisp-comment-text-object spacemacs//init-company-emacs-lisp-mode company-mode))
 '(enable-local-variables t)
 '(enable-recursive-minibuffers t)
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(epa-file-inhibit-auto-save nil)
 '(epa-file-select-keys 'silent)
 '(epg-pinentry-mode 'loopback)
 '(evil-buffer-regexps '(("^ \\*load\\*") ("\\*LV\\*") ("\\\"\\*info\\*\\\"")))
 '(evil-emacs-state-modes
   '(dired-mode sly-db-mode backtrace-mode package-mode paradox-mode achievements-list-mode 5x5-mode bbdb-mode blackbox-mode bookmark-edit-annotation-mode browse-kill-ring-mode bs-mode bubbles-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode custom-theme-choose-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode dun-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode ess-help-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode gomoku-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-popup-mode magit-popup-sequence-mode mh-folder-mode monky-mode mpuz-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode notmuch-tree-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode snake-mode solitaire-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-hg-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode Info-mode edebug-x-instrumented-function-list-mode key-quiz-mode bmkp-bmenu-list-mode magit-repolist-mode Custom-mode) nil nil "Does this work with spacemacs?")
 '(evil-escape-mode nil)
 '(evil-insert-state-modes
   '(eaf-edit-mode comint-mode erc-mode eshell-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode term-mode wdired-mode))
 '(evil-move-cursor-back nil)
 '(evil-org-use-additional-insert t)
 '(evil-undo-system 'undo-fu)
 '(evil-want-Y-yank-to-eol nil)
 '(font-lock-maximum-decoration '((t . t) (ps-mode . t)) nil nil "Redundant, but remember this.")
 '(fortune-dir "/home/chriad/.local/share/chezmoi/ignored/emacs/fortune")
 '(fortune-file
   "/home/chriad/.local/share/chezmoi/ignored/emacs/fortune/fortunes")
 '(gist-ask-for-description t)
 '(gist-ask-for-filename t)
 '(global-command-log-mode t)
 '(global-dash-fontify-mode t)
 '(global-display-fill-column-indicator-mode t)
 '(global-flycheck-mode t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-scheduler-mode t)
 '(global-semantic-mru-bookmark-mode t)
 '(global-semantic-stickyfunc-mode t)
 '(global-semanticdb-minor-mode t)
 '(global-tree-sitter-mode t)
 '(global-treesit-auto-mode t)
 '(global-visual-line-mode t)
 '(guix-emacs-verbose t)
 '(helm-M-x-always-save-history nil)
 '(helm-M-x-show-short-doc t)
 '(helm-apropos-fuzzy-match t)
 '(helm-bookmark-default-filtered-sources
   '(helm-source-bookmark-org helm-source-bookmark-files&dirs helm-source-bookmark-helm-find-files helm-source-bookmark-info helm-source-bookmark-gnus helm-source-bookmark-mu4e helm-source-bookmark-man helm-source-bookmark-images helm-source-bookmark-w3m helm-source-bookmark-uncategorized helm-source-bookmark-set))
 '(helm-bookmark-show-location t t)
 '(helm-bookmark-use-icon t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-candidate-number-limit 700)
 '(helm-completing-read-handlers-alist
   '((find-tag . helm-completing-read-default-find-tag)
     (ggtags-find-tag-dwim . helm-completing-read-default-find-tag)
     (tmm-menubar)
     (find-file)
     (execute-extended-command)
     (dired-do-rename . helm-read-file-name-handler-1)
     (dired-do-copy . helm-read-file-name-handler-1)
     (dired-do-symlink . helm-read-file-name-handler-1)
     (dired-do-relsymlink . helm-read-file-name-handler-1)
     (dired-do-hardlink . helm-read-file-name-handler-1)
     (read-multiple-choice--long-answers)
     (dired-do-touch)
     (basic-save-buffer . helm-read-file-name-handler-1)
     (write-file default helm-read-file-name-handler-1)
     (write-region default helm-read-file-name-handler-1)
     (all-the-icons-insert . helm-mode-all-the-icons-handler)
     (bmkp-autofile-set ignore ido-read-file-name)) nil nil "TODO: bmkp-autofile-set only works with helm-mode disabeled")
 '(helm-completion-style 'helm-fuzzy t)
 '(helm-descbinds-mode t)
 '(helm-descbinds-window-style 'split)
 '(helm-file-preview-mode nil nil (helm-file-preview) "This interferes with c-x 8")
 '(helm-find-files-bookmark-prefix nil nil nil "Cannot revert customization for this item?")
 '(helm-firefox-default-directory "/home/chriad/snap/firefox/common/.mozilla/firefox/")
 '(helm-lisp-fuzzy-completion t)
 '(helm-move-to-line-cycle-in-source nil)
 '(helm-semantic-fuzzy-match t)
 '(helm-show-action-window-other-window nil nil nil "Spacemacs doesn't like changes to this")
 '(helm-spacemacs-help-mode t)
 '(helm-split-window-inside-p t)
 '(helm-type-bookmark-actions
   '(("Jump to bookmark" . helm-bookmark-jump)
     ("Jump to BM other window" . helm-bookmark-jump-other-window)
     ("Jump to BM other frame" . helm-bookmark-jump-other-frame)
     ("!! destructive !! Bookmark edit annotation" . bookmark-edit-annotation)
     ("Bookmark show annotation" . bookmark-show-annotation)
     ("!! destructive !! Delete bookmark(s)" . helm-delete-marked-bookmarks)
     ("!! destructive !! Edit Bookmark" . helm-bookmark-edit-bookmark)
     ("bookmark+: Describe Bookmark" . bmkp-describe-bookmark)
     ("!! destructive !! Rename bookmark" . helm-bookmark-rename)
     ("Relocate bookmark" . bookmark-relocate)
     ("bookmark+: Find file" . bmkp-find-file)
     ("bookmark+: Add tag" . ignore)
     ("bookmark+: Edit bookmark " . bmkp-edit-bookmark-record)))
 '(helm-yas-display-key-on-candidate t t)
 '(helm-yas-space-match-any-greedy t t)
 '(history-delete-duplicates t)
 '(history-length 1000)
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
 '(ielm-noisy nil)
 '(ignored-local-variable-values
   '((magit-todos-exclude-globs "elpa/")
     (org-confirm-babel-evaluate)))
 '(image-dired-dired-append-when-browsing t)
 '(image-dired-external-viewer "eog")
 '(info-manual+node-buffer-name-mode t)
 '(jka-compr-compression-info-list
   '(["\\.Z\\'" "compressing" "compress"
      ("-c")
      "uncompressing" "gzip"
      ("-c" "-q" "-d")
      nil t "\37\235" zlib-decompress-region]
     ["\\.bz2\\'" "bzip2ing" "bzip2" nil "bunzip2ing" "bzip2"
      ("-d")
      nil t "BZh" nil]
     ["\\.tbz2?\\'" "bzip2ing" "bzip2" nil "bunzip2ing" "bzip2"
      ("-d")
      nil nil "BZh" nil]
     ["\\.\\(?:tgz\\|svgz\\|sifz\\)\\'" "compressing" "gzip"
      ("-c" "-q")
      "uncompressing" "gzip"
      ("-c" "-q" "-d")
      t nil "\37\213" zlib-decompress-region]
     ["\\.g?z\\'" "compressing" "gzip"
      ("-c" "-q")
      "uncompressing" "gzip"
      ("-c" "-q" "-d")
      t t "\37\213" zlib-decompress-region]
     ["\\.lz\\'" "Lzip compressing" "lzip"
      ("-c" "-q")
      "Lzip uncompressing" "lzip"
      ("-c" "-q" "-d")
      t t "LZIP" nil]
     ["\\.lzma\\'" "LZMA compressing" "lzma"
      ("-c" "-q" "-z")
      "LZMA uncompressing" "lzma"
      ("-c" "-q" "-d")
      t t "" nil]
     ["\\.xz\\'" "XZ compressing" "xz"
      ("-c" "-q")
      "XZ uncompressing" "xz"
      ("-c" "-q" "-d")
      t t "\3757zXZ\0" nil]
     ["\\.txz\\'" "XZ compressing" "xz"
      ("-c" "-q")
      "XZ uncompressing" "xz"
      ("-c" "-q" "-d")
      t nil "\3757zXZ\0" nil]
     ["\\.dz\\'" nil nil nil "uncompressing" "gzip"
      ("-c" "-q" "-d")
      nil t "\37\213" nil]
     ["\\.zst\\'" "zstd compressing" "zstd"
      ("-c" "-q")
      "zstd uncompressing" "zstd"
      ("-c" "-q" "-d")
      t t "(\265/\375" nil]
     ["\\.tzst\\'" "zstd compressing" "zstd"
      ("-c" "-q")
      "zstd uncompressing" "zstd"
      ("-c" "-q" "-d")
      t nil "(\265/\375" nil]))
 '(keyboard-coding-system 'utf-8-unix)
 '(keycast-header-line-mode t)
 '(keycast-mode-line-mode nil)
 '(keyfreq-autosave-mode t)
 '(keyfreq-mode t)
 '(large-file-warning-threshold 100000000)
 '(lispy-completion-method 'helm)
 '(lispy-eval-display-style 'overlay)
 '(load-dir-recursive t)
 '(lsp-pyright-diagnostic-mode "workspace")
 '(magit-define-global-key-bindings 'recommended)
 '(magit-repository-directories '(("/home/chriad/gh-dotfiles" . 2) ("/home/chriad/gh" . 4)))
 '(markdown-hide-markup t)
 '(max-lisp-eval-depth 3200 nil nil "helpful--keymap-keys recursion")
 '(menu-bar-mode nil)
 '(minibuffer-electric-default-mode t)
 '(nov-variable-pitch nil)
 '(org-M-RET-may-split-line '((default)))
 '(org-agenda-files '("/home/chriad/roam/"))
 '(org-anki-default-deck "org-anki")
 '(org-anki-default-note-type "Cloze")
 '(org-blank-before-new-entry '((heading) (plain-list-item)))
 '(org-capture-mode-hook '(spacemacs//org-capture-start) nil nil "TODO: org-fc hooks")
 '(org-cite-global-bibliography '("/home/chriad/.config/bibliographies/fixed-layout.bib"))
 '(org-clock-idle-time 10)
 '(org-clock-persist t)
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file "~/roam/Inbox.org")
 '(org-download-display-inline-images 'posframe)
 '(org-download-image-attr-list nil)
 '(org-download-image-org-width 700)
 '(org-download-screenshot-method "gnome-screenshot -a -f %s")
 '(org-export-headline-levels 6)
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-insert-heading-respect-content t)
 '(org-journal-date-format "%d-%m-%Y")
 '(org-journal-dir "~/org-journal-fork")
 '(org-journal-enable-agenda-integration t)
 '(org-journal-file-format "%Y-%m-%d.org")
 '(org-journal-time-prefix "- ")
 '(org-mode-hook
   '(org-tempo-setup org-ref-org-menu
                     (closure
                         (t)
                         nil
                       (setq evil-surround-pairs-alist
                             (cons
                              '(123 "{{" . "}}")
                              evil-surround-pairs-alist)))
                     #[0 "\300\301\302\303\304$\207"
                         [add-hook change-major-mode-hook org-fold-show-all append local]
                         5]
                     #[0 "\300\301\302\303\304$\207"
                         [add-hook change-major-mode-hook org-babel-show-result-all append local]
                         5]
                     org-babel-result-hide-spec org-babel-hide-all-hashes
                     #[0 "\301\211\20\207"
                         [imenu-create-index-function org-imenu-get-tree]
                         2]
                     (closure
                         (t)
                         nil
                       (setq prettify-symbols-alist
                             '(("lambda" . 955)
                               ("defun" . 10768)
                               ("->" . 10230)
                               (":=" . 8788)
                               ("=>" . 10233)
                               ("#t" . 10201)
                               ("!=" . 8800)
                               ("#f" . 10200))))
                     org-indent-mode org-pdftools-setup-link spacemacs/org-setup-evil-surround spacemacs/load-yasnippet toc-org-enable org-superstar-mode
                     (lambda nil
                       (require 'org-ref))
                     org-download-enable dotspacemacs//prettify-spacemacs-docs spacemacs//evil-org-mode org-eldoc-load spacemacs//init-company-org-mode company-mode))
 '(org-modules
   '(ol-bbdb ol-bibtex org-ctags ol-docview ol-doi ol-eww org-habit ol-info org-protocol org-tempo ol-w3m ol-bookmark ol-git-link ol-man))
 '(org-pdftools-free-pointer-color "#FF8C00")
 '(org-pdftools-free-pointer-icon "Insert")
 '(org-pdftools-free-pointer-opacity 0.4)
 '(org-pdftools-markup-pointer-color "#CAE1FF")
 '(org-pdftools-markup-pointer-function 'pdf-annot-add-highlight-markup-annotation)
 '(org-pdftools-markup-pointer-opacity 0.5)
 '(org-pdftools-use-freepointer-annot t)
 '(org-protocol-default-template-key nil)
 '(org-return-follows-link t)
 '(org-roam-completion-everywhere t)
 '(org-roam-completion-system 'helm)
 '(org-roam-db-autosync-mode t)
 '(org-roam-db-extra-links-elements '(keyword node-property))
 '(org-roam-directory "/home/chriad/roam/")
 '(org-roam-extract-new-file-path "${slug}.org")
 '(org-roam-file-completion-tag-position 'append)
 '(org-roam-file-extensions '("org" "gpg"))
 '(org-roam-find-file-hook
   '(org-roam-buffer--setup-redisplay-h org-roam--register-completion-functions-h org-roam--replace-roam-links-on-save-h org-roam-db-autosync--setup-update-on-save-h
                                        (lambda nil
                                          (call-interactively #'org-hide-properties))) nil nil "(lambda nil (space-doc-mode))")
 '(org-roam-index-file "~/roam/index.org")
 '(org-roam-node-display-template "${title:*} ${tags:15}")
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/setup/theme-readtheorg\\.setup\\'"))
 '(org-src-lang-modes
   '(("C" . c)
     ("C++" . c++)
     ("asymptote" . asy)
     ("bash" . sh)
     ("beamer" . latex)
     ("calc" . fundamental)
     ("cpp" . c++)
     ("ditaa" . artist)
     ("desktop" . conf-desktop)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql)
     ("toml" . conf-toml)
     ("tldr" . tldr)
     ("helpful" . helpful)))
 '(org-startup-folded 'show2levels)
 '(org-startup-with-inline-images nil)
 '(org-superstar-headline-bullets-list '(8227 8227 8227 10047))
 '(org-superstar-remove-leading-stars t)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(copilot csv parse-csv activities persist unidecode nhexl-mode counsel-jq ghub consult yaml closql flycheck helm-core js2-mode multiple-cursors lsp-mode magit-section nerd-icons parsebib emacsql with-editor undo-fu undo-fu-session vertico window-purpose combobulate ts-fold fringe-helper tree-sitter-langs org-roam org-dashboard graphviz-dot-mode anki-connect helm-ag bookmark+ org forge magit transient geiser merlin pp+ disable-mouse site-lisp snow misc-fns help-fns+ help-macro+ font-lock+ fzf yatemplate dashboard w3m jeison try ansi shut-up commander qpdf company posframe clang-format helm markdown-mode slime spray load-dir nov delight org-roam-ui quelpa-use-package quelpa fit-frame toml-mode helm-system-packages fn anki-editor-view anki-mode anki-editor keymap-utils org-fc zeal-at-point yasnippet-snippets yasnippet-classic-snippets yapfify yaml-mode xref xr ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vmd-mode vim-powerline vi-tilde-fringe uuidgen utop undo-tree toc-org tldr terminal-here term-cursor tagedit systemd symon symex symbol-overlay string-edit-at-point stickyfunc-enhance srefactor sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc smeargle slime-company slim-mode sicp shell-pop scss-mode scrollkeeper sass-mode run-command ripgrep restart-emacs rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode psession prettier-js popwin poetry pippel pipenv pip-requirements persp-mode pdfgrep pdf-view-restore pcre2el password-store-otp password-generator paradox ox-gfm overseer orgit-forge org-web-tools org-tidy org-superstar org-starless org-rich-yank org-ref org-projectile org-present org-pomodoro org-pdftools org-page org-mru-clock org-ml org-mime org-link-minor-mode org-link-beautify org-gtd org-download org-contrib org-cliplink org-babel-hide-markers orca open-junk-file on-screen olivetti ocp-indent ocamlformat npm-mode nose nodejs-repl no-littering neotree nameless multi-vterm multi-term multi-line mpv minions merlin-iedit merlin-eldoc merlin-company markdown-toc magit-popup lsp-ui lsp-pyright lsp-origami lorem-ipsum livid-mode live-py-mode lisp-extra-font-lock ligature keycast key-quiz json-reformat json-navigator json-mode js2-refactor js-doc journalctl-mode inspector info+ indent-guide importmagic impatient-mode hybrid-mode hungry-delete holy-mode hl-todo highlight-sexp highlight-parentheses highlight-numbers highlight-indentation highlight-indent-guides highlight-function-calls highlight-defined hide-comnt helpful helm-xref helm-unicode helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-pass helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-firefox helm-file-preview helm-emmet helm-descbinds helm-dash helm-css-scss helm-company helm-comint helm-c-yasnippet helm-bibtex helm-atoms helm-apt google-translate good-scroll golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link gh-md geiser-guile flycheck-pos-tip flycheck-package flycheck-ocaml flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-org evil-numbers evil-nerd-commenter evil-motion-trainer evil-mc evil-matchit evil-lispy evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help epkg emr elisp-slime-nav elisp-demos elisp-def el-patch editorconfig edit-indirect edebug-x edebug-inline-result eat dyncloze dune dumb-jump drag-stuff dotenv-mode doctest doct djvu3 djvu dired-quick-sort director diminish devdocs define-word dap-mode cython-mode csv-mode company-web company-statistics company-quickhelp company-lua company-anaconda common-lisp-snippets command-log-mode column-enforce-mode code-cells clhs clean-aindent-mode chezmoi centered-cursor-mode calibredb blacken auto-yasnippet auto-highlight-symbol auto-dim-other-buffers auto-compile all-the-icons aggressive-indent age adoc-mode achievements ace-link ace-jump-helm-line))
 '(paradox-automatically-star nil)
 '(paradox-execute-asynchronously 'ask t)
 '(paradox-github-token t)
 '(paren-sexp-mode t)
 '(pdf-annot-activate-created-annotations nil)
 '(pdf-annot-edit-contents-display-buffer-action
   '((display-buffer-reuse-window display-buffer-split-below-and-attach)
     (inhibit-same-window . t)
     (window-height . 0.25)))
 '(pdf-annot-list-display-buffer-action
   '((display-buffer-reuse-window display-buffer-in-direction)
     (inhibit-same-window . t)
     (direction . right)))
 '(pdf-annot-list-follow-minor-mode-hook nil)
 '(pdf-annot-list-format '((page . 3) (type . 3) (date . 20) (contents . 50)))
 '(pdf-annot-list-listed-types
   '(file free-text highlight ink link popup squiggly strike-out text underline unknown))
 '(pdf-annot-minor-mode-map-prefix [3 1])
 '(pdf-occur-global-minor-mode t)
 '(pdf-outline-display-buffer-action
   '(display-buffer-in-direction
     (inhibit-same-window . t)
     (direction . right)) nil nil "TODO: change behaviour")
 '(pdf-outline-display-labels t)
 '(pdf-tools-enabled-modes
   '(pdf-history-minor-mode pdf-isearch-minor-mode pdf-links-minor-mode pdf-misc-minor-mode pdf-outline-minor-mode pdf-misc-size-indication-minor-mode pdf-misc-menu-bar-minor-mode pdf-annot-minor-mode pdf-sync-minor-mode pdf-misc-context-menu-minor-mode pdf-cache-prefetch-minor-mode pdf-occur-global-minor-mode pdf-view-themed-minor-mode pdf-view-restore-mode))
 '(pdf-view-display-size 'fit-page)
 '(pdf-view-midnight-colors '("white" . "black"))
 '(pdfgrep-options " -H -n -r ")
 '(persp-save-dir "/media/chriad/nebula/spacemacs-fork/.cache/layouts/")
 '(persp-use-workgroups t)
 '(projectile-known-projects-file
   "/media/chriad/nebula/spacemacs-fork/.cache/projectile-bookmarks.eld")
 '(projectile-project-search-path '("/home/chriad" "/home/chriad/Desktop/PROJECTS"))
 '(psession-autosave-mode t)
 '(psession-mode t)
 '(psession-object-to-save-alist
   '((chriad-pdf-annots . "chriad-pdf-annots.el")
     (pdf-occur-history . "pdf-occur-history.el")
     (org-roam-node-history . "org-roam-node-history.el")
     (bmkp-helm-ff-session-bookmark-history . "bmkp-helm-ff-session-bookmark-history.el")
     (bmkp-helpful-bookmark-history . "bmkp-helpful-bookmark-history.el")
     (magit-git-command-history . "magit-git-command-history.el")
     (evil-ex-history . "evil-ex-history.el")
     (bookmark-history . "bookmark-history.el")
     (read-expression-history . "read-expression-history.el")
     (helm-M-x-input-history . "helm-M-x-input-history.el")
     (helm-ag--helm-history . "helm-ag--helm-history.el")
     (minibuffer-history . "minibuffer-history.el")
     (helm--locate-library-doc-cache . "helm--locate-library-doc-cache.el")
     (helm--locate-library-cache . "helm--locate-library-cache.el")
     (extended-command-history . "extended-command-history.el")
     (helm-external-command-history . "helm-external-command-history.el")
     (helm-surfraw-engines-history . "helm-surfraw-engines-history.el")
     (psession--save-buffers-alist . "psession-save-buffers-alist.el")
     (helm-ff-history . "helm-ff-history.el")
     (helm-browse-project-history . "helm-browse-project-history.el")
     (regexp-search-ring . "regexp-search-ring.el")
     (search-ring . "search-ring.el")
     (file-name-history . "file-name-history.el")
     (kill-ring . "kill-ring.el")
     (kill-ring-yank-pointer . "kill-ring-yank-pointer.el")
     (register-alist . "register-alist.el")
     (psession--winconf-alist . "psession-winconf-alist.el")
     (psession--selected-frame-parameters . "psession-selected-frame-parameters.el")))
 '(psession-savehist-mode t)
 '(racket-browse-url-function 'browse-url-firefox)
 '(racket-documentation-search-location 'local)
 '(reb-mode-hook nil nil nil "TODO: maybe enter evil-lisp-state")
 '(reb-re-syntax 'rx)
 '(safe-local-variable-values
   '((comment-fill-column . 80)
     (etags-regen-ignores "test/manual/etags/")
     (etags-regen-regexp-alist
      (("c" "objc")
       "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/" "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/"))
     (eval add-hook 'before-save-hook 'time-stamp)
     (eval add-hook 'after-save-hook
           (lambda nil
             (shell-command
              (concat markdown-command " README.md > README.html")))
           nil 'local)
     (elisp-lint-indent-specs
      (vulpea-utils-with-file . 1)
      (vulpea-utils-with-note . 1)
      (org-roam-with-file . 2)
      (org-with-point-at . 1)
      (org-element-map . 2)
      (file-templates-set . defun)
      (leader-def . 0)
      (dlet . 1)
      (general-create-definer . 1)
      (eval-with-default-dir . 1)
      (bui-define-interface . 2)
      (use-package . 1)
      (buffer-lines-map . 1)
      (buffer-lines-each . 1)
      (buffer-lines-each-t . 1)
      (request . defun))
     (vulpea-id-auto-targets)
     (eval font-lock-add-keywords nil
           `((,(concat "("
                       (regexp-opt
                        '("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op" "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl")
                        t)
                       "\\_>")
              1 'font-lock-variable-name-face)))
     (eval and buffer-file-name
           (not
            (eq major-mode 'package-recipe-mode))
           (or
            (require 'package-recipe-mode nil t)
            (let
                ((load-path
                  (cons "../package-build" load-path)))
              (require 'package-recipe-mode nil t)))
           (package-recipe-mode))
     (org-blank-before-new-entry
      (heading . auto)
      (plain-list-item . auto))
     (org-list-description-max-indent . 5)
     (org-list-two-spaces-after-bullet-regexp)
     (eval face-remap-add-relative 'org-link
           '(:foreground "dark-green" :underline nil :slant oblique))
     (eval require 'org-starless)
     (eval spacemacs/toggle-line-numbers-on)
     (eval org-hide-src-block-delimiters)
     (eval
      (org-hide-properties))
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(savehist-autosave-interval 60)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-preserve-screen-position nil)
 '(scroll-step 1)
 '(semantic-mode t)
 '(semantic-which-function-use-color t)
 '(show-paren-mode t)
 '(show-paren-style 'expression nil nil "This makes package highlight-sexp obsolete")
 '(spaceline-helm-mode t)
 '(spaceline-info-mode t)
 '(tags-apropos-additional-actions '(("Common Lisp" clhs-doc clhs-symbols)))
 '(tool-bar-mode nil)
 '(tooltip-hide-delay 10 nil nil "3600")
 '(tooltip-mode t nil nil "off")
 '(tooltip-resize-echo-area t)
 '(tramp-adb-connect-if-not-connected t)
 '(tree-sitter-langs-git-dir "/home/chriad/gh/EMACS/tree-sitter-langs")
 '(treemacs-icons-dired-mode t)
 '(undo-fu-session-global-mode t)
 '(undo-tree-auto-save-history nil)
 '(url-handler-mode t nil nil "e.g. open http url as file in buffer")
 '(use-system-tooltips t nil nil "off")
 '(version-control t)
 '(wakatime-cli-path "wakatime")
 '(wakatime-python-bin "python" t)
 '(warning-suppress-log-types '(((tar link)) (comp)))
 '(warning-suppress-types '((comp)))
 '(window-combination-resize t)
 '(winner-mode t nil nil "built-in")
 '(yas-global-mode t)
 '(yas-snippet-dirs
   '("/home/chriad/.local/share/chezmoi/ignored/snippets/" "/media/chriad/nebula/spacemacs-fork/elpa/29.4/develop/common-lisp-snippets-20180226.1523/snippets" yasnippet-classic-snippets-dir yasnippet-snippets-dir))
 '(yas-wrap-around-region t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linkd-generic-link ((t (:foreground "burlywood"))))
 '(linkd-generic-link-name ((t (:foreground "cyan"))))
 '(linkd-tag-name ((t (:foreground "chocolate" :underline t))))
 '(org-level-1 ((t (:extend nil :foreground "#4f97d7"))))
 '(org-level-2 ((t (:inherit bold :foreground "#2d9574"))))
 '(org-level-3 ((t (:extend nil :foreground "#67b11d" :weight normal)))))
