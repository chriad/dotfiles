;;; capture.el --- My personal capture templates.

;; (use-package org-capture
;;   :after org
;;   :hook
;;   (org-capture-mode . evil-insert-state))

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

;;; org-capture

;; capture directly without goin through dispatcher
(define-key global-map (kbd "C-c x")
            (lambda () (interactive) (org-roam-capture nil "t")))

(defun org-capture-at-point ()
  "Insert an org capture template at point."
  (interactive)
  (org-capture 0))

;; helper for "h" capture template
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

;; helper for "h" capture template
(defun my/org-roam-find-file-name ()
  "Find and return the path to an org-roam file
with the `org-roam-find-file' interface"
  (interactive)
  (save-window-excursion (org-roam-node-find) buffer-file-name))

(setq org-capture-templates
        '(
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

          ("x" "firefox Org Capture Selected template" entry (file+headline "/home/chriad/agenda/org-fc.org" "org-fc")
           "* %?%i\n%u\n%a\n")

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

;; emacsclient --eval "(abs--quick-capture)" --alternate-editor= --create-frame
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

