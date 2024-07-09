;; -*- mode: emacs-lisp; lexical-binding: t; eval: (semantic-mode); -*-
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
   '((python :variables python-backend 'lsp python-lsp-server 'pyright)
     ;; rust
     ocaml
     asciidoc
     lua
     systemd
     ;; (elfeed :variables rmh-elfeed-org-files (list (concat "/home/chriad/.config/emacs/" "elfeed.org")))
     ;; << private layers
     chezmoi
     helm-additional
     elisp-additional
     org-additional
     ;; >> private layers
     (javascript :variables javascript-backend 'lsp
                            javascript-repl `nodejs)
     (json :variables json-backend 'lsp)
     pass
     bibtex
     (spacemacs-layouts :variables
                        spacemacs-layouts-restrict-spc-tab t
                        persp-autokill-buffer-on-remove 'kill-weak)
     ;; sml

     ;; toc
     (calibre :variables
              calibredb-root-dir "/media/chriad/ssd-45/reflowable"
              calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir)
              calibredb-library-alist '(("/media/chriad/ssd-45/reflowable"
                                         "/media/chriad/ssd-45/fixed-layout")))
     csv
     djvu
     html
     ;; (scheme :variables
     ;;         scheme-implementations '(chicken))
     ;; (ranger :variables ranger-show-preview t)
     yaml
     helpful
     ;; deft
     (dash :variables
           dash-docs-docset-newpath "~/.local/share/Zeal/Zeal/docsets")
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip 'manual)
     ;; emoji
     ;; better-defaults ;; emacs style
     common-lisp
     ;; (ipython-notebook :variables ein-backend 'jupyter)
     emacs-lisp
     ;; (wakatime :variables
     ;;           wakatime-cli-path "wakatime"
     ;;           wakatime-python-bin nil)
     git
     pdf
     ;; eaf
     helm
     (spacemacs-evil :variables
                     spacemacs-evil-collection-allowed-list
                     '(ediff dired))
     command-log
     lsp
     dap
     (markdown :variables markdown-live-preview-engine 'vmd)
     multiple-cursors
     (org :variables
          ;; org-enable-org-journal-support t
          org-enable-roam-support t
          org-enable-roam-server t
          org-enable-github-support t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     neotree
     ;; treemacs
     ;; racket
     semantic
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
                                      psession ;; for helm-locate-library
                                      tldr
                                      el-patch
                                      org-tidy
                                      ;; mic-paren ;; customize paren-face-match
                                      helm-apt
                                      ;; helm-dired-history
                                      geiser ;; installed with guix
                                      geiser-guile ;; installed with guix
                                      magit-popup ;; guix
                                      (director :location (recipe
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
                                      ;; sway
                                      minions ;; minions-minor-mode-menu
                                      ink-mode
                                      ;; dired-git-info ;; disable for debug
                                      fountain-mode
                                      ;; camcorder
                                      org-gtd
                                      ;; org-edna
                                      run-command
                                      symex
                                      ;; niceify-info ;; breaks helm-info
                                      ;; helm-recoll
                                      dyncloze
                                      no-littering
                                      ;; ascii-table
                                      clhs
                                      org-roam
                                      evil-lispy
                                      org-mru-clock
                                      org-page
                                      lisp-extra-font-lock
                                      highlight-indent-guides
                                      elisp-def
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
                                                         :files (:defaults "awk" "demo.org")))
                                      orca
                                      org-link-beautify
                                      ;; buttons
                                      ;; keymap-utils
                                      good-scroll
                                      ;; emacs application framework
                                      ctable
                                      deferred
                                      epc
                                      orca
                                      olivetti
                                      ;; (nov :location local)
                                      (code-spelunk :location local)
                                      (screenshot :location local)
                                      ;; helm-posframe
                                      on-screen
                                      ;; which-key-posframe
                                      highlight-function-calls
                                      sicp
                                      pdfgrep
                                      auto-dim-other-buffers
                                      edebug-x
                                      edebug-inline-result
                                      helm-file-preview
                                      org-ml
                                      ripgrep
                                      helm-rg
                                      ;; beacon
                                      xr ;;     Convert string regexp to rx notation
                                      ;; (mplayer-mode :location (recipe :fetcher github :repo "markhepburn/mplayer-mode"))
                                      ;; (justify-kp :location (recipe :fetcher github :repo "Fuco1/justify-kp"))
                                      (evil-motion-trainer :location (recipe :fetcher github :repo "martinbaillie/evil-motion-trainer"))
                                      keyfreq
                                      epkg
                                      scrollkeeper
                                      org-web-tools
                                      ;; org-noter
                                      org-pdftools
                                      ;; org-noter-pdftools
                                      edit-indirect
                                      mpv
                                      yasnippet-classic-snippets
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '(
                                  ;; linkd
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
   dotspacemacs-install-packages 'used-but-keep-unused))

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
   dotspacemacs-pretty-docs nil

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


  ;; The default is 800 kilobytes.  Measured in bytes.
  (setq gc-cons-threshold (* 50 1000 1000))

  ;; (set-face-attribute 'default nil :height 120)
  ;; Profile emacs startup
  (add-hook 'emacs-startup-hook
            (lambda ()
              (message "*** Emacs loaded in %s with %d garbage collections."
                       (format "%.2f seconds"
                               (float-time
                                (time-subtract after-init-time before-init-time)))
                       gcs-done)))


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
(require 'no-littering)

;; not customizable
(setq pdf-view-mode-hook '(pdf-view-restore-mode pdf-view-midnight-minor-mode))
(setq define-word-offline-dict-directory "/media/chriad/ext4/SOFTWARE/dictionaries_enwiktionary/ding/")
(setq org-capture-template-dir "/home/chriad/.config/emacs/capture-templates/")

;; automatically enable follow mode for search results
(add-hook 'pdf-occur-buffer-mode-hook (lambda () (next-error-follow-minor-mode)))

(defun copy-highlight-annotation-text ()
  (interactive)
        (let* ((a (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer))
               (page (pdf-annot-get a 'page))
               (edges (pdf-annot-get-display-edges a)))
          (with-current-buffer pdf-annot-list-document-buffer
            (pdf-view-goto-page page)
          (setq txt (mapcar
                (lambda (edg)
                  (pdf-info-gettext
                   (pdf-view-current-page)
                   edg
                   pdf-view-selection-style))
                edges))
          (kill-new (mapconcat 'identity txt " ")))
        ))

;; TODO copy annotation text on y
(define-key pdf-annot-list-mode-map (kbd "y") 'copy-highlight-annotation-text)


(put 'chezmoi-diff 'disabled "~~~ Use chezmoi-ediff ~~~")

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))


(setq bibtex-completion-bibliography '("~/.config/bibliographies/fixed-layout.bib")
        ;; bibtex-completion-library-path "~/Papers/"
        ;; bibtex-completion-notes-path "~/Papers/notes.org"
        )

(setq psession-elisp-objects-default-directory (no-littering-expand-var-file-name "elisp-objects/"))
(psession-mode 1)
(psession-autosave-mode 1)
(psession-savehist-mode 1)

;; creates a buffer *quelpa-build-checkout*
  (defun check-emacswiki-updates ()
    (quelpa '(bookmark+ :fetcher wiki
                      :files
                      ("bookmark+.el"
                       "bookmark+-mac.el"
                       "bookmark+-bmu.el"
                       "bookmark+-1.el"
                       "bookmark+-key.el"
                       "bookmark+-lit.el"
                       "bookmark+-doc.el"
                       "bookmark+-chg.el")))
    (quelpa '(narrow-indirect :fetcher wiki))
    (quelpa '(linkd :fetcher wiki))
    )

  (setq paradox-menu-mode-hook '(paradox-refresh-upgradeable-packages check-emacswiki-updates))

(use-package bookmark+
    ;; :defer t
    :config
    ;; (require 'linkd) ;; how to do this?
    (require 'narrow-indirect)
    (setq bmkp-dired-history nil)
    (defun bmkp-list-types ()
      (interactive)
      ;; TODO print in temporary, fileless buffer
      (pp (bmkp-types-alist)))
    (defun helm-documentation-f ()
      (call-interactively 'helm-documentation))
    )

  (require 'org-ref)
  (setq calibredb-ref-default-bibliography (concat (file-name-as-directory calibredb-root-dir) "fixed-layout.bib"))
  ;; (add-to-list 'org-ref-default-bibliography calibredb-ref-default-bibliography)
  ;; (setq org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename)
  ;; ;;; TODO
  ;; (setq backup-directory-alist
  ;;       `((".*" . temporary-file-directory))
  ;;       auto-save-file-name-transforms
  ;;       `((".*" ,temporary-file-directory t)))

  (setq epa-pinentry-mode 'loopback)
  ;; not needed currently
  ;; (load-library "~/.config/emacs/secrets.el.gpg")

  ;; (setq shackle-default-rule '(:frame t)
  ;;       shackle-display-buffer-frame-function 'sway-shackle-display-buffer-frame)

  ;; (sway-socket-tracker-mode)
  ;; (sway-undertaker-mode) ;; If you want to use :dedicate, read below.
  ;; (sway-x-focus-through-sway-mode) ;; Temporary workaround for Sway bug 6216

  (use-package org-tidy
    :ensure t
    :hook
    (org-mode . org-tidy-mode))


  (load "~/.config/emacs/el-patches.el")


  ;; for pylookup
  ;; (setq browse-url-handlers '(("\\`file:" . eaf-open-browser)))

;;;  breaks helm-info
  ;; (add-hook 'Info-selection-hook #'niceify-info)

  (use-package lsp-pyright
    :ensure t
    :hook (python-mode . (lambda ()
                           (require 'lsp-pyright)
                           (lsp))))     ; or lsp-deferred

  ;; (global-wakatime-mode 1)
  ;; (global-emojify-mode)
  ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; required so that yasnippets are loaded

  ;; (load "/usr/share/emacs/site-lisp/elpa-src/yasnippet-snippets-0.20/yasnippet-snippets.el")

  (require 'common-lisp-snippets)

  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook #'elisp-def-mode))



  (push 'elisp-def spacemacs-jump-handlers-emacs-lisp-mode)

  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

  (require 'evil-lispy)
  (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
  ;; (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)


  (add-hook 'pdf-annot-list-mode-hook 'pdf-annot-list-follow-minor-mode)

  (use-package org-roam
    :config
    (setq org-roam-directory "/home/chriad/roam/")
    (setq org-roam-node-display-template "${title:*} ${tags:15}")
    (setq org-roam-completion-everywhere t)
    (setq org-id-link-to-org-use-id t)

    ;; (setq org-roam-completion-system 'helm)
    ;; (setq org-roam-file-completion-tag-position 'append)
    ;; (setq org-roam-index-file "~/roam/index.org")
    ;; (setq org-roam-dailies-directory "journal/")
    (org-roam-db-autosync-mode 1)
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
        ("d" "default" plain "%?"
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
    ("C-c n i" . org-roam-node-insert)
    ("C-c n d" . org-roam-dailies-capture-today)
    ("C-c n g" . org-roam-show-graph)
    ("C-c n r" . org-roam-refile)
    ("C-c n a t" . org-roam-tag-add)
    ("C-c n a a" . org-roam-alias-add)
    ("C-c n a r" . org-roam-ref-add)
    ("C-c n f r" . org-roam-ref-find)
    ("C-c n f f" . org-roam-node-find)
    ("C-c n r" . org-roam-refile)
    ("C-c n R" . org-roam-node-random)
    ("C-c n e" . org-roam-extract-subtree)
    ("C-c n o" . org-id-get-create)
    )

  (require 'org-roam-protocol)

  (require 'dap-python)
  ;; (use-package org-roam-server
  ;;   :ensure t
  ;;   :config
  ;;   (setq org-roam-server-host "127.0.0.1"
  ;;         org-roam-server-port 8080
  ;;         org-roam-server-authenticate nil
  ;;         org-roam-server-export-inline-images t
  ;;         org-roam-server-serve-files nil
  ;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
  ;;         org-roam-server-network-poll t
  ;;         org-roam-server-network-arrows nil
  ;;         org-roam-server-network-label-truncate t
  ;;         org-roam-server-network-label-truncate-length 60
  ;;         org-roam-server-network-label-wrap-length 20))



  ;; (use-package hydra)
  ;; (require 'org-fc-hydra)
  ;; (require 'org-fc-keymap-hint)
  ;; (global-set-key (kbd "C-c f f") 'org-fc-hydra/body)
  ;; (setq org-fc-directories '("~/roam/"))
  ;; (setq org-fc-after-flip-hook '(org-hide-src-block-delimiters))
  ;; (setq org-fc-after-setup-hook nil)
  ;; (setq org-fc-review-history-file (no-littering-expand-var-file-name "org-fc-reviews.tsv"))
  ;; (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-flip-mode
  ;;   (kbd "RET") 'org-fc-review-flip
  ;;   (kbd "n") 'org-fc-review-flip
  ;;   (kbd "s") 'org-fc-review-suspend-card
  ;;   (kbd "q") 'org-fc-review-quit)

  ;; (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-rate-mode
  ;;   (kbd "a") 'org-fc-review-rate-again
  ;;   (kbd "h") 'org-fc-review-rate-hard
  ;;   (kbd "g") 'org-fc-review-rate-good
  ;;   (kbd "e") 'org-fc-review-rate-easy
  ;;   (kbd "s") 'org-fc-review-suspend-card
  ;;   (kbd "q") 'org-fc-review-quit)


    (use-package org-fc
      :defer t
      :config
      (use-package hydra)
      (require 'org-fc-hydra)
      (require 'org-fc-keymap-hint)
      (setq org-fc-directories '("~/roam/"))
      (setq org-fc-after-flip-hook '(org-hide-src-block-delimiters))
      (setq org-fc-after-setup-hook nil)
      (setq org-fc-review-history-file
            (no-littering-expand-var-file-name "org-fc-reviews.tsv"))

      ;; :init (add-hook 'org-mode-hook #'org-starless-mode)

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
      ;; (global-set-key (kbd "C-c f") 'org-fc-hydra/body)
      ;; (global-set-key (kbd "C-c f") 'org-fc-narrow)
      :bind
      ("C-c f" . org-fc-hydra/body)
      ;; ("C-c f" . org-fc-narrow)
      )

  (load "~/.config/emacs/roam-helpers.el")

  ;; (require 'mplayer-mode)


;;;; org-roam-in-buffer-headings

  ;; (setq deft-directory "~/roam/")




  ;; (global-evil-motion-trainer-mode 1)
  ;; (setq evil-motion-trainer-threshold 6)
  ;; (setq evil-motion-trainer-super-annoying-mode t)
  ;; (emt-add-suggestion 'evil-next-line 'evil-avy-goto-char-timer)

  ;;; initial states

  ;; working
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  ;; not working
  ;; (evil-set-initial-state 'Info-mode 'emacs)
  ;; (evil-set-initial-state 'Info-edit-mode 'emacs)
  ;; (evil-set-initial-state 'debugger-mode 'emacs)
  ;; (remove-hook 'paradox-menu-mode-hook 'evil-mode)
  ;; (remove-hook 'paradox-mode-hook 'evil-mode)
  ;; (remove-hook 'package-mode-hook 'evil-mode)
  ;; (remove-hook 'package-menu-mode-hook 'evil-mode)

  ;; (evil-set-initial-state 'backtrace-mode 'emacs)
  (evil-set-initial-state 'org-capture-mode 'insert)
  ;; (evil-set-initial-state 'sly-db-mode 'emacs)

  (add-hook 'org-mode-hook 'org-indent-mode)

  (setq helm-file-preview-preview-only t)
  (setq helm-file-preview-only-when-line-numbers t)

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

  ;; (load "/media/chriad/nebula/spacemacs-fork/private/local/nov/nov.el")
  ;; (add-hook 'nov-mode-hook 'on-screen-mode)
  ;; (evil-set-initial-state 'nov-mode 'emacs)

  (require 'window-purpose)


  ;; (add-hook 'nov-post-html-render-hook 'my-nov-post-html-render-hook)

                                        ; ranger
  ;; (setq ranger-enter-with-minus 'deer)
  ;; (setq ranger-cleanup-on-disable t)
  ;; (setq ranger-cleanup-eagerly t)

  (set-face-attribute 'default nil :family "Source Code Pro")
  (set-face-attribute 'default nil :height 125)

  ;; (use-package edebug-inline-result
  ;;   :ensure t
  ;;   :defer t
  ;;   :custom (edebug-inline-result-backend 'posframe)
  ;;   :hook (edebug-mode . edebug-inline-result-mode))

;;;; org-roam-capture-ref-templates

  ;; (defun zp/org-protocol-insert-selection-dwim (selection)
  ;;   "Insert SELECTION as an org blockquote."
  ;;   (unless (string= selection "")
  ;;     (format "#+begin_quote\n%s\n#+end_quote" selection)))


  ;; (load "/media/chriad/nebula/spacemacs-fork/private/linkd/linkd.el")
  ;; (require 'linkd)

  (good-scroll-mode 1)

  (global-prettify-symbols-mode)

  (add-hook 'dired-mode-hook
            (lambda ()
              (dired-hide-details-mode)))
  (require 'orca)


  (load "~/.config/emacs/capture.el")
  (load "~/.config/emacs/o-keymap.el")
  ;; (load "/media/chriad/nebula/spacemacs-config-files/fork/eaf-config.el")



;;;; org-roam-capture-templates


  ;; (setq org-agenda-files (apply 'append
  ;;                               (mapcar
  ;;                                (lambda (directory)
  ;;                                  (directory-files-recursively
  ;;                                   directory org-agenda-file-regexp))
  ;;                                '("/home/chriad/roam"))))



  ;; (setq org-refile-targets '((nil :maxlevel . 3)
  ;;                            (org-agenda-files :maxlevel . 3)))
  (setq org-outline-path-complete-in-steps nil) ; Refile in a single go
  (setq org-refile-use-outline-path t)          ; Show full paths for refiling


  ;;(setq common-lisp-hyperspec-root "file:///usr/share/doc/hyperspec/")
  ;; http://dnaeon.github.io/starting-with-common-lisp-in-2020/
  ;;(setq common-lisp-hyperspec-symbol-table
  ;;      (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))

  (org-clock-persistence-insinuate)
  (setq spaceline-org-clock-p t)
  (setq org-mru-clock-keep-formatting t)

  (add-hook 'org-mode-hook
            (lambda ()
              (setq prettify-symbols-alist
                    '(("lambda" . ?λ)
                      ("defun" . ?⨐)
                      ("->"     . ?⟶)
                      (":="     . ?≔)
                      ("=>"     . ?⟹)
                      ("#t"     . ?⟙)
                      ("!="     . ?≠)
                      ("#f"     . ?⟘)))))

  (use-package symex
    :config
    (symex-initialize)
    (global-set-key (kbd "s-;") 'symex-mode-interface)
    :custom (symex-modal-backend 'hydra))

  (require 'org-page)
  (setq op/repository-directory "~/blog/")
  (setq op/site-domain "http://chriad.github.io/")
  (setq op/personal-github-link "https://github.com/chriad")
  (setq op/site-main-title "My Blog")
  (setq op/site-sub-title "Spacemacs")

  (setq custom-file "~/.config/emacs/.emacs-custom.el")
  ;; (setq custom-file (no-littering-expand-etc-file-name ".emacs-custom.el")
  (load custom-file)

  (require 'evil-surround)
  (add-hook 'org-mode-hook (lambda ()
                             (push '(?{ . ("{{" . "}}")) evil-surround-pairs-alist))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends '(company-capf company-semantic company-files))
 '(emacs-lisp-mode-hook
   '(eldoc-mode highlight-defined-mode highlight-function-calls-mode eval-sexp-fu-flash-mode eldoc-mode flycheck-package-setup flycheck-elsa-setup elisp-slime-nav-mode auto-compile-mode overseer-enable-mode edebug-x-mode spacemacs//define-elisp-comment-text-object spacemacs//init-company-emacs-lisp-mode company-mode))
 '(enable-local-variables t)
 '(evil-move-cursor-back nil)
 '(evil-org-use-additional-insert t t)
 '(evil-want-Y-yank-to-eol nil)
 ;; '(gist-ask-for-description t)
 ;; '(gist-ask-for-filename t)
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
 '(helm-lisp-fuzzy-completion t)
 '(helm-show-completion-display-function 'helm-display-buffer-popup-frame)
 '(hl-sexp-background-colors '("white smoke" "white")) ;; for package highlight-sexp
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
 '(keyfreq-autosave-mode t)
 '(keyfreq-mode t)
 '(large-file-warning-threshold 100000000)
 '(lispy-completion-method 'helm)
 '(lispy-eval-display-style 'overlay)
 '(lsp-pyright-diagnostic-mode "workspace")
 '(markdown-hide-markup t)
 '(org-M-RET-may-split-line '((default)))
 '(org-blank-before-new-entry '((heading) (plain-list-item)))
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
 '(org-protocol-default-template-key nil)
 '(org-startup-with-inline-images nil t)
 '(org-superstar-headline-bullets-list '(8227 8227 8227 10047))
 '(paradox-automatically-star nil)
 '(paren-sexp-mode t)
 '(pdfgrep-options " -H -n -r ")
 '(persp-use-workgroups t)
 '(racket-browse-url-function 'browse-url-firefox)
 '(racket-documentation-search-location 'local)
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-step 1)
 '(symex-highlight-p t)
 '(treemacs-icons-dired-mode t)
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
