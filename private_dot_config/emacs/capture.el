;;; capture.el --- My personal capture templates.
;;; Code:

(setq org-capture-template-dir "/home/chriad/.config/emacs/capture-templates/")

;; (use-package org-capture
;;   :after org
;;   :hook
;;   (org-capture-mode . evil-insert-state))

;; (defun org-capture-pdf-active-region ()
;;   "Capture the active region of the pdf-view buffer."
;;   (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
;;          (pdf-buf (get-buffer pdf-buf-name)))
;;     (if (buffer-live-p pdf-buf)
;;         (with-current-buffer pdf-buf
;;           (car (pdf-view-active-region-text)))
;;       (user-error "Buffer %S not alive." pdf-buf-name))))

;;   (defun org-capture-pdf-name ()
;;     "Capture the active region of the pdf-view buffer."
;;     (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
;;            (pdf-buf (get-buffer pdf-buf-name)))
;;       (if (buffer-live-p pdf-buf)
;;           (with-current-buffer pdf-buf
;;             (f-no-ext (buffer-name)))
;;         (user-error "Buffer %S not alive." pdf-buf-name))))

;;   (defun org-capture-pdf-path ()
;;     "Capture the active region of the pdf-view buffer."
;;     (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
;;            (pdf-buf (get-buffer pdf-buf-name)))
;;       (if (buffer-live-p pdf-buf)
;;           (with-current-buffer pdf-buf
;;             (eaf-get-path-or-url))
;;         (user-error "Buffer %S not alive." pdf-buf-name))))

;;   (defun org-capture-nov-path ()
;;     "Capture the active region of the pdf-view buffer."
;;     (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
;;            (pdf-buf (get-buffer pdf-buf-name)))
;;       (if (buffer-live-p pdf-buf)
;;           (with-current-buffer pdf-buf
;;             (eval nov-file-name))
;;         (user-error "Buffer %S not alive." pdf-buf-name))))

(require 'helm-org)

(defun my/helm-in-org-buffer (filename &optional preselect)
  "Display and filter headlines in an org file with `helm'.
FILENAME is the org file to filter PRESELECT is the default entry"
  (interactive)
  (helm :sources (helm-org-build-sources
                  (list filename))
        :candidate-number-limit 99999
        :truncate-lines helm-org-truncate-lines
        :preselect preselect
        :buffer "*helm org in buffers*"))

(defun my/org-roam-find-file-name ()
  "Find and return the path to an org-roam file
with the `org-roam-find-file' interface"
  (interactive)
  (save-window-excursion (org-roam-node-find) buffer-file-name))

(defun org-capture-at-point ()
  "Insert an org capture template at point."
  (interactive)
  (org-capture 0))

(setq org-roam-dailies-capture-templates
        '(
          ("d" "default" plain
           "%?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n")
           :unnarrowed t
           :empty-lines-before 1)
          ))

;; DOCT
;; https://github.com/progfolio/doct


      ;; (setq org-capture-templates
      ;;       (doct '(("projects"
      ;;                :keys "p"
      ;;                :children (("cpwq"
      ;;                             :keys "j"
      ;;                             :type plain
      ;;                             :function (function (lambda () (find-file (concat "/home/chriad/roam/" (org-capture-project) ".org"))))
      ;;                             :template ("#+title: %(org-capture-project)"
      ;;                                        "#+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]"
      ;;                                        "#+roam_tags: project %(org-roam-tag-add)"
      ;;                                        "\n"
      ;;                                        ""
      ;;                                        "#+begin_quote\n%?\n#+end_quote"
      ;;                                        "\n"
      ;;                                        "* %(org-capture-project)"
      ;;                                        :unnarrowed t)))
      ;;                ))))

;; =========

;; if DOCT doesnt work use this
(cl-defun my/org-roam-node-find (&optional other-window initial-input filter-fn &key templates)
  "Find and open an Org-roam node by its title or alias.
INITIAL-INPUT is the initial input for the prompt.
FILTER-FN is a function to filter out nodes: it takes an `org-roam-node',
and when nil is returned the node will be filtered out.
If OTHER-WINDOW, visit the NODE in another window.
The TEMPLATES, if provided, override the list of capture templates (see
`org-roam-capture-'.)"
  (interactive current-prefix-arg)
  (let ((node (org-roam-node-read initial-input filter-fn)))
    (if (org-roam-node-file node)
        (progn
          ;; (org-roam-node-visit node other-window)
          (my/helm-in-org-buffer (org-roam-find-file-name))
          )
      (org-roam-capture-
       :node node
       :templates templates
       :props '(:finalize find-file)))))

(defun my/org-roam-find-file (&optional initial-prompt completions filter-fn no-confirm)
  "Find and open an Org-roam file. Move point to the heading 'Notes'.
INITIAL-PROMPT is the initial title prompt.
COMPLETIONS is a list of completions to be used instead of
`org-roam--get-title-path-completions`.
FILTER-FN is the name of a function to apply on the candidates
which takes as its argument an alist of path-completions.  See
`org-roam--get-title-path-completions' for details.
If NO-CONFIRM, assume that the user does not want to modify the initial prompt."
  (interactive)
  ;; (unless org-roam-mode (org-roam-mode))
  (let* ((completions (funcall (or filter-fn #'identity)
                               (or completions (org-roam--get-title-path-completions))))
         (title-with-tags (if no-confirm
                              initial-prompt
                            (org-roam-completion--completing-read "File: " completions
                                                                  :initial-input initial-prompt)))
         (res (cdr (assoc title-with-tags completions)))
         (file-path (plist-get res :path)))
    (if file-path
        (progn
          (org-roam--find-file file-path)
          (goto-char (point-min))
          (outline-next-heading)
          (org-ask-location)
          )

      (let ((org-roam-capture--info `((title . ,title-with-tags)
                                      (slug  . ,(funcall org-roam-title-to-slug-function title-with-tags))))
            (org-roam-capture--context 'title))
        (setq org-roam-capture-additional-template-props (list :finalize 'find-file))
        (org-roam-capture--capture)))))

(defun chriad/fortune-append (&optional interactive file)
  "Append STRING to the fortune FILE.

If INTERACTIVE is non-nil, don't compile the fortune file afterwards."
  (require 'fortune)
  (setq file (expand-file-name
              (substitute-in-file-name (or file fortune-file))))
  (if (file-directory-p file)
      (error "Cannot append fortune to directory %s" file))
  (if interactive ; switch to file and return buffer
      (find-file-other-frame file)
    (find-file-noselect file))
  (let ((fortune-buffer (get-file-buffer file)))

    (set-buffer fortune-buffer)
    (goto-char (point-max))
    (setq fill-column fortune-fill-column)
    (setq auto-fill-inhibit-regexp "^%")
    (turn-on-auto-fill)
    ;; (insert string fortune-end-sep)
    ;; (unless interactive
    ;;   (save-buffer)
    ;;   (if fortune-always-compile
    ;;       (fortune-compile file)))
    ))

;; This can be done by using oldp Notes
;; (defun org-ask-location ()
;;   (let ((hd "Notes"))
;;     (goto-char (point-min))
;;     (outline-next-heading)
;;     (if (re-search-forward
;;          (format org-complex-heading-regexp-format (regexp-quote hd))
;;          nil t)
;;         (goto-char (point-at-bol))
;;       (goto-char (point-max))
;;       (or (bolp) (insert "\n"))
;;       (insert "* " hd "\n")))
;;   (end-of-line))

;; (defun find-pdfs-roam-file-other-widow ()
;;   (interactive)
;;   (find-file-other-window (concat "/home/chriad/roam/"  (org-capture-pdf-name) ".org")))

(setq org-capture-templates
        '(
          ;; ("t" "Todo" entry (file+headline "~/tmp/gtd.org" "Tasks")
          ;;  "* TODO %?\n  %i\n  %a")

          ;; ("i" "Inbox"
          ;;  entry (file (lambda () (org-gtd--path org-gtd-inbox-file-basename) ))
          ;;  "* %?\n%U\n\n  %i"
          ;;  :kill-buffer t)

          ;; ("u" "Todo with link"
          ;;  entry (file (lambda () (org-gtd--path org-gtd-inbox-file-basename) ))
          ;;  "* %?\n%U\n\n  %i\n  %a"
          ;;  :kill-buffer t)

          ;; go directly to a note heading in roam
          ("h" "roam headline" entry
           (function (lambda () (my/helm-in-org-buffer (my/org-roam-find-file-name))))
           "* %?\n%a"
           :kill-buffer t :unnarrowed t)

          ;; ("g" "Imaginary contentful microdialogue"
          ;;  ;; ...?
          ;;  ;; Me: ...
          ;;  ;; ...?
          ;;  ;; Me: ...
          ;;  ;; end
          ;;  entry (file (lambda () (org-gtd--path org-gtd-inbox-file-basename) ))
          ;;  "* %?\n%U\n\n  %i"
          ;;  :kill-buffer t)

          ;; ("a" "webpage region to node" plain          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "%i" :unnarrowed t)

          ; ===

          ("f" "fortune from url" plain
           #'chriad/fortune-append
           "%i\n\n          -- %:link%(eval fortune-end-sep)" :immediate-finish t)

          ;; ("x" "firefox Org Capture Selected template" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
          ;;  "* %?%i\n%u\n%a\n")

          ;; ("y" "firefox Org Capture Unselected template" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
          ;;  "* %?\n%u\n%a\n")

          ;; ("z" "video" plain (file "/home/chriad/Documents/video-urls.txt")
          ;;  "%:link" :immediate-finish t)

          ;; javascript:location.href='org-protocol://capture?template=o&url='
          ;; +encodeURIComponent(location.href)+'&title='
          ;; +encodeURIComponent(document.title)+'&body='
          ;; +encodeURIComponent(window.getSelection())

          ("o" "notes" plain (file "/home/chriad/Documents/notes.org")
           "[[%:link][%i]]" :immediate-finish t :empty-lines 1 :prepend t)

;;           ("l" "org-fc")
;;           ("lx" "input" entry (file+headline "/home/chriad/Documents/org-fc.org" "org-fc")
;;            "* %^{question}?\n%^{answer}\n%a" :immediate-finish t)

;;           ("ll" "code" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
;;            "* %a
;; #+begin_src %?
;; %i
;; #+end_src\n")



          ("m" "maps")
          ("mf" "_ _"
           table-line
           (file "~/Documents/vocabulary-map.org")
           "|%^{stimulus}|%^{response}|"
           :table-line-pos "I+1"
           :immediate-finish t)

          ("ms" "_ r"
           table-line
           (file "~/Documents/vocabulary-map.org")
           "|%^{stimulus}|%i|"
           :table-line-pos "I+1"
           :immediate-finish t)

          ("mr" "s _"
           table-line
           (file "~/Documents/vocabulary-map.org")
           "|%i|%^{response}|"
           :table-line-pos "I+1"
           :immediate-finish t)


          ("c" "~/Documents/_")

          ("cp" "Code" entry (file "/home/chriad/Documents/code-review.org")
           (file "~/.config/emacs/capture-templates/code-snippet.capture"))

          ("cw" "low-freq-words-list"
           plain
           (file "~/Documents/specialwords.txt")
           "%^{word}"
           :immediate-finish t)

          ("cc" "curious-words-list"
           plain
           (file "~/Documents/curious-words.org")
           "%^{word}"
           :immediate-finish t)

          ("cx" "analogies"
           plain
           (file "~/Documents/analogies.org")
           "%^{analogy}"
           :immediate-finish t)

          ("ca" "antipatterns"
           table-line
           (file "~/Documents/antipatterns.org")
           "|%^{antipattern}|%^{solution}|"
           :table-line-pos "I+1"
           :immediate-finish t)

          ("cf" "functions"
           table-line
           (file "~/Documents/wiki/funcs.org")
           "|%^{function}|%^{description}|%^{interactive?|y|n}|%a|"
           :table-line-pos "I+1"
           :immediate-finish t)

          ("cq" "Questions"
           plain
           (file "~/Documents/q-and-a.txt")
           "%^{Question}?"
           :immediate-finish t)
          ))

;; capture directly without goin through dispatcher
(define-key global-map (kbd "C-c x")
            (lambda () (interactive) (org-roam-capture nil "t")))


(setq org-roam-capture-templates
      '(
        ("d" "default" plain "%?"
         :target (file+head "${slug}.org"
                            "#+title: ${title}")
         :unnarrowed t)

        ("c" "context" plain "link: %A\nregion: %i\ncomment: %?"
         :target (file+head "${slug}.org"
                            "#+title: ${title}")
         :unnarrowed t))
      )


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

;; (add-hook 'org-capture-mode-hook 'evil-insert-state)
;; (add-hook 'org-capture-mode-hook 'evil-hybrid-state)

(provide 'capture)

;;; capture.el ends here
