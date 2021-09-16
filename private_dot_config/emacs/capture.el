;;; capture.el --- My personal capture templates.
;;; Code:

(use-package org-capture
  :after org
  :hook
  (org-capture-mode . evil-insert-state))



(defun org-capture-pdf-active-region ()
  "Capture the active region of the pdf-view buffer."
  (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
         (pdf-buf (get-buffer pdf-buf-name)))
    (if (buffer-live-p pdf-buf)
        (with-current-buffer pdf-buf
          (car (pdf-view-active-region-text)))
      (user-error "Buffer %S not alive." pdf-buf-name))))

  (defun org-capture-pdf-name ()
    "Capture the active region of the pdf-view buffer."
    (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
           (pdf-buf (get-buffer pdf-buf-name)))
      (if (buffer-live-p pdf-buf)
          (with-current-buffer pdf-buf
            (f-no-ext (buffer-name)))
        (user-error "Buffer %S not alive." pdf-buf-name))))

  (defun org-capture-pdf-path ()
    "Capture the active region of the pdf-view buffer."
    (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
           (pdf-buf (get-buffer pdf-buf-name)))
      (if (buffer-live-p pdf-buf)
          (with-current-buffer pdf-buf
            (eaf-get-path-or-url))
        (user-error "Buffer %S not alive." pdf-buf-name))))


  (defun org-capture-nov-path ()
    "Capture the active region of the pdf-view buffer."
    (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
           (pdf-buf (get-buffer pdf-buf-name)))
      (if (buffer-live-p pdf-buf)
          (with-current-buffer pdf-buf
            (eval nov-file-name))
        (user-error "Buffer %S not alive." pdf-buf-name))))


  (defun org-capture-project ()
    "Capture the active region of the pdf-view buffer."
    (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
           (pdf-buf (get-buffer pdf-buf-name)))
      (if (buffer-live-p pdf-buf)
          (with-current-buffer pdf-buf
            (f-filename (projectile-project-root)))
        (user-error "Buffer %S not alive." pdf-buf-name))))

  (defun org-capture-project-root ()
    "Capture the active region of the pdf-view buffer."
    (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
           (pdf-buf (get-buffer pdf-buf-name)))
      (if (buffer-live-p pdf-buf)
          (with-current-buffer pdf-buf
            (projectile-project-root))
        (user-error "Buffer %S not alive." pdf-buf-name))))




;;; Commentary:
;; 

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

(defun org-roam-find-file-name ()
  "Find and return the path to an org-roam file
with the `org-roam-find-file' interface"
  (interactive)
  (save-window-excursion (org-roam-node-find) buffer-file-name))

;; (defun org-capture-at-point ()
;;   "Insert an org capture template at point."
;;   (interactive)
;;   (org-capture 0))


(setq org-roam-dailies-capture-templates
        '(("d" "eaf capture new pdf ressource with *" entry "* %? ⸤%a⸥"
           :head "#+title: %(org-capture-pdf-name)\n"
           :file-name "/home/chriad/roam/%(org-capture-pdf-name).org"
           :if-new (file+head "/home/chriad/roam/%(org-capture-pdf-name).org" "#+title: %(org-capture-pdf-name)\n#+roam_key: [[file:%(org-capture-pdf-path)][%(org-capture-pdf-name)]]\n\n")
           :unnarrowed t)

          ("e" "eaf capture new pdf ressource with definition from clipboard" plain
           #'org-roam-capture--get-point
           ""
           :file-name "/home/chriad/roam/%(org-capture-pdf-name)"
           :head "#+title: %(org-capture-pdf-name)\n#+roam_key: [[file:%(org-capture-pdf-path)][%(org-capture-pdf-name)]]\n#+roam_tags: %(org-roam-tag-add)\n\n#+begin_quote\n%c\n#+end_quote\n-> %a\n\n" :unnarrowed t)

;; precondition: must have yanked text from pdf-viwer
          ;; rationale: I have so many books, for each I need a good quote to remember it!
          ("n" "eaf capture new nov ressource" entry
           #'org-roam-capture--get-point
           "* %? %a"
           :file-name "/home/chriad/roam/%(org-capture-pdf-name)"
           :head "#+title: %(org-capture-pdf-name)\n#+roam_key: [[file:%(org-capture-nov-path)][%(org-capture-pdf-name)]]\n#+roam_tags: %(org-roam-tag-add)\n\n"
           :unnarrowed t)


          ;; ("p" "capture current project write quote" entry #'org-roam-capture--get-point "* %(org-capture-project)"
          ;;  :file-name "/home/chriad/roam/%(org-capture-project)"
          ;;  :head "#+title: %(org-capture-project)\n#+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]\n#+roam_tags: project %(org-roam-tag-add)\n\n#+begin_quote\n%(org-capture-at-point)\n#+end_quote\n\n" :unnarrowed t)


          ;; ("p" "capture current project write quote" entry #'org-roam-capture--get-point "* %(org-capture-project)"
          ;;  :file-name "/home/chriad/roam/%(org-capture-project)"
          ;;  :head "#+title: %(org-capture-project)\n#+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]\n#+roam_tags: project %(org-roam-tag-add)\n\n#+begin_quote\n%^{PROMPT}\n#+end_quote\n\n" :unnarrowed t)


          ("f" "capture current project with quote from region" entry
           #'org-roam-capture--get-point
           "* %?"
           :file-name "/home/chriad/roam/%(org-capture-project)"
           :head "#+title: %(org-capture-project)\n#+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]\n#+roam_tags: project %(org-roam-tag-add)\n\n#+begin_quote\n%i\n#+end_quote\n→ %a\n\n" :unnarrowed t)


          ;; donsn't work
          ;; ("x" "plain to Notes" plain #'org-roam-capture--get-point "- %? | %a" :file-name "${slug}" :head "#+title: ${title}\n#+roam_key: %a\n\n" :olp ("Notes"))

          ;; ("o" "Buy"
          ;;  plain (function (lambda () " "))  "%?")
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



(defun org-ask-location ()
  (let ((hd "Notes"))
    (goto-char (point-min))
    (outline-next-heading)
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd))
         nil t)
        (goto-char (point-at-bol))
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n")))
  (end-of-line))

;; ("p" "capture project write quote" plain
;;  (function (lambda () (find-file (concat "/home/chriad/roam/" (org-capture-project) ".org"))))
;;  "#+title: %(org-capture-project)
;;   #+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]
;;   #+roam_tags: project %(org-roam-tag-add)\n
;;   #+begin_quote\n%?\n#+end_quote

;;   * %(org-capture-project)" :unnarrowed t)
;; (defun roam-find-pdf ()
;;   (find-file (concat "/home/chriad/roam/" (org-capture-pdf-name) ".org"))
;;   )

(defun find-pdfs-roam-file-other-widow ()
  (interactive)
  (find-file-other-window (concat "/home/chriad/roam/"  (org-capture-pdf-name) ".org")))

(setq org-capture-templates
        '(
          ;; ("p" "register projects")
          ;; ("pq" "capture project write quote" plain ; :floppy_disk: -> :link: :books: -> :writing-hand: :scroll: ->
          ;;  (function (lambda () (find-file (concat "/home/chriad/roam/" (org-capture-project) ".org"))))
          ;;  "#+title: %(org-capture-project)\n#+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]\n#+roam_tags: project %(org-roam-tag-add)\n \n#+begin_quote\n%?\n#+end_quote\n\n* Inbox" :unnarrowed t :empty-lines 1)

          ;; ("py" "capture project region quote" plain ; :floppy_disk: -> :key: :books: -> :link: :file-folder: -> :crayon: :scroll: -> ·
          ;;  (function (lambda () (find-file (concat "/home/chriad/roam/" (org-capture-project) ".org"))))
          ;;  "#+title: %(org-capture-project)\n#+roam_key: [[file:%(org-capture-project-root)][%(org-capture-project)]]\n#+roam_tags: \"project\" %(org-roam-tag-add)\n \n#+begin_quote\n%i\n#+end_quote\n->%a\n\n* Inbox" :unnarrowed t :empty-lines 1)
          ("i" "Inbox"
           entry (file (lambda () (org-gtd--path org-gtd-inbox-file-basename) ))
           "* %?\n%U\n\n  %i"
           :kill-buffer t)
          ("u" "Todo with link"
           entry (file (lambda () (org-gtd--path org-gtd-inbox-file-basename) ))
           "* %?\n%U\n\n  %i\n  %a"
           :kill-buffer t)

          ("h" "roam headline" entry
           (function (lambda () (my/helm-in-org-buffer (org-roam-find-file-name))))
           "* %?\n%a"
           :kill-buffer t)

          ;; ("i" "Inbox")
          ;; ("it" "freestyle | Inbox | TODO" entry (file "/home/chriad/agenda/index.org") "* TODO %?")

          ;; ("iw" "freestyle | Inbox | TODO | %a" entry (file "/home/chriad/agenda/index.org") "* TODO %? %a")

          ;; ("in" "freestyle | Inbox | %a" entry (file "/home/chriad/agenda/index.org") "* %? %a")

          ;; ("im" "freestyle | Inbox" entry (file "/home/chriad/agenda/index.org") "* %?")

          ;; ("t" "Inbox multi TODO"
          ;;  entry
          ;;  (file+headline "/home/chriad/agenda/index.org")
          ;;  "Inbox"
          ;;  "* TODO %? [/]\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")

          ;; does not work
          ;; ("o" "Inbox multi TODO"
          ;;  entry
          ;;  (file+headline  (function (lambda () (org-roam-find-file)) "Inbox")
          ;;  "* TODO %?"))

; ===

          ("b" "book=pdf (no-date-prefix)")
          ("bb" "freestyle | %a" entry
           (function (lambda () (find-file (concat "/home/chriad/roam/"  (org-capture-pdf-name) ".org"))))
           "* %? %a" :unnarrowed t)

          ("bs" "freestyle | %c %a" entry
           (function (lambda () (find-file (concat "/home/chriad/roam/"  (org-capture-pdf-name) ".org"))))
           "* %?%c %a")

          ("bt" "freestyle | TODO | %a" entry
           (function (lambda () (find-file (concat "/home/chriad/roam/" (org-capture-pdf-name) ".org"))))
           "* TODO %? %a")

          ;; ("a" "roam-active-region-pdf" entry
          ;;  (function (lambda () (org-roam-find-file)))
          ;;  "* %(org-capture-pdf-active-region)\n%a")

; ===

          ;; ("n" "plain Notes")
          ;; ("ns" "%?" item          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "- %i %a" :unnarrowed t)

          ;; ("nj" "%i %a" item          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "- %?%i %a" :unnarrowed t)


          ;; ("nk" "%i" item          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "- %?%i" :unnarrowed t)



          ;; ("f" "freestyle heading")
          ;; ("fs" "freestyle | %a" entry          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "* %? %a" :unnarrowed t)

          ;; ("fs" "freestyle" entry          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "* %?")

          ;; ("ft" "freestyle | TODO" entry          ; s = selection
          ;;  (function (lambda () (org-roam-node-find)))
          ;;  "* TODO %?" :unnarrowed t)

          ; ===

          ("x" "firefox Org Capture Selected template" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
           "* %?%i\n%u\n%a\n")

          ("y" "firefox Org Capture Unselected template" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
           "* %?\n%u\n%a\n")

          ("z" "video" plain (file "/home/chriad/Documents/video-urls.txt")
           "%:link" :immediate-finish t)

          ("w" "specialwords browser" plain (file "/home/chriad/Documents/specialwords.txt")
           "%i" :immediate-finish t)

          ("l" "org-fc")
          ("lx" "input" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
           "* %^{question}?\n%^{answer}\n%a" :immediate-finish t)
          

          ("ll" "code" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
           "* %a
#+begin_src %?
%i
#+end_src\n")

          ("c" "custom")
          ("cm" "Maps"
           table-line
           (file "~/Documents/vocabulary-map.org")
           "|%^{stimulus}|%^{response}|"
           :table-line-pos "I+1"
           :immediate-finish t)

          ("cf" "functions"
           table-line
           (file "~/Documents/wiki/funcs.org")
           "|%^{function}|%^{description}|%^{interactive?|y|n}|%a|"
           :table-line-pos "I+1"
           :immediate-finish t)

          ("cv" "Words"
           plain
           (file "~/Documents/specialwords.txt")
           "%^{word}"
           :immediate-finish t)


          ))

;; (defun my/org-roam-tag-add ()
;;   "Add a tag to Org-roam file.

;; Return added tag."
;;   (interactive)
;;   (unless org-roam-mode (org-roam-mode))
;;   (let* ((all-tags (org-roam-db--get-tags))
;;          (tag (completing-read "Tag: " all-tags))
;;          (file (buffer-file-name (buffer-base-buffer)))
;;          (existing-tags (org-roam--extract-tags-prop file)))
;;     ;; (when (string-empty-p tag)
;;     ;;   (user-error "Tag can't be empty"))
;;     (org-roam--set-global-prop
;;      "roam_tags"
;;      (combine-and-quote-strings (seq-uniq (cons tag existing-tags))))
;;     (org-roam-db--insert-tags 'update)
;;     tag))

(setq org-roam-capture-ref-templates ;; :fox:
  '(
    ("n" "ref" plain "%?"
     :if-new (file+head "${slug}.org" "#+title: ${title}")
     :unnarrowed t)

    ("r" "webpage no region" entry "* %?"
     :if-new (file+head "${slug}.org" "#+title: ${title}")
     :file-name "${slug}"
     :head "#+title: ${title}\n"
     :unnarrowed t)

    ;; capture multiple selections to page
    ("o" "simple list item" item
     (function org-roam-capture--get-point)
     "- %i ${ref}"
     :file-name "${slug}"
     :head "#+title: ${title}\n#+roam_key: ${ref}\n\n"
     :unnarrowed t)

    ("i" "webpage with region" entry
     (function org-roam-capture--get-point)
     "* %?\n"
     :file-name "${slug}"
     :head "#+title: ${title}\n#+roam_key: ${ref}\n%i\n"
     :unnarrowed t)))

(setq org-roam-capture-templates
      '(
        ("d" "default" plain "%?"
         :if-new (file+head "${slug}.org"
                            "#+title: ${title}\n%(org-roam-ref-add (org-capture-pdf-name))")
         :unnarrowed t)

        ("s" "prepend simple" plain "%?"
         :file-name "${slug}"
         :head "#+title: ${title}\n"
         :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n")
         :unnarrowed t
         :prepend)

        ("x" "append *" entry "* %?"
         :file-name "${slug}"
         :head "#+title: ${title}\n"
         :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n" )
         :unnarrowed t
         :append)
        
        ("t" "append * [link]" entry "* %?\n%a"
         :file-name "${slug}"
         :head "#+title: ${title}\n"
         :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n" )
         :unnarrowed t
         :append)

        ("r" "region")
        ("rv" "enter quote, append *" entry "* %?"
         :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n\n#+begin_quote\n${quote}\n#+end_quote\n" )
         :file-name "${slug}"
         :head "#+title: ${title}\n"
         :unnarrowed t
         :append)

        ("rr" "quote region, append *" entry "* %?"
         :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n\n#+begin_quote\n%i\n#+end_quote\n" )
         :file-name "${slug}"
         :head "#+title: ${title}\n"
         :unnarrowed t
         :append)

        ))

(add-hook 'org-capture-mode-hook 'evil-insert-state)
(add-hook 'org-capture-mode-hook 'evil-hybrid-state)

(provide 'capture)

;;; capture.el ends here
