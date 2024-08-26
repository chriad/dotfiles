;; change window split
(el-patch-feature pdf-util)
(with-eval-after-load 'pdf-util
  (el-patch-defun display-buffer-split-below-and-attach (buf alist)
    "Display buffer action using `pdf-util-window-attach'."
    (let ((window (selected-window))
          (height (cdr (assq 'window-height alist)))
          newwin)
      (when height
        (when (floatp height)
          (setq height (round (* height (frame-height)))))
        (setq height (- (max height window-min-height))))
      (setq newwin (window--display-buffer
                    buf
                    ((el-patch-swap split-window-below split-window-right) height)
                    'window alist))
      (pdf-util-window-attach newwin window)
      newwin)))

;; make table creation standard-compliant
(el-patch-feature org-table)
(with-eval-after-load 'org-table
  (el-patch-defun org-table-create (&optional size)
    "Query for a size and insert a table skeleton.
SIZE is a string Columns x Rows like for example \"3x2\"."
    (interactive "P")
    (unless size
      (setq size (read-string
                  (el-patch-swap (concat "Table size Columns x Rows [e.g. " org-table-default-size "]: ") (concat "Table size Rows x Columns [e.g. " org-table-default-size "]: "))
                  "" nil org-table-default-size)))

    (let* ((pos (point))
           (indent (make-string (current-column) ?\ ))
           (split (org-split-string size " *x *"))
           ((el-patch-swap rows columns) (string-to-number (nth 1 split)))
           ((el-patch-swap columns rows) (string-to-number (car split)))
           (line (concat (apply 'concat indent "|" (make-list columns "  |"))
                         "\n")))
      (if (string-match "^[ \t]*$" (buffer-substring-no-properties
                                    (line-beginning-position) (point)))
          (beginning-of-line 1)
        (newline))
      ;; (mapcar (lambda (x) (insert line)) (make-list rows t))
      (dotimes (_ rows) (insert line))
      (goto-char pos)
      (when (> rows 1)
        ;; Insert a hline after the first row.
        (end-of-line 1)
        (insert "\n|-")
        (goto-char pos))
      (org-table-align)))

  )


;; get rid of comment window that lists the contents of this annotation with a header (date, author etc.)
(el-patch-feature pdf-annot)

(with-eval-after-load 'pdf-annot
  (el-patch-defun pdf-annot-list-annotations ()
    "List annotations in a Dired like buffer.

\\{pdf-annot-list-mode-map}"
    (interactive)
    (pdf-util-assert-pdf-buffer)
    (let* ((buffer (current-buffer))
           (name (format "*%s's annots*"
                         (file-name-sans-extension
                          (buffer-name))))
           (annots-existed (and (get-buffer name)
                                pdf-annot-list-buffer)))
      (with-current-buffer (get-buffer-create name)
        (delay-mode-hooks
          (unless (derived-mode-p 'pdf-annot-list-mode)
            (pdf-annot-list-mode))
          (setq pdf-annot-list-document-buffer buffer)
          (unless annots-existed
            (tabulated-list-print))
          (setq tablist-context-window-function
                (el-patch-swap (lambda (id) (pdf-annot-list-context-function id buffer)) nil)
                tablist-operations-function #'pdf-annot-list-operation-function)
          (let ((list-buffer (current-buffer)))
            (with-current-buffer buffer
              (setq pdf-annot-list-buffer list-buffer))))
        (run-mode-hooks)
        (pop-to-buffer
         (current-buffer)
         pdf-annot-list-display-buffer-action)
        (tablist-move-to-major-column)
        (tablist-display-context-window))
      (add-hook 'pdf-info-close-document-hook
                #'pdf-annot-list-update nil t)
      (add-hook 'pdf-annot-modified-functions
                #'pdf-annot-list-update nil t))))


;; when browsing annotations, copy the corresponding text to clipboard
;; also change highlight attributes

(with-eval-after-load 'pdf-annot
  (el-patch-defun pdf-annot-show-annotation (a &optional highlight-p window)

    (save-selected-window
      (when window (select-window window 'norecord))
      (pdf-util-assert-pdf-window)
      (let ((page (pdf-annot-get a 'page))
            (size (pdf-view-image-size)))
        (unless (= page (pdf-view-current-page))
          (pdf-view-goto-page page))
        (let ((edges (pdf-annot-get-display-edges a)))
          (when highlight-p
            (pdf-view-display-image
             (pdf-view-create-image
                 (pdf-cache-renderpage-highlight
                  page (car size)
                  `((el-patch-swap "white" "black") (el-patch-swap "steel blue" "yellow") (el-patch-swap 0.35 0.7) ,@edges))
               :map (pdf-view-apply-hotspot-functions
                     window page size)
               :width (car size))))
          (pdf-util-scroll-to-edges
           (pdf-util-scale-relative-to-pixel (car edges)))))))

  ;; do not highlight annotation
  (el-patch-defun pdf-annot-list-display-annotation-from-id (id)
    "Display the Annotation ID in the PDF file.

This allows us to follow the tabulated-list of annotations and
have the PDF buffer automatically move along with us."
    (interactive (list (tabulated-list-get-id)))
    (when id
      (unless (buffer-live-p pdf-annot-list-document-buffer)
        (error "PDF buffer was killed"))
      (when (timerp pdf-annot-list-display-annotation--timer)
        (cancel-timer pdf-annot-list-display-annotation--timer))
      (setq pdf-annot-list-display-annotation--timer
            (run-with-idle-timer 0.1 nil
                                 (lambda (buffer a)
                                   (when (buffer-live-p buffer)
                                     (with-selected-window
                                         (or (get-buffer-window buffer)
                                             (display-buffer
                                              buffer
                                              '(nil (inhibit-same-window . t))))
                                       (pdf-annot-show-annotation a (el-patch-swap t t)))))
                                 pdf-annot-list-document-buffer
                                 (pdf-annot-getannot id pdf-annot-list-document-buffer)))))
  )

;; get rid of highlight margin
(el-patch-feature pdf-info)
(with-eval-after-load 'pdf-info
  (el-patch-defun pdf-info-renderpage-highlight (page width
                                                      &optional file-or-buffer
                                                      &rest regions)
    "Highlight regions on PAGE with width WIDTH using REGIONS.

REGIONS is a list determining the background color, a alpha value
and the regions to render. So each element should look like \(FILL-COLOR
STROKE-COLOR ALPHA \(LEFT TOP RIGHT BOT\) \(LEFT TOP RIGHT BOT\) ... \)
.

For the other args see `pdf-info-renderpage'.

Return the data of the corresponding PNG image."

    (when (consp file-or-buffer)
      (push file-or-buffer regions)
      (setq file-or-buffer nil))

    (apply #'pdf-info-renderpage
           page width file-or-buffer
           (apply #'append
                  (mapcar (lambda (elt)
                            `(:background ,(pop elt)
                                          :foreground ,(pop elt)
                                          :alpha ,(pop elt)
                                          ,@(cl-mapcan (lambda (edges)
                                                         `((el-patch-swap :highlight-region :highlight-text) ,edges))
                                                       elt)))
                          regions)))))

;; ----------------

;; TODO mapconcat check hyphenation first bla- bli -> blabli
;; TODO bind to pdf-annot-list keymap
(defun pdf-annot---copy-highlight-annotation-text ()
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

;; TODO bind to key in annot-list-map
;; TODO also maybe hook to pdf-annot-activate-handler-function
(defun pdf-annot---edit-this-annot ()
  (interactive)
  (pdf-annot-edit-contents (pdf-annot-getannot (tabulated-list-get-id)
                                               pdf-annot-list-document-buffer)))

;; TODO to add pasting highlighted text, look at pdf-annot-edit-contents-noselect
(defun pdf-annot---edit-this-annot-highlight-text-as-content ()
  (ignore))

;; override some keys
(with-eval-after-load 'pdf-annot
  (el-patch-defvar pdf-annot-list-mode-map
    (let ((km (make-sparse-keymap)))
      (define-key km (kbd "C-c C-f") #'pdf-annot-list-follow-minor-mode)
      (define-key km (kbd "SPC") #'pdf-annot-list-display-annotation-from-id)
      (define-key km (kbd "y") #'pdf-annot---copy-highlight-annotation-text)
      km))
  ;; TODO copy annotation text on y
  (define-key pdf-annot-list-mode-map (kbd "y") 'pdf-annot---copy-highlight-annotation-text))


;; helm source for annotations
;; TODO momoize, write to sidecar, get checksum to see if something changed
;; TODO add action to edit highlighted text as annotation content (pdf-annot---edit-this-annot)
(with-eval-after-load 'pdf-annots
  (defun pdf-annot---get-text-from-annot (a)
    (let* ((buf (alist-get 'buffer a))
           (pag (alist-get 'page a))
           (edges (pdf-annot-get-display-edges a)))
      (with-current-buffer buf
        (pdf-view-goto-page pag)
        (setq txt (mapcar (lambda (edg)
                            (pdf-info-gettext (pdf-view-current-page)
                                              edg
                                              pdf-view-selection-style))
                          edges))
        (mapconcat 'identity txt " "))))
  ;; eval this in pdf-view-mode
  ;; TODO bind to key
  ;; not working
  ;; (evil-define-key 'normal pdf-annot-minor-mode-map (kbd "x") 'pdf-annot---helm-annots-get)
  ;; (define-key pdf-annot-minor-mode-map (kbd "C-c C-x") 'pdf-annot---helm-annots-get)
  ;; (spacemacs/declare-prefix-for-mode 'spacemacs-pdf-view-mode "mo" "custom")
  ;; (spacemacs/set-leader-keys-for-major-mode 'spacemacs-pdf-view-mode "ol" 'pdf-annot---helm-annots-get)
  (defun pdf-annot---helm-annots-get ()
    (interactive)
    (helm :sources (helm-build-in-buffer-source "test"
                     :data (-map (lambda (x)
                                   (pdf-annot---get-text-from-annot x))
                                 (sort (pdf-annot-getannots nil
                                                            '(highlight)
                                                            pdf-annot-list-document-buffer)
                                       #'pdf-annot-compare-annotations)))
          :buffer "*helm pdf-annots*"))

  )



;;; ---- org-pdftools

(el-patch-feature org-pdftools)
(with-eval-after-load 'org-pdftools

  (el-patch-defun org-pdftools-store-link ()
    "Store a link to a pdfview/pdfoccur buffer."
    (cond ((eq major-mode 'pdf-view-mode)
           ;; This buffer is in pdf-view-mode
           (let* ((file (file-name-base (pdf-view-buffer-file-name)))
                  (quot (if (pdf-view-active-region-p)
                            (replace-regexp-in-string "\n" " "
                                                      (mapconcat 'identity (pdf-view-active-region-text) ? ))))
                  (page (number-to-string (pdf-view-current-page)))
                  (link (org-pdftools-get-link))
                  (isearchstr (if (string-match (concat ".*" (regexp-quote org-pdftools-search-string-separator) "\\(.*\\)") link)
                                  (match-string 1 link)))
                  (desc (funcall org-pdftools-get-desc-function file page (or quot isearchstr))))
             (org-link-store-props
              :type org-pdftools-link-prefix
              :link link
              :description desc)))
          ((eq major-mode 'pdf-occur-buffer-mode)
           (let* ((paths (mapconcat #'identity (mapcar #'car
                                                       pdf-occur-search-documents) "%&%"))
                  (occur-search-string pdf-occur-search-string)
                  (link (concat org-pdftools-link-prefix ":"
                                paths "@@" occur-search-string)))
             (org-link-store-props
              :type org-pdftools-link-prefix
              :link link
              :description (concat "Search: " occur-search-string)))))))


(el-patch-feature helm-bookmark)
(with-eval-after-load 'helm-bookmark
  (el-patch-defun helm-bookmark-uncategorized-bookmark-p (bookmark)
    "Return non--nil if BOOKMARK match no known category."
    (cl-loop for pred in '(bmkp-dired-bookmark-p
                           helm-bookmark-org-file-p
                           helm-bookmark-addressbook-p
                           helm-bookmark-gnus-bookmark-p
                           helm-bookmark-mu4e-bookmark-p
                           helm-bookmark-w3m-bookmark-p
                           helm-bookmark-woman-man-bookmark-p
                           helm-bookmark-info-bookmark-p
                           helm-bookmark-image-bookmark-p
                           helm-bookmark-file-p
                           helm-bookmark-helm-find-files-p
                           helm-bookmark-addressbook-p)
             never (funcall pred bookmark)))
  )


(el-patch-feature achievements-functions)
(with-eval-after-load 'achievements-functions
    (el-patch-defconst achievements-file
      (expand-file-name ".achievements" "/home/chriad/.local/share/chezmoi/ignored/emacs/")
      "File to store the achievements in."))
