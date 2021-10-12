
; https://notes.alexkehayias.com/org-roam/
(use-package helm-rg
  :ensure t
  :config
  ;; Add actions for inserting org file link from selected match
  (defun insert-org-mode-link-from-helm-result (candidate)
    (interactive)
    (with-helm-current-buffer
      (insert (format "[[file:%s][%s]]"
                      (plist-get candidate :file)
                      ;; Extract the title from the file name
                      (subst-char-in-string
                       ?_ ?\s
                       (first
                        (split-string
                         (first
                          (last
                           (split-string (plist-get candidate :file) "\\-")))
                         "\\.")))))))

  (helm-add-action-to-source "Insert org-mode link"
                             'insert-org-mode-link-from-helm-result
                             helm-rg-process-source))

;; https://org-roam.discourse.group/t/creating-an-org-roam-note-from-an-existing-headline/978
(defun org-roam-create-note-from-headline ()
  "Create an Org-roam note from the current headline and jump to it.

Normally, insert the headline’s title using the ’#title:’ file-level property
and delete the Org-mode headline. However, if the current headline has a
Org-mode properties drawer already, keep the headline and don’t insert
‘#+title:'. Org-roam can extract the title from both kinds of notes, but using
‘#+title:’ is a bit cleaner for a short note, which Org-roam encourages."
  (interactive)
  (let ((title (nth 4 (org-heading-components)))
        (has-properties (org-get-property-block)))
    (org-cut-subtree)
    (org-roam-find-file title nil nil 'no-confirm)
    (org-paste-subtree)
    (unless has-properties
      (kill-line)
      (while (outline-next-heading)
        (org-promote)))
    (goto-char (point-min))
    (when has-properties
      (kill-line)
      (kill-line))))

;; https://ag91.github.io/blog/2021/03/12/find-org-roam-notes-via-their-relations/
(defun my/navigate-note (arg &optional note choices)
  "Navigate notes by link. With universal ARG tries to use only to navigate the tags of the current note. Optionally takes a selected NOTE and filepaths CHOICES."
  (interactive "P")
  (let* ((choices (or
                   choices
                   (when arg (org-roam-db--links-with-max-distance (buffer-file-name) 1))))
         (all-notes (org-roam--get-title-path-completions))
         (completions
          (or (--filter (-contains-p choices (plist-get (cdr it) :path)) all-notes) all-notes))
         (title-with-tags (org-roam-completion--completing-read "File: " completions))
         (res (cdr (assoc title-with-tags completions)))
         (next-note (plist-get res :path)))
    (if (string= note next-note)
        (find-file note)
      (my/navigate-note nil next-note (org-roam-db--links-with-max-distance next-note 1)))))

