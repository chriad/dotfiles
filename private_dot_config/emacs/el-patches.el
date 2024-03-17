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

;;;* el-path
;;   (el-patch-feature pdf-annot)

;;   (with-eval-after-load 'pdf-annot
;;     (el-patch-defun pdf-annot-show-annotation (a &optional highlight-p window)
;;                     (save-selected-window
;;                       (when window (select-window window 'norecord))
;;                       (pdf-util-assert-pdf-window)
;;                       (let ((page (pdf-annot-get a 'page))
;;                             (size (pdf-view-image-size)))
;;                         (unless (= page (pdf-view-current-page))
;;                           (pdf-view-goto-page page))
;;                         (let ((edges (pdf-annot-get-display-edges a)))
;;                           (when (el-patch-swap highlight-p t)
;;                             (pdf-view-display-image
;;                              (pdf-view-create-image
;;                                  (pdf-cache-renderpage-highlight
;;                                   page (car size)
;;                                   `("white" (el-patch-swap "steel blue" "white") (el-patch-swap 0.35 0.36) ,@edges))
;;                                :map (pdf-view-apply-hotspot-functions
;;                                      window page size)
;;                                :width (car size))))
;;                           (pdf-util-scroll-to-edges
;;                            (pdf-util-scale-relative-to-pixel (car edges))))))))


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
