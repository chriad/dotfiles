(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(achievements-mode t)
 '(backup-by-copying t)
 '(backup-directory-alist '(("\".\"" . "\"~/.saves\"")))
 '(bibtex-completion-pdf-field "file")
 '(blink-matching-delay 2)
 '(bmkp-last-as-first-bookmark-file nil)
 '(bookmark-default-file "/home/chriad/.local/share/chezmoi/ignored/emacs/bookmarks")
 '(bookmark-save-flag 1)
 '(clhs-root "file:/media/chriad/ext4/SOFTWARE/HyperSpec/")
 '(company-backends '(company-capf company-semantic company-files))
 '(create-lockfiles nil)
 '(dash-docs-docsets-path "/home/chriad/.local/Zeal/Zeal/docsets")
 '(dash-docs-min-length 3)
 '(default-frame-alist
   '((font . "-ADBO-Source Code Pro-regular-normal-normal-*-16-*-*-*-m-0-iso10646-1")
     (buffer-predicate . spacemacs/useful-buffer-p)
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
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(epa-file-inhibit-auto-save nil)
 '(epa-file-select-keys 'silent)
 '(evil-collection-setup-debugger-keys nil)
 '(evil-collection-want-unimpaired-p nil)
 '(evil-emacs-state-modes
   '(sly-db-mode backtrace-mode package-mode paradox-mode 5x5-mode bbdb-mode blackbox-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bs-mode bubbles-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode custom-theme-choose-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode dun-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode ess-help-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode gomoku-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-popup-mode magit-popup-sequence-mode mh-folder-mode monky-mode mpuz-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode notmuch-tree-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode snake-mode solitaire-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-hg-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode))
 '(evil-insert-state-modes
   '(eaf-edit-mode comint-mode erc-mode eshell-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode term-mode wdired-mode))
 '(evil-move-cursor-back nil)
 '(evil-org-use-additional-insert t)
 '(evil-want-Y-yank-to-eol nil)
 '(fortune-dir "~/.config/fortune")
 '(fortune-file "~/.config/fortune/fortunes")
 '(gist-ask-for-description t)
 '(gist-ask-for-filename t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-scheduler-mode t)
 '(global-semantic-mru-bookmark-mode t)
 '(global-semantic-stickyfunc-mode t)
 '(global-visual-line-mode t)
 '(helm-apropos-fuzzy-match t)
 '(helm-apropos-show-short-doc t)
 '(helm-bookmark-default-filtered-sources
   '(helm-source-bookmark-org helm-source-bookmark-files&dirs helm-source-bookmark-helm-find-files helm-source-bookmark-info helm-source-bookmark-gnus helm-source-bookmark-mu4e helm-source-bookmark-man helm-source-bookmark-images helm-source-bookmark-w3m helm-source-bookmark-uncategorized helm-source-bookmark-set helm-source-bookmark-dired))
 '(helm-bookmark-show-location t)
 '(helm-bookmark-use-icon t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-candidate-number-limit 700)
 '(helm-completion-style 'helm-fuzzy)
 '(helm-completions-detailed t)
 '(helm-descbinds-mode t)
 '(helm-descbinds-window-style 'split)
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
     ("Relocate bookmark" . bookmark-relocate)
     ("bmkp-find-file" . bmkp-find-file)
     ("Add tag with bmkp-add-tags" . ignore)))
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
 '(org-capture-mode-hook
   '(spacemacs//org-capture-start org-capture-mode-hook--org-fc-cloze-code-hook))
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
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-insert-heading-respect-content t)
 '(org-journal-date-format "%d-%m-%Y")
 '(org-journal-dir "~/org-journal-fork")
 '(org-journal-enable-agenda-integration t)
 '(org-journal-file-format "%Y-%m-%d.org")
 '(org-journal-time-prefix "- ")
 '(org-modules
   '(ol-bbdb ol-bibtex org-ctags ol-docview ol-doi ol-eww org-habit ol-info org-tempo ol-w3m ol-git-link ol-man))
 '(org-pdftools-free-pointer-color "#FF8C00")
 '(org-pdftools-free-pointer-icon "Insert")
 '(org-pdftools-free-pointer-opacity 0.4)
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
     ("dot" . fundamental)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql)
     ("toml" . conf-toml)
     ("tldr" . tldr)
     ("helpful" . helpful)))
 '(org-startup-with-inline-images nil)
 '(org-superstar-headline-bullets-list '(8227 8227 8227 10047))
 '(org-superstar-remove-leading-stars t)
 '(package-selected-packages
   '(fit-frame toml-mode geiser helm-system-packages fn anki-editor-view anki-mode anki-editor keymap-utils org-fc zeal-at-point yasnippet-snippets yasnippet-classic-snippets yapfify yaml-mode xref xr ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vmd-mode vim-powerline vi-tilde-fringe uuidgen utop undo-tree toc-org tldr terminal-here term-cursor tagedit systemd symon symex symbol-overlay string-edit-at-point stickyfunc-enhance srefactor sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc smeargle slime-company slim-mode sicp shell-pop scss-mode scrollkeeper sass-mode run-command ripgrep restart-emacs rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode psession prettier-js popwin poetry pippel pipenv pip-requirements persp-mode pdfgrep pdf-view-restore pcre2el password-store-otp password-generator paradox ox-gfm overseer orgit-forge org-web-tools org-tidy org-superstar org-starless org-roam org-rich-yank org-ref org-projectile org-present org-pomodoro org-pdftools org-page org-mru-clock org-ml org-mime org-link-minor-mode org-link-beautify org-gtd org-download org-contrib org-cliplink org-babel-hide-markers orca open-junk-file on-screen olivetti ocp-indent ocamlformat npm-mode nose nodejs-repl no-littering neotree narrow-indirect nameless multi-vterm multi-term multi-line mpv minions merlin-iedit merlin-eldoc merlin-company markdown-toc magit-popup lsp-ui lsp-pyright lsp-origami lorem-ipsum livid-mode live-py-mode lisp-extra-font-lock linkd link-hint ligature keycast key-quiz json-reformat json-navigator json-mode js2-refactor js-doc journalctl-mode inspector info+ indent-guide importmagic impatient-mode hybrid-mode hungry-delete holy-mode hl-todo highlight-sexp highlight-parentheses highlight-numbers highlight-indentation highlight-indent-guides highlight-function-calls highlight-defined hide-comnt helpful helm-xref helm-unicode helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-pass helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-firefox helm-file-preview helm-emmet helm-descbinds helm-dash helm-css-scss helm-company helm-comint helm-c-yasnippet helm-bibtex helm-atoms helm-apt google-translate good-scroll golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link gh-md geiser-guile flycheck-pos-tip flycheck-package flycheck-ocaml flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-org evil-numbers evil-nerd-commenter evil-motion-trainer evil-mc evil-matchit evil-lispy evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help epkg emr elisp-slime-nav elisp-demos elisp-def el-patch editorconfig edit-indirect edebug-x edebug-inline-result eat dyncloze dune dumb-jump drag-stuff dotenv-mode doctest doct djvu3 djvu dired-quick-sort director diminish devdocs define-word dap-mode cython-mode csv-mode company-web company-statistics company-quickhelp company-lua company-anaconda common-lisp-snippets command-log-mode column-enforce-mode code-cells clhs clean-aindent-mode chezmoi centered-cursor-mode calibredb bookmark+ blacken auto-yasnippet auto-highlight-symbol auto-dim-other-buffers auto-compile all-the-icons aggressive-indent age adoc-mode achievements ace-link ace-jump-helm-line))
 '(paradox-automatically-star nil)
 '(paradox-execute-asynchronously 'ask t)
 '(paradox-github-token t)
 '(paren-sexp-mode t)
 '(pdf-annot-activate-created-annotations nil)
 '(pdf-annot-list-follow-minor-mode-hook nil)
 '(pdf-annot-list-format '((page . 3) (type . 10) (label . 24) (date . 24)))
 '(pdf-annot-list-listed-types
   '(free-text highlight ink squiggly strike-out text underline unknown))
 '(pdf-annot-minor-mode-map-prefix [3 1])
 '(pdf-info-epdfinfo-program "/home/chriad/epdfinfo")
 '(pdf-outline-display-labels t)
 '(pdf-tools-enabled-hook
   '((lambda nil
       (define-key pdf-annot-list-mode-map
                   (kbd "o")
                   #'(lambda nil
                       (interactive)
                       (pdf-outline pdf-annot-list-document-buffer nil))))))
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
   '((read-expression-history . "read-expression-history.el")
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
     (psession--selected-frame-parameters . "psession-selected-frame-parameters.el")
     (key-quiz--custom-keys-alist . "key-quiz--custom-keys-alist.el")))
 '(psession-savehist-mode t)
 '(racket-browse-url-function 'browse-url-firefox)
 '(racket-documentation-search-location 'local)
 '(reb-re-syntax 'rx)
 '(safe-local-variable-values
   '((eval face-remap-add-relative 'org-link
           '(:foreground "dark-green" :underline nil :slant oblique))
     (eval require 'org-starless)
     (eval spacemacs/toggle-line-numbers-on)
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
 '(tramp-adb-connect-if-not-connected t)
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
 '(linkd-generic-link ((t (:foreground "burlywood"))))
 '(linkd-generic-link-name ((t (:foreground "cyan"))))
 '(linkd-tag-name ((t (:foreground "chocolate" :underline t)))))
