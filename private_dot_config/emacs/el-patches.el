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


(el-patch-feature pdf-annot)
(with-eval-after-load 'pdf-annot

  ;; get rid of comment window since my annotations are only highlight and don't contain text
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

  ;; (with-eval-after-load 'pdf-annot
  ;;   (el-patch-defun pdf-annot-show-annotation (a &optional highlight-p window)
  ;;                   (save-selected-window
  ;;                     (when window (select-window window 'norecord))
  ;;                     (pdf-util-assert-pdf-window)
  ;;                     (let ((page (pdf-annot-get a 'page))
  ;;                           (size (pdf-view-image-size)))
  ;;                       (unless (= page (pdf-view-current-page))
  ;;                         (pdf-view-goto-page page))
  ;;                       (let ((edges (pdf-annot-get-display-edges a)))
  ;;                         (when (el-patch-swap highlight-p t)
  ;;                           (pdf-view-display-image
  ;;                            (pdf-view-create-image
  ;;                                (pdf-cache-renderpage-highlight
  ;;                                 page (car size)
  ;;                                 `("white" (el-patch-swap "steel blue" "white") (el-patch-swap 0.35 0.36) ,@edges))
  ;;                              :map (pdf-view-apply-hotspot-functions
  ;;                                    window page size)
  ;;                              :width (car size))))
  ;;                         (pdf-util-scroll-to-edges
  ;;                          (pdf-util-scale-relative-to-pixel (car edges))))))))


;; when browsing annotations, copy the corresponding text to clipboard
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
        (el-patch-add (let* ((txt  (mapcar
                                    (lambda (edg)
                                      (pdf-info-gettext
                                       (pdf-view-current-page)
                                       edg
                                       pdf-view-selection-style))
                                    edges)))
                        ;; (pdf-view-deactivate-region)
                        (kill-new (mapconcat 'identity txt " "))) )
        (when highlight-p
          (pdf-view-display-image
           (pdf-view-create-image
               (pdf-cache-renderpage-highlight
                page (car size)
                `("white" "steel blue" 0.35 ,@edges))
             :map (pdf-view-apply-hotspot-functions
                   window page size)
             :width (car size))))
        (pdf-util-scroll-to-edges
         (pdf-util-scale-relative-to-pixel (car edges))))))))

;; (defun pdf-info-renderpage (page width &optional file-or-buffer &rest commands)
;;   "Render PAGE with width WIDTH.

;; Return the data of the corresponding PNG image."
;;   (when (keywordp file-or-buffer)
;;     (push file-or-buffer commands)
;;     (setq file-or-buffer nil))
;;   (apply #'pdf-info-query
;;     'renderpage
;;     (pdf-info--normalize-file-or-buffer file-or-buffer)
;;     page
;;     (* width (pdf-util-frame-scale-factor))
;;     (let (transformed)
;;       (while (cdr commands)
;;         (let ((kw (pop commands))
;;               (value (pop commands)))
;;           (setq value
;;                 (cl-case kw
;;                   ((:crop-to :highlight-line :highlight-region :highlight-text)
;;                    (mapconcat #'number-to-string value " "))
;;                   ((:foreground :background)
;;                    (pdf-util-hexcolor value))
;;                   (:alpha
;;                    (number-to-string value))
;;                   (:selection-style
;;                    (number-to-string (pdf-info--selection-style value)))
;;                   (otherwise value)))
;;           (push kw transformed)
;;           (push value transformed)))
;;       (when commands
;;         (error "Keyword is missing a value: %s" (car commands)))
;;       (nreverse transformed))))
