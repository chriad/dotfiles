;; -*- mode: emacs-lisp; lexical-binding: t; -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '(
                                           "/media/chriad/nebula/spacemacs-fork/private/"
                                           )

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;;;; Programming
     ;;; DSL
     ;;  Markup & config
     asciidoc
     (json :variables json-backend 'lsp)
     bibtex
     csv
     (html :variables web-fmt-tool 'web-beautify)
     yaml
     ;; Lisp
     ; racket
     ; (scheme :variables scheme-implementations '(chicken))
     emacs-lisp
     common-lisp
     ;;; general-purpose
     ;; TOML
     toml
     ;; Multi paradigm
     (python :variables python-backend 'lsp python-lsp-server 'pyright)
     ; rust
     ocaml
     lua
     (javascript :variables javascript-backend 'lsp javascript-repl `nodejs)
     ; sml

     ;;;; Tools
     systemd
     pass
     web-beautify
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     lsp
     dap

     ;;;; private layers
     chezmoi
     curiophenalia
     helm-additional
     elisp-additional
     org-additional
     bookmark-plus

     ;;;; Misc
     (spacemacs-layouts :variables
                        spacemacs-layouts-restrict-spc-tab t
                        persp-autokill-buffer-on-remove 'kill-weak)

     ;;;; third-party
     ; toc
     (calibre :variables
              calibredb-root-dir "/media/chriad/ssd-45/reflowable"
              calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))

     ;;;; Completion
     ;;; Auto-completion
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip 'manual)

     ;;; Helm
     helm
     ;;;; readers
     pdf
     djvu
     ; (elfeed :variables rmh-elfeed-org-files (list (concat "/home/chriad/.config/emacs/" "elfeed.org")))
     ;;;; Source control
     git

     ;;;; TODO classify
     ; emoji
     ; (ipython-notebook :variables ein-backend 'jupyter)

     ; (ranger :variables ranger-show-preview t)
     helpful
     ; deft
     (dash :variables ;; offline doc browser
           dash-docs-docset-newpath "~/.local/share/Zeal/Zeal/docsets")
     (spacemacs-evil :variables
                     spacemacs-evil-collection-allowed-list
                     '(ediff dired))
     command-log
     (markdown :variables markdown-live-preview-engine 'vmd)
     multiple-cursors
     (org :variables
          ; org-enable-org-journal-support t
          org-enable-roam-support t
          org-enable-github-support t)

     ;;;; Checkers
     ;; spell-checking
     ; syntax-checking

     ;;;; File Trees
     neotree
     ; treemacs

     ;;;; emacs
     semantic
     ; better-defaults ;; emacs style
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      (qpdf :location (recipe
                                                       :fetcher github
                                                       :repo "orgtre/qpdf.el"))
                                      org-roam-ui
                                      try
                                      fzf
                                      zones ;; TODO: try multiple narrowings
                                      sway
                                      ;; helm-systemd
                                      anki-mode
                                      with-simulated-input
                                      psession ;; for helm-locate-library
                                      tldr
                                      el-patch ;; I like this
                                      ;; mic-paren ;; customize paren-face-match
                                      ;; helm-dired-history
                                      ;; (guix-emacs :location "~/.guix-profile/share/emacs/site-lisp/guix-emacs.el")
                                      ;; guix ;; install with guix
                                      ;; geiser ;; installed with guix
                                      ;; geiser-guile ;; installed with guix
                                      magit-popup ;; guix
                                      (director :location (recipe ;; automate is king
                                                           :fetcher github
                                                           :repo "bard/emacs-director"
                                                           :files (:defaults "util/*.el" "examples/demo/*.el")))
                                      (doctest :location (recipe
                                                          :fetcher github
                                                          :repo "ag91/doctest"))
                                      (highlight-sexp :location (recipe
                                                                 :fetcher github
                                                                 :repo "daimrod/highlight-sexp"))
                                      ;; m-buffer
                                      ;; shackle
                                      minions ;; minions-minor-mode-menu
                                      ;; dired-git-info ;; disable for debug
                                      ;; camcorder
                                      run-command
                                      symex
                                      ;; niceify-info ;; breaks helm-info
                                      dyncloze
                                      no-littering ;; useful
                                      ;; ascii-table
                                      clhs
                                      evil-lispy
                                      ;;; TODO move to org-additional
                                      org-roam
                                      org-mru-clock
                                      org-page
                                      org-gtd
                                      ;; org-edna
                                      orca
                                      org-ml
                                      org-web-tools
                                      ;; org-noter
                                      ;; org-noter-pdftools
                                      org-pdftools ;; important

                                      lisp-extra-font-lock
                                      highlight-indent-guides
                                      ;; elisp-def ;; part of elisp layer
                                      key-quiz
                                      ;; sr-speedbar
                                      lispy
                                      achievements
                                      doct
                                      common-lisp-snippets
                                      ;; sly
                                      ;; jupyter
                                      (org-fc
                                       :location (recipe :fetcher git
                                                         :url "https://git.sr.ht/~l3kn/org-fc"
                                                         :files (:defaults "awk" "docs" "demo.org")))
                                      ;; buttons
                                      ctable
                                      deferred
                                      epc
                                      orca ;; org-capture convenience
                                      olivetti
                                      nov
                                      ;; (code-spelunk :location local)
                                      ;; (screenshot :location local)
                                      ;; helm-posframe
                                      ;; which-key-posframe
                                      highlight-function-calls
                                      sicp
                                      pdfgrep
                                      auto-dim-other-buffers
                                      edebug-x ;; edebug e*x*tensions
                                      edebug-inline-result
                                      ripgrep
                                      ;; beacon
                                      xr ;;     Convert string regexp to rx notation
                                      ;; (mplayer-mode :location (recipe :fetcher github :repo "markhepburn/mplayer-mode"))
                                      ;; (justify-kp :location (recipe :fetcher github :repo "Fuco1/justify-kp"))
                                      (evil-motion-trainer :location (recipe :fetcher github :repo "martinbaillie/evil-motion-trainer"))
                                      keyfreq
                                      epkg

                                      ;; good-scroll
                                      ;; on-screen
                                      ;; scrollkeeper

                                      edit-indirect
                                      mpv
                                      yasnippet-classic-snippets
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '(
                                  ;; guix
                                  geiser ;; externally managed by guix
                                  geiser-guile ;; externally managed by guix
                                  )

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused)) ;; this seems necessary for geiser, geiser-guile

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                                        ;vscode-dark-plus
                         spacemacs-dark
                         spacemacs-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 20

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs t

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."


  (open-dribble-file "~/.config/emacs/dribble")
  ;; The default is 800 kilobytes.  Measured in bytes.
  ;; (setq gc-cons-threshold (* 50 1000 1000))

  ;; (defvar key-quiz--custom-keys-alist '(("C-h k" . "describe-key")))
  ;; (set-face-attribute 'default nil :height 120)
  ;; Profile emacs startup
  ;; (add-hook 'emacs-startup-hook
  ;;           (lambda ()
  ;;             (message "*** Emacs loaded in %s with %d garbage collections."
  ;;                      (format "%.2f seconds"
  ;;                              (float-time
  ;;                               (time-subtract after-init-time before-init-time)))
  ;;                      gcs-done)))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (use-package fzf
    :bind
    ;; Don't forget to set keybinds!
    :config
    (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
          fzf/executable "fzf"
          fzf/git-grep-args "-i --line-number %s"
          ;; command used for `fzf-grep-*` functions
          ;; example usage for ripgrep:
          ;; fzf/grep-command "rg --no-heading -nH"
          fzf/grep-command "grep -nrH"
          ;; If nil, the fzf buffer will appear at the top of the window
          fzf/position-bottom t
          fzf/window-height 15))

  (with-eval-after-load 'bookmark+
    (defun lib-bookmark-jump (bookmark)
  (let* ((pkg (bookmark-prop-get bookmark 'pkg))
         (position (bookmark-prop-get bookmark 'position))
         (oldpath (bookmark-prop-get bookmark 'libpath))
         (newpath  (find-library pkg)))
    (unless (equal oldpath newpath) (message "Package update detected"))
    (find-file newpath)
    (goto-char position)))


(defun lib-bookmark-make-record ()
  (if (find-library (file-name-nondirectory (buffer-file-name)))
  `(,@(bookmark-make-record-default t nil nil) ;; no-file context=yes point=yes
    (pkg       . ,(file-name-nondirectory (buffer-file-name)))
    (libpath   . ,(buffer-file-name))
    (handler   . lib-bookmark-jump))
  `(,@(bookmark-make-record-default))))

(add-hook 'emacs-lisp-mode-hook #'(lambda () (setq-local bookmark-make-record-function #'lib-bookmark-make-record))))


  ;; TODO
  ;; (spacemacs|diminish achievements-mode " 🏆" " [trophy]")
  ;; (spacemacs|add-toggle nameless
  ;;   :status nameless-mode
  ;;   :on (nameless-mode)
  ;;   :off (nameless-mode -1)

    ;; (require 'delight)
    ;; (delight 'achievements-mode nil)

  ;; TODO
  ;; (defun log-edebug-instrumentees-advice (orig &rest args)
  ;;     "DOCSTRING"
  ;;     (let ((form (save-excursion
  ;;                   (search-backward-regexp "(defun")
  ;;                   (forward-list)
  ;;                   (call-interactively 'eval-last-sexp))))
  ;;  (if orig (message "%s" form) nil)))

  ;; (add-function :before 'eval-defun #'log-edebug-instrumentees-advice)


  ;; TODO move this to bookmark-plus layer, install helm-bookmarks there and declare shadow relationship with helm layer which also installs helm-bookmarks
  (with-eval-after-load 'helm-bookmark
    ;; integrate bookmark+ with helm-bookmarks
    (defun helm-bookmark-dired-setup-alist ()
      "Specialized filter function for Org file bookmarks."
      (helm-bookmark-filter-setup-alist 'bmkp-dired-bookmark-p))

    (defun helm-source-bookmark-dired-builder ()
      (helm-bookmark-build-source "Dired" #'helm-bookmark-dired-setup-alist))

    (defvar helm-source-bookmark-dired (helm-source-bookmark-dired-builder)))



  ;; TODO
  ;; (defun save-emacs-uptime (ignore))
  ;; (add-hook 'kill-emacs-hook #'save-emacs-uptime)

  ;; TODO does not work
  (with-eval-after-load 'info
    (define-key Info-mode-map "n" 'Info-next))


  ;; prompt before close
  (add-hook 'kill-emacs-query-functions
            'custom-prompt-customize-unsaved-options)


  (put 'chezmoi-diff 'disabled "~~~ Use chezmoi-ediff ~~~")
  (put 'spacemacs/paradox-list-packages 'disabled "~~~ Use SPC f e U ~~~")

  (use-package org-pdftools
    :hook (org-mode . org-pdftools-setup-link))


  (setq bibtex-completion-bibliography '("~/.config/bibliographies/fixed-layout.bib")
        ;; bibtex-completion-library-path "~/Papers/"
        ;; bibtex-completion-notes-path "~/Papers/notes.org"
        )

  (setq psession-elisp-objects-default-directory (no-littering-expand-var-file-name "elisp-objects/"))
  (load (expand-file-name "key-quiz--custom-keys-alist.elc" psession-elisp-objects-default-directory))

    ;; (defun insert-org-mode-link-from-helm-result (candidate)
    ;;   (interactive)
    ;;   (with-helm-current-buffer
    ;;     (insert (format "[[file:%s][%s]]"
    ;;                     (plist-get candidate :file)
    ;;                     ;; Extract the title from the file name
    ;;                     (subst-char-in-string
    ;;                      ?_ ?\s
    ;;                      (first
    ;;                       (split-string
    ;;                        (first
    ;;                         (last
    ;;                          (split-string (plist-get candidate :file) "\\-")))
    ;;                        "\\.")))))))

    ;; (helm-add-action-to-source "Insert org-mode link"
    ;;                            'insert-org-mode-link-from-helm-result
    ;;                            helm-rg-process-source)

  (setq calibredb-ref-default-bibliography (concat (file-name-as-directory calibredb-root-dir) "fixed-layout.bib"))

    ;; (add-to-list 'org-ref-default-bibliography calibredb-ref-default-bibliography)
    ;; (setq org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename)
    ;; ;;; TODO
    ;; (setq backup-directory-alist
    ;;       `((".*" . temporary-file-directory))
    ;;       auto-save-file-name-transforms
    ;;       `((".*" ,temporary-file-directory t)))

    ;; not needed currently
    ;; (load-library "~/.config/emacs/secrets.el.gpg")

    ;; (setq shackle-default-rule '(:frame t)
    ;;       shackle-display-buffer-frame-function 'sway-shackle-display-buffer-frame)

    ;; (sway-socket-tracker-mode)
    ;; (sway-undertaker-mode) ;; If you want to use :dedicate, read below.
    ;; (sway-x-focus-through-sway-mode) ;; Temporary workaround for Sway bug 6216

    ;; load patches
  (defun load-directory (dir)
    (let ((load-it (lambda (f)
                     (load-file (concat (file-name-as-directory dir) f)))
                   ))
      (mapc load-it (directory-files dir nil "\\.el$"))))
  (load-directory "~/.config/emacs/el-patch-patches/")

  (setq pylookup-html-locations '("https://docs.python.org/3"))
  ;; for pylookup
  ;; (setq browse-url-handlers '(("\\`file:" . www-browser)))

;;;  breaks helm-info
  ;; (add-hook 'Info-selection-hook #'niceify-info)

  (use-package lsp-pyright
    :ensure t
    :hook (python-mode . (lambda ()
                           (require 'lsp-pyright)
                           (lsp))))     ; or lsp-deferred

  ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; required so that yasnippets are loaded

  (dolist (hook '(ielm-mode-hook))
    (add-hook hook #'elisp-def-mode))

  (push 'elisp-def spacemacs-jump-handlers-emacs-lisp-mode)

  ;; (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

  ;; (require 'evil-lispy)
  ;; (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
  ;; (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)


  ;; not customizable
  (setq define-word-offline-dict-directory "/media/chriad/ext4/SOFTWARE/dictionaries_enwiktionary/ding/")
  (setq org-capture-template-dir "/home/chriad/.config/emacs/capture-templates/")


    ;; TODO it should not be necessary to bind keys explicity like here, but it doesn't work otherwise
    ;; (with-eval-after-load 'edebug-x
    ;;   (define-derived-mode
    ;;     edebug-x-instrumented-function-list-mode tabulated-list-mode "Edebug Instrumented functions"
    ;;     "Major mode for listing instrumented functions"
    ;;     (setq tabulated-list-entries 'edebug-x-list-instrumented-functions)
    ;;     (setq tabulated-list-format
    ;;           [("Instrumented Functions" 50 nil)
    ;;            ("File" 150 nil)])

    ;;     (set-keymap-parent edebug-x-instrumented-function-list-mode-map tablist-mode-map)
    ;;     (use-local-map edebug-x-instrumented-function-list-mode-map)
    ;;     (tabulated-list-init-header)))

    ;;; extends pdf layer declaration
    ;; TODO move above to use-package

    ;; (require 'qpdf.el)
  (defun chriad/fix-pdf-selection ()
    "Replace pdf with one where selection shows transparently."
    (interactive)
    (unless (equal (file-name-extension (buffer-file-name)) "pdf")
      (error "Buffer should visit a pdf file."))
    (require 'qpdf.el)
    (unless (equal major-mode 'pdf-view-mode)
      (pdf-view-mode))
    ;; make backup
    (copy-file (buffer-file-name) (concat (buffer-file-name) ".orig_before_qpdf"))
    ;; save file in QDF-mode
    (qpdf-run (list
               (concat "--infile="
                       (buffer-file-name))
               "--qdf --object-streams=disable"
               "--replace-input"))
    ;; do replacements
    (text-mode)
    (read-only-mode -1)
    (while (re-search-forward "3 Tr" nil t)
      (replace-match "7 Tr" nil nil))
    (save-buffer)
    (pdf-view-mode))

  ;; moved to customize
  ;; (setq pdf-view-mode-hook '(pdf-view-restore-mode pdf-view-themed-minor-mode))
  ;; automatically enable follow mode for search results
  (add-hook 'pdf-occur-buffer-mode-hook (lambda () (next-error-follow-minor-mode))) ;; follow occur hits

  (add-hook 'pdf-annot-list-mode-hook 'pdf-annot-list-follow-minor-mode)
  ;; (use-package pdf-tools
  ;;   :hook (pdf-annot-list-mode . pdf-annot-list-follow-minor-mode)
  ;;   :hook (pdf-view-mode-hook . '(pdf-view-restore-mode pdf-view-midnight-minor-mode))
  ;;   :hook (pdf-occur-buffer-mode-hook . (lambda () (next-error-follow-minor-mode))))
    ;;;

  (use-package org-roam
    :defer t
    :config
    (setq org-roam-directory "/home/chriad/roam/")
    (setq org-roam-node-display-template "${title:*} ${tags:15}")
    (setq org-roam-completion-everywhere t)
    (setq org-id-link-to-org-use-id t)
    (org-roam-db-autosync-mode 1)
    ;; TODO
    (defun chriad/org-roam-publishable-p ()
      "The node is publishable if (1) at least on backlink exists and (2) all backlinks are also publishable"
      (ignore))

    (cl-defmethod org-roam-node-uuid ((node org-roam-node))
      "Return the uuid of NODE."
      (uuidgen-1))
    (setq org-roam-capture-ref-templates ;; :fox:
          '(
            ("n" "webpage no region" entry "* %?"
             :if-new (file+head "${slug}.org" "#+title: ${title}")
             :unnarrowed t)

            ("r" "webpage no region" entry "* %?"
             :if-new (file+head "${slug}.org" "#+title: ${title}")
             :file-name "${slug}"
             :head "#+title: ${title}\n"
             :unnarrowed t)

            ("i" "webpage no region" item "%i"
             :if-new (file+head "${slug}.org" "#+title: ${title}")
             :file-name "${slug}"
             ;; :head "#+title: ${title}\n"
             :unnarrowed t)
            )
          )
    (setq org-roam-capture-templates
          '(
            ("d" "default" entry "* _\n%?"
             :target (file+head "${slug}.org"
                                "#+title: ${title}")
             :unnarrowed t)

            ("r" "uuid" plain "%?"
             :target (file+head "${uuid}.org.gpg"
                                "#+title: ${title}")
             :unnarrowed t)

            ("c" "context" plain "link: %A\nregion: %i\ncomment: %?"
             :target (file+head "${slug}.org"
                                "#+title: ${title}")
             :unnarrowed t)))
    :bind
    ("C-c n c" . org-roam-capture)
    ("C-c n i" . org-roam-node-insert)
    ("C-c n d" . org-roam-dailies-capture-today)
    ("C-c n g" . org-roam-show-graph)
    ("C-c n u" . org-roam-ui-open) ;;  http://localhost:35901/
    ("C-c n a t" . org-roam-tag-add)
    ("C-c n a a" . org-roam-alias-add)
    ("C-c n a r" . org-roam-ref-add)
    ("C-c n f r" . org-roam-ref-find)
    ("C-c n f f" . org-roam-node-find)
    ("C-c n t a" . org-roam-tag-add)
    ("C-c n t r" . org-roam-tag-remove)
    ("C-c n r" . org-roam-refile)
    ("C-c n R" . org-roam-node-random)
    ("C-c n e" . org-roam-extract-subtree) ;; notes shouldn't get too long. Better many files than one file with many notes
    ("C-c n o" . org-id-get-create)
    ("C-c n o" . org-id-get-create))

    ;; (defun org-capture-mode-hook--org-fc-cloze-code-hook ()
    ;;   (if (equal (org-capture-get :key) "lcs")
    ;;       (progn
    ;;         (org-babel-next-src-block)
    ;;         (org-edit-special))))

  (use-package org-fc
    :defer t
    :config
    (use-package hydra)
    (require 'org-fc-hydra)
    (require 'org-fc-keymap-hint)
    (setq org-fc-directories '("~/roam/"))
    (setq org-fc-review-history-file
          (no-littering-expand-var-file-name "org-fc-reviews.tsv"))

    ;; (defun org-fc-after-setup-hook--narrow-to-src-element ()
    ;;   (save-excursion
    ;;     (progn
    ;;       (org-babel-next-src-block)
    ;;       (org-narrow-to-element)
    ;;       )))

    ;; (setq org-fc-after-flip-hook '(org-hide-src-block-delimiters)) ;; this functionality is built-in in org-fc
    ;; (setq org-fc-after-setup-hook '(org-fc-after-setup-hook--narrow-to-src-element))
    ;; (setq org-fc-after-review-hook '(#[0 "\300\301!\207" [message ""] 2] ignore))


    (defun org-fc-view-demo ()
      (interactive)
      (let ((path (expand-file-name "demo.org" org-fc-source-path)))
        (with-current-buffer (find-file path))))

    (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-flip-mode
      (kbd "RET") 'org-fc-review-flip
      (kbd "n") 'org-fc-review-flip
      (kbd "s") 'org-fc-review-suspend-card
      (kbd "q") 'org-fc-review-quit)

    (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-rate-mode
      (kbd "a") 'org-fc-review-rate-again
      (kbd "h") 'org-fc-review-rate-hard
      (kbd "g") 'org-fc-review-rate-good
      (kbd "e") 'org-fc-review-rate-easy
      (kbd "s") 'org-fc-review-suspend-card
      (kbd "q") 'org-fc-review-quit)


    (defhydra org-fc-hydra ()
      ("m" org-fc-dashboard "Dashboard" :exit t)
      ("r" org-fc-review "Start Review" :exit t)
      ("u" org-fc-update "Update Card")
      ("t" org-fc-hydra-type/body "Init Type" :exit t)
      ("q" nil "Quit" :exit t)

      ("c" org-fc-cloze-dwim "cloze-region" :exit t)
      ("d" org-fc-view-demo "show demo file" :exit t)
      ("h" org-fc-help "show help" :exit t)
      )

    ;; (global-set-key (kbd "C-c f") 'org-fc-hydra/body)
    ;; (global-set-key (kbd "C-c f") 'org-fc-narrow)
    :bind
    ("C-c f" . org-fc-hydra/body)
    ;; ("C-c f" . org-fc-narrow)

    )


    ;; (global-evil-motion-trainer-mode 1)
    ;; (setq evil-motion-trainer-threshold 6)
    ;; (setq evil-motion-trainer-super-annoying-mode t)
    ;; (emt-add-suggestion 'evil-next-line 'evil-avy-goto-char-timer) ;;emt= evil-motion-trainer

  ;;; initial states

    ;; working
    ;; not working
  (evil-set-initial-state 'Info-edit-mode 'emacs)
    ;; (evil-set-initial-state 'debugger-mode 'emacs)
    ;; (remove-hook 'paradox-menu-mode-hook 'evil-mode)
    ;; (remove-hook 'paradox-mode-hook 'evil-mode)
    ;; (remove-hook 'package-mode-hook 'evil-mode)
    ;; (remove-hook 'package-menu-mode-hook 'evil-mode)

    ;; (evil-set-initial-state 'org-capture-mode 'insert)

    ;; customize
    ;; (add-hook 'org-mode-hook 'org-indent-mode)

    ;; (load "/media/chriad/nebula/spacemacs-fork/private/local/dired-plus/dired+.el")
    ;; (load "/media/chriad/nebula/spacemacs-fork/private/local/pp-plus/pp+.el")
    ;; (load "/media/chriad/nebula/spacemacs-fork/private/local/thingatpt-plus/thingatpt+.el")
    ;; (load "/media/chriad/nebula/spacemacs-fork/private/local/org-babel-hide-markers-mode/ob-hide-markers.el")


    ;; (add-hook 'pdf-view-mode-hook (lambda ()
    ;;                                 (pdf-view-auto-slice-minor-mode)))



    ;; (add-hook 'org-noter-doc-mode-hook (lambda () (spacemacs/set-leader-keys-for-minor-mode
    ;;                                                 'org-noter-doc-mode "i" 'org-noter-insert-precise-note)))
    ;; (add-hook 'org-noter-doc-mode-hook (lambda () (spacemacs/set-leader-keys-for-minor-mode
    ;;                                                 'org-noter-doc-mode "<f9>" 'org-noter-sync-current-page-or-chapter)))
    ;; (add-hook 'org-noter-notes-mode-hook (lambda () (spacemacs/set-leader-keys-for-minor-mode
    ;;                                                   'org-noter-notes-mode "<f9>" 'org-noter-sync-current-note)))
    ;; (global-set-key (kbd "<f8>") 'org-noter-sync-current-page-or-chapter)
    ;; (global-set-key (kbd "<f9>") 'org-noter-sync-current-note)



    ;; (require 'pdfgrep)
    ;; (pdfgrep-mode)

  (setq helm-dash-browser-func 'eww)
  (setq dash-docs-browser-func 'eww)

  (add-hook 'emacs-lisp-mode-hook 'highlight-function-calls-mode)
  ;; (add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode)

  ;; relative paths to pdf files
  ;; (defun my/path-generator (bfn)
  ;;   (s-concat "./" (f-filename bfn)))
  ;; ;; (helm-posframe-enable)




  (use-package nov
    :defer t
    :init (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  :config
  ;; (add-hook 'nov-mode-hook 'on-screen-mode)
  ;; (evil-set-initial-state 'nov-mode 'emacs)
  ;; (add-hook 'nov-post-html-render-hook 'my-nov-post-html-render-hook)
  )

  ; ranger
  ;; (setq ranger-enter-with-minus 'deer)
  ;; (setq ranger-cleanup-on-disable t)
  ;; (setq ranger-cleanup-eagerly t)


  ;; (set-face-attribute 'default nil :family "Source Code Pro")
  ;; (set-face-attribute 'default nil :height 125)

  ;; (use-package edebug-inline-result
  ;;   :ensure t
  ;;   :defer t
  ;;   :custom (edebug-inline-result-backend 'posframe)
  ;;   :hook (edebug-mode . edebug-inline-result-mode))



    ;; (good-scroll-mode 1)

  (global-prettify-symbols-mode)

    ;; moved to customize
    ;; (add-hook 'dired-mode-hook
    ;;           (lambda ()
    ;;             (dired-hide-details-mode)))

    ;; (require 'orca)


  (load "~/.config/emacs/capture.el")
  (load "~/.config/emacs/o-keymap.el")

    ;; (setq org-outline-path-complete-in-steps nil) ; Refile in a single go
    ;; (setq org-refile-use-outline-path t)          ; Show full paths for refiling

    ;; from debian package hyperspec
    ;; hyperspec.el that defines ``common-lisp-hyperspec-root'' is part of package slime



  (defcustom common-lisp-hyperspec-root "/usr/share/doc/hyperspec/"
    "Normal hook run when entering Text mode and many related modes."
    :type '(string)
    :group 'lisp)

  (setq common-lisp-hyperspec-symbol-table
        (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))

  ;; TODO browse-url does not work
  ;; http://dnaeon.github.io/starting-with-common-lisp-in-2020/
  (use-package clhs
    :defer t
    :config
    ;; (setq clhs-root (concat "file:" common-lisp-hyperspec-root))
    (setq clhs-root (concat "file:/" "/usr/share/doc/hyperspec"))
    (autoload 'clhs-doc "clhs" "Get doc on ANSI CL" t)
    (define-key help-map "\C-l" 'clhs-doc)
    (custom-set-variables
     '(tags-apropos-additional-actions '(("Common Lisp" clhs-doc clhs-symbols)))))





    ;; (setq spaceline-org-clock-p t)
    ;; TODO move to org-additional
    ;; (setq org-mru-clock-keep-formatting t)

    ;; moved to customize
    ;; (add-hook 'org-mode-hook
    ;;           (lambda ()
    ;;             (setq prettify-symbols-alist
    ;;                   '(("lambda" . ?λ)
    ;;                     ("defun" . ?⨐)
    ;;                     ("->"     . ?⟶)
    ;;                     (":="     . ?≔)
    ;;                     ("=>"     . ?⟹)
    ;;                     ("#t"     . ?⟙)
    ;;                     ("!="     . ?≠)
    ;;                     ("#f"     . ?⟘)))))

  (use-package symex
    :defer t
    :config
    (symex-initialize)
    (global-set-key (kbd "s-;") 'symex-mode-interface)
    :custom (symex-modal-backend 'hydra))


  (with-eval-after-load 'org

    (require 'org-page)
    (setq op/repository-directory "~/blog/")
    (setq op/site-domain "http://chriad.github.io/")
    (setq op/personal-github-link "https://github.com/chriad")
    (setq op/site-main-title "My Blog")
    (setq op/site-sub-title "Spacemacs")

    (require 'evil-surround)
    (add-hook 'org-mode-hook (lambda ()
                               (push '(?{ . ("{{" . "}}")) evil-surround-pairs-alist)))
    )

  (setq custom-file "/home/chriad/.config/emacs/emacs-custom.el")
  (load custom-file)
  )
