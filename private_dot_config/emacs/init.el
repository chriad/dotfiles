;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
                                           "/media/chriad/nebula/spacemacs-fork/private"
                                           )

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
     rust
     (elfeed :variables rmh-elfeed-org-files (list (concat "/home/chriad/.config/emacs/" "elfeed.org")))
     ;; << private layers
     bookmark+
     helm-additional
     elisp-additional
     org-additional
     ;; >> private layers
     javascript
     pass
     (spacemacs-layouts :variables
                        spacemacs-layouts-restrict-spc-tab t
                        persp-autokill-buffer-on-remove 'kill-weak)
     ;; sml

     toc
     ;; nixos
     (calibre :variables
              calibredb-root-dir "/media/chriad/E/BAYES2")
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
     better-defaults
     common-lisp
     (ipython-notebook :variables ein-backend 'jupyter)
     emacs-lisp
     (wakatime :variables
               ;; use the actual wakatime path
               wakatime-cli-path "/usr/local/bin/wakatime")
     git
     ;; pdf
     ;; eaf
     helm
     command-log
     lsp
     (python :variables python-backend 'lsp python-lsp-server 'pyright)
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
     ;; version-control
     neotree
     ;; treemacs
     racket
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
                                      ;; mic-paren ;; customize paren-face-match
                                      ;; m-buffer
                                      minions
                                      camcorder
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
                                      djvu
                                      org-roam-server
                                      evil-lispy
                                      org-mru-clock
                                      org-page
                                      lisp-extra-font-lock
                                      highlight-indent-guides
                                      elisp-def
                                      sr-speedbar
                                      lispy
                                      achievements
                                      doct
                                      common-lisp-snippets
                                      sly
                                      jupyter
                                      (org-fc
                                       :location (recipe :fetcher git
                                                         :url "https://git.sr.ht/~l3kn/org-fc"
                                                         :files (:defaults "awk" "demo.org")))
                                      orca
                                      org-link-beautify
                                      (org-link-minor-mode :location (recipe :fetcher github :repo "seanohalpin/org-link-minor-mode"))
                                      ;; buttons
                                      ;; keymap-utils
                                      good-scroll
                                      ;; emacs application framework
                                      ctable
                                      deferred
                                      epc
                                      orca
                                      olivetti
                                      (nov :location local)
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
                                      (justify-kp :location (recipe :fetcher github :repo "Fuco1/justify-kp"))
                                      (evil-motion-trainer :location (recipe :fetcher github :repo "martinbaillie/evil-motion-trainer"))
                                      keyfreq
                                      epkg
                                      scrollkeeper
                                      org-web-tools
                                      ;; org-noter
                                      ;; org-pdftools
                                      ;; org-noter-pdftools
                                      edit-indirect
                                      mpv
                                      yasnippet-classic-snippets
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
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

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode

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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
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
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

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
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

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
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

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
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."


  (setq org-roam-v2-ack t)
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


  (setq epa-pinentry-mode 'loopback)

  (load-library "~/.config/emacs/secrets.el.gpg")

  (use-package org-gtd
    :after org
    ;; :pin melpa-stable ;; or :pin melpa as you prefer
    :demand t ;; without this, the package won't be loaded, so org-agenda won't be configured
    :custom
    ;; where org-gtd will put its files. This value is also the default one.
    (org-gtd-directory "/home/chriad/gtd/")
    ;; package: https://github.com/Malabarba/org-agenda-property
    ;; this is so you can see who an item was delegated to in the agenda
    (org-agenda-property-list '("DELEGATED_TO"))
    ;; I think this makes the agenda easier to read
    (org-agenda-property-position 'next-line)
    ;; package: https://www.nongnu.org/org-edna-el/
    ;; org-edna is used to make sure that when a project task gets DONE,
    ;; the next TODO is automatically changed to NEXT.
    (org-edna-use-inheritance t)
    :config
    (org-edna-load)
    :bind
    (("C-c d c" . org-gtd-capture)     ;; add item to inbox
     ("C-c d a" . org-agenda-list)     ;; see what's on your plate today
     ("C-c d p" . org-gtd-process-inbox) ;; process entire inbox
     ("C-c d n" . org-gtd-show-all-next) ;; see all NEXT items
     ("C-c d s" . org-gtd-show-stuck-projects)) ;; see projects that don't have a NEXT item
    :init
    (bind-key "C-c c" 'org-gtd-clarify-finalize)) ;; the keybinding to hit when you're done editing an item in the processing phase

  (use-package org-agenda
    :ensure nil ;; this is how you tell use-package to manage a sub-package
    :after org-gtd ;; because we need to add the org-gtd directory to the agenda files
    :custom
    ;; use as-is if you don't have an existing org-agenda setup
    ;; otherwise push the directory to the existing list
    (org-agenda-files `(,org-gtd-directory))
    ;; a useful view to see what can be accomplished today
    (org-agenda-custom-commands '(("g" "Scheduled today and all NEXT items" ((agenda "" ((org-agenda-span 1))) (todo "NEXT"))))))

  ;; for pylookup
  (setq browse-url-handlers '(("\\`file:" . eaf-open-browser)))

;;;  breaks helm-info
  ;; (add-hook 'Info-selection-hook #'niceify-info)

  (use-package lsp-pyright
    :ensure t
    :hook (python-mode . (lambda ()
                           (require 'lsp-pyright)
                           (lsp))))     ; or lsp-deferred

  (global-wakatime-mode 1)
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

  (defun abs--quick-capture ()
    ;; redefine the function that splits the frame upon org-capture
    (defun abs--org-capture-place-template-dont-delete-windows (oldfun args)
      (cl-letf (((symbol-function 'org-switch-to-buffer-other-window) 'switch-to-buffer))
        (apply oldfun args)))

    ;; run-once hook to close window after capture
    (defun abs--delete-frame-after-capture ()
      (delete-frame)
      (remove-hook 'org-capture-after-finalize-hook 'abs--delete-frame-after-capture)
      )

    ;; set frame title
    (set-frame-name "emacs org capture")
    (add-hook 'org-capture-after-finalize-hook 'abs--delete-frame-after-capture)
    (abs--org-capture-place-template-dont-delete-windows 'org-capture nil)
    )

  (use-package org-roam
    ;; :after org
    ;; :hook (org-mode . org-roam-mode)
    :custom
    ;; (org-roam-directory "/home/chriad/roam/")
    (org-roam-dailies-directory "/home/chriad/roam/journal")
    :bind
    ("C-c n i" . org-roam-node-insert)
    ("C-c n d" . org-roam-dailies-capture-today)
    ("C-c n g" . org-roam-show-graph)
    ("C-c n a t" . org-roam-tag-add)
    ("C-c n a a" . org-roam-alias-add)
    ("C-c n a r" . org-roam-ref-add)
    ("C-c n f r" . org-roam-ref-find)
    ("C-c n f n" . org-roam-node-find)
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



  (use-package hydra)
  (require 'org-fc-hydra)
  (require 'org-fc-keymap-hint)
  (global-set-key (kbd "C-c f") 'org-fc-hydra/body)
  (setq org-fc-directories '("~/roam/"))
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


  ;; org-noter
  ;; (use-package org-noter
  ;;   :config
  ;;   (require 'org-noter-pdftools))

  ;; (use-package org-pdftools
  ;;   :hook (org-mode . org-pdftools-setup-link))

;;   (use-package org-noter-pdftools
;;     :after org-noter
;;     :config
;;     ;; Add a function to ensure precise note is inserted
;;     (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
;;       (interactive "P")
;;       (org-noter--with-valid-session
;;        (let ((org-noter-insert-note-no-questions (if toggle-no-questions
;;                                                      (not org-noter-insert-note-no-questions)
;;                                                    org-noter-insert-note-no-questions))
;;              (org-pdftools-use-isearch-link t)
;;              (org-pdftools-use-freestyle-annot t))
;;          (org-noter-insert-note (org-noter--get-precise-info)))))

;;     ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
;;     (defun org-noter-set-start-location (&optional arg)
;;       "When opening a session with this document, go to the current location.
;; With a prefix ARG, remove start location."
;;       (interactive "P")
;;       (org-noter--with-valid-session
;;        (let ((inhibit-read-only t)
;;              (ast (org-noter--parse-root))
;;              (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
;;          (with-current-buffer (org-noter--session-notes-buffer session)
;;            (org-with-wide-buffer
;;             (goto-char (org-element-property :begin ast))
;;             (if arg
;;                 (org-entry-delete nil org-noter-property-note-location)
;;               (org-entry-put nil org-noter-property-note-location
;;                              (org-noter--pretty-print-location location))))))))
;;     (with-eval-after-load 'pdf-annot
;;       (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

  ;; ;; https://stackoverflow.com/questions/17478260/completely-hide-the-properties-drawer-in-org-mode
  ;; (defun org-cycle-hide-drawers (state)
  ;;   "Re-hide all drawers after a visibility state change."
  ;;   (when (and (derived-mode-p 'org-mode)
  ;;              (not (memq state '(overview folded contents))))
  ;;     (save-excursion
  ;;       (let* ((globalp (memq state '(contents all)))
  ;;              (beg (if globalp
  ;;                     (point-min)
  ;;                     (point)))
  ;;              (end (if globalp
  ;;                     (point-max)
  ;;                     (if (eq state 'children)
  ;;                       (save-excursion
  ;;                         (outline-next-heading)
  ;;                         (point))
  ;;                       (org-end-of-subtree t)))))
  ;;         (goto-char beg)
  ;;         (while (re-search-forward org-drawer-regexp end t)
  ;;           (save-excursion
  ;;             (beginning-of-line 1)
  ;;             (when (looking-at org-drawer-regexp)
  ;;               (let* ((start (1- (match-beginning 0)))
  ;;                      (limit
  ;;                        (save-excursion
  ;;                          (outline-next-heading)
  ;;                            (point)))
  ;;                      (msg (format
  ;;                             (concat
  ;;                               "org-cycle-hide-drawers:  "
  ;;                               "`:END:`"
  ;;                               " line missing at position %s")
  ;;                             (1+ start))))
  ;;                 (if (re-search-forward "^[ \t]*:END:" limit t)
  ;;                   (outline-flag-region start (point-at-eol) t)
  ;;                   (user-error msg))))))))))

  (require 'org-protocol)


;;;; org-pdf-capture-active-region

;;;; org-capture-templates

;;;; org-capture-helpers

  ;; (defun current-project-folder-name ()
  ;;   (f-filename (projectile-project-root)))

;;;; org-roam-dailies-capture-templates

  (load "~/.config/emacs/roam-helpers.el")

  ;; (require 'mplayer-mode)


;;;; org-roam-in-buffer-headings

  ;; (add-to-list 'load-path "/media/chriad/nebula/spacemacs-fork/private/bookmark-plus/")
  ;; (require 'bookmark+)
  ;; (setq deft-directory "~/roam/")


  ;; ;; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
  ;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
  ;; (add-hook 'window-setup-hook 'toggle-frame-fullscreen t)



  ;; (org-add-link-type "mpv" #'mpv-play)
  ;; (defun org-mpv-complete-link (&optional arg)
  ;;   (replace-regexp-in-string
  ;;    "file:" "mpv:"
  ;;    (org-file-complete-link arg)
  ;;    t t))
  ;; (add-hook 'org-open-at-point-functions #'mpv-seek-to-position-at-point)


  ;; (global-evil-motion-trainer-mode 1)
  ;; (setq evil-motion-trainer-threshold 6)
  ;; (setq evil-motion-trainer-super-annoying-mode t)
  ;; (emt-add-suggestion 'evil-next-line 'evil-avy-goto-char-timer)



  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; (use-package beacon
  ;;   :ensure t
  ;;   :config
  ;;   (beacon-mode 1))


  (evil-set-initial-state 'debugger-mode 'emacs)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-set-initial-state 'backtrace-mode 'emacs)
  (evil-set-initial-state 'org-capture-mode 'insert)
  (evil-set-initial-state 'ediff-mode 'emacs)
  (evil-set-initial-state 'sly-db-mode 'emacs)

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



  (require 'pdfgrep)
  (pdfgrep-mode)

  (setq helm-dash-browser-func 'eww)
  (setq dash-docs-browser-func 'eww)

  (add-hook 'emacs-lisp-mode-hook 'highlight-function-calls-mode)
  ;; (add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode)

  ;; relative paths to pdf files
  ;; (defun my/path-generator (bfn)
  ;;   (s-concat "./" (f-filename bfn)))
  ;; ;; (helm-posframe-enable)

  ;; (defun my/org-pdftools-get-desc-default (file page &optional text)
  ;;   (concat "𝕡-" (file-name-sans-extension file)))

  ;; (load "/media/chriad/nebula/spacemacs-fork/private/local/nov/nov.el")
  ;; (add-hook 'nov-mode-hook 'on-screen-mode)
  ;; (evil-set-initial-state 'nov-mode 'emacs)

  (require 'window-purpose)

  ;; (require 'nov)
  ;; (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

  ;; (defun my-nov-font-setup ()
  ;;   (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
  ;;                            :height 1.6))
  ;; (add-hook 'nov-mode-hook 'my-nov-font-setup)
  ;; (setq nov-text-width 80)

  ;; (setq nov-text-width t)
  ;; (setq visual-fill-column-center-text t)
  ;; (add-hook 'nov-mode-hook 'visual-line-mode)
  ;; (add-hook 'nov-mode-hook 'visual-fill-column-mode)

;;; has bog

  ;; (require 'justify-kp)
  ;; (setq nov-text-width t)

  ;; (defun my-nov-window-configuration-change-hook ()
  ;;   (my-nov-post-html-render-hook)
  ;;   (remove-hook 'window-configuration-change-hook
  ;;                'my-nov-window-configuration-change-hook
  ;;                t))

  ;; (defun my-nov-post-html-render-hook ()
  ;;   (if (get-buffer-window)
  ;;       (let ((max-width (pj-line-width))
  ;;             buffer-read-only)
  ;;         (save-excursion
  ;;           (goto-char (point-min))
  ;;           (while (not (eobp))
  ;;             (when (not (looking-at "^[[:space:]]*$"))
  ;;               (goto-char (line-end-position))
  ;;               (when (> (shr-pixel-column) max-width)
  ;;                 (goto-char (line-beginning-position))
  ;;                 (pj-justify)))
  ;;             (forward-line 1))))
  ;;     (add-hook 'window-configuration-change-hook
  ;;               'my-nov-window-configuration-change-hook
  ;;               nil t)))

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



  (setq org-refile-targets '((nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 3)))
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
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(bmkp-last-as-first-bookmark-file "/media/chriad/nebula/spacemacs-fork/.cache/bookmarks")
 '(company-backends '(company-capf company-semantic company-files))
 '(dap-python-executable "/media/chriad/nebula/anaconda3/bin/python")
 '(default-frame-alist
    '((fullscreen . fullboth)
      (buffer-predicate . spacemacs/useful-buffer-p)))
 '(dired-auto-revert-buffer 'dired-directory-changed-p)
 '(dired-listing-switches "-alh")
 '(eaf-config-location "/media/chriad/nebula/spacemacs-config-files/fork/eaf/")
 '(eaf-find-file-ext-blacklist '("epub"))
 '(eaf-markdown-extension-list '("md" "org"))
 '(eaf-org-override-pdf-links-store t)
 '(eaf-pdf-extension-list '("pdf" "xps" "oxps" "cbz" "fb2" "fbz"))
 '(eaf-pdf-viewer-keybinding
   '(("j" . "scroll_up")
     ("<down>" . "scroll_up")
     ("C-n" . "scroll_up")
     ("k" . "scroll_down")
     ("<up>" . "scroll_down")
     ("C-p" . "scroll_down")
     ("M-h" . "scroll_left")
     ("<left>" . "scroll_left")
     ("C-b" . "scroll_left")
     ("l" . "scroll_right")
     ("<right>" . "scroll_right")
     ("C-f" . "scroll_right")
     ("u" . "scroll_up_page")
     ("b" . "scroll_down_page")
     ("C-v" . "scroll_up_page")
     ("M-v" . "scroll_down_page")
     ("t" . "toggle_read_mode")
     ("0" . "zoom_reset")
     ("=" . "zoom_in")
     ("-" . "zoom_out")
     ("g" . "scroll_to_begin")
     ("G" . "scroll_to_end")
     ("p" . "jump_to_page")
     ("P" . "jump_to_percent")
     ("[" . "save_current_pos")
     ("]" . "jump_to_saved_pos")
     ("i" . "toggle_inverted_mode")
     ("m" . "toggle_mark_link")
     ("f" . "jump_to_link")
     ("y" . "copy_select")
     ("C-s" . "search_text_forward")
     ("C-r" . "search_text_backward")
     ("x" . "close_buffer")
     ("C-<right>" . "rotate_clockwise")
     ("C-<left>" . "rotate_counterclockwise")
     ("h" . "add_annot_highlight")
     ("M-u" . "add_annot_underline")
     ("M-s" . "add_annot_squiggly")
     ("M-d" . "add_annot_strikeout_or_delete_annot")
     ("M-e" . "add_annot_text_or_edit_annot")
     ("M-p" . "toggle_presentation_mode")
     ("J" . "select_left_tab")
     ("K" . "select_right_tab")
     ("o" . "eaf-pdf-outline")))
 '(emacs-lisp-mode-hook
   '(eldoc-mode highlight-defined-mode highlight-function-calls-mode eval-sexp-fu-flash-mode eldoc-mode flycheck-package-setup flycheck-elsa-setup elisp-slime-nav-mode auto-compile-mode overseer-enable-mode edebug-x-mode spacemacs//define-elisp-comment-text-object multi-line-emacs-lisp-mode-hook spacemacs//init-company-emacs-lisp-mode company-mode))
 '(enable-local-variables t)
 '(evil-insert-state-modes
   '(org-capture-mode eaf-edit-mode comint-mode erc-mode eshell-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode term-mode wdired-mode))
 '(evil-move-cursor-back nil)
 '(evil-org-use-additional-insert t)
 '(evil-want-Y-yank-to-eol nil)
 '(fortune-dir "~/fortunes")
 '(fortune-file "~/fortunes/fortunes")
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
 '(helm-lisp-fuzzy-completion t)
 '(helm-show-completion-display-function 'helm-display-buffer-popup-frame)
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
 '(org-noter-always-create-frame t)
 '(org-noter-auto-save-last-location t)
 '(org-noter-default-notes-file-names nil)
 '(org-noter-notes-search-path nil)
 '(org-noter-notes-window-behavior '(start scroll))
 '(org-noter-pdftools-free-pointer-color "#ffe4b5")
 '(org-noter-pdftools-free-pointer-icon "Insert")
 '(org-noter-pdftools-free-pointer-opacity 0.5)
 '(org-noter-pdftools-markup-pointer-opacity 0.5)
 '(org-noter-pdftools-use-pdftools-link-location t)
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
 '(org-roam-index-file "~/roam/index.org")
 '(org-startup-with-inline-images nil)
 '(org-superstar-headline-bullets-list '(8227 8227 8227 10047))
 '(org-superstar-prettify-item-bullets t)
 '(org-superstar-remove-leading-stars nil)
 '(package-selected-packages
   '(org-starless gist helm-firefox camcorder names toml-mode ron-mode racer rust-mode flycheck-rust cargo password-store-otp helm-pass password-store helm-bibtexkey helm-bibtex bibtex-completion biblio parsebib biblio-core symex helm-atoms run-command niceify-info elx helm-recoll comment-or-uncomment-sexp clhs ascii-table helm-emmet dyncloze dired-git-info nix-mode helm-nixos-options company-nixos-options nixos-options lsp-focus tiny tern npm-mode nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags counsel-gtags no-littering howdoyou poker org-variable-pitch org-roam evil-lispy org-mru-clock esup monkeytype speed-type typit org-page git mustache lisp-extra-font-lock highlight-indent-guides elisp-def sr-speedbar ein polymode anaphora websocket lispy achievements org-fc doct justify-kp dash-functional buttons keymap-utils dired-open dired-hacks-utils olivetti nov on-screen ob-sml sml-mode mic-paren helm-posframe stickyfunc-enhance srefactor highlight-defined sicp pdfgrep edebug-x helm-file-preview csv-mode org-roam-server ox-gfm scrollkeeper beacon lsp-ui lsp-treemacs lsp-origami origami helm-lsp lsp-mode flycheck-pos-tip pos-tip web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode simple-httpd helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data add-node-modules-path evil-motion-trainer edit-indirect helpful elisp-refs mmm-mode markdown-toc gh-md yaml-mode xterm-color vterm terminal-here shell-pop multi-term eshell-z eshell-prompt-extras esh-help pdf-tools tablist keycast command-log-mode orgit org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-journal org-download org-cliplink org-brain htmlize helm-org-rifle gnuplot evil-org wakatime-mode yasnippet-snippets unfill treemacs-magit smeargle mwim magit-svn magit-section magit-gitflow magit-popup helm-gitignore helm-git-grep helm-company helm-c-yasnippet gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy forge markdown-mode magit ghub closql emacsql-sqlite emacsql treepy git-commit with-editor transient company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs cfrs ht pfuture posframe toc-org symon symbol-overlay string-inflection spaceline-all-the-icons memoize all-the-icons spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless multi-line shut-up move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection annalist evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils pkg-info epl elisp-slime-nav editorconfig dumb-jump s dired-quick-sort devdocs define-word dash column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el hydra lv hybrid-mode font-lock+ evil goto-chg dotenv-mode diminish bind-map bind-key async))
 '(paradox-automatically-star nil)
 '(paren-sexp-mode t)
 '(pdf-outline-display-labels t)
 '(pdf-view-display-size 'fit-height)
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(pdfgrep-options " -H -n -r ")
 '(persp-use-workgroups t)
 '(projectile-project-search-path '("/home/chriad" "/home/chriad/emacs-projects"))
 '(racket-browse-url-function 'browse-url-firefox)
 '(racket-documentation-search-location ''local)
 '(safe-local-variable-values
   '((elisp-lint-indent-specs
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
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-babel-tangle))
           nil t)
     (olivetti-mode . t)
     (git-commit-major-mode . git-commit-emacs-lisp-mode)
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (global-visual-line-mode . t)
     (Lowercase . T)
     (Readtable . ZL)
     (Source-Optimizations . T)
     (Base . 8)
     (Package . user)
     (akirak/avoid-nameless-mode . t)
     (whitespace-cleanup-mode-only-if-initially-clean)
     (Package . LISP-INTERNALS)
     (Package . HARDWARE)
     (Package ktv USE
              (K prims))
     (Readtable . CL)
     (Base . 10)
     (Package . NEW-MATH)
     (eval org-cycle-hide-drawers 'all)))
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-step 1)
 '(symex-highlight-p t)
 '(treemacs-icons-dired-mode t)
 '(wakatime-python-bin nil)
 '(yas-snippet-dirs
   '("/media/chriad/nebula/spacemacs-fork/private/snippets/" "/usr/share/yasnippet-snippets" "/media/chriad/nebula/spacemacs-fork/layers/+completion/auto-completion/local/snippets" "/media/chriad/nebula/spacemacs-fork/elpa/28.0/develop/common-lisp-snippets-20180226.1523/snippets")))
)
