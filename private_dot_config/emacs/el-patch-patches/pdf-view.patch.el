
(el-patch-feature pdf-view)
(with-eval-after-load 'pdf-view
    (el-patch-defun pdf-view-bookmark-make-record  (&optional no-page no-slice no-size no-origin)
      ;; TODO: add NO-PAGE, NO-SLICE, NO-SIZE, NO-ORIGIN to the docstring.
      "Create a bookmark PDF record.

The optional, boolean args exclude certain attributes."
      (let ((displayed-p (eq (current-buffer)
                             (window-buffer))))
        (cons (buffer-name)
              (append (bookmark-make-record-default nil t 1)
                      `(,(unless no-page
                           (cons 'page (pdf-view-current-page)))
                        ,(unless no-slice
                           (cons 'slice (and displayed-p (pdf-view-current-slice))))
                        ,(unless no-size
                           (cons 'size pdf-view-display-size))
                        ,(unless no-origin
                           (cons 'origin
                                 (and displayed-p
                                      (let ((edges (pdf-util-image-displayed-edges nil t)))
                                        (pdf-util-scale-pixel-to-relative
                                         (cons (car edges) (cadr edges)) nil t)))))
                        (handler . (el-patch-swap pdf-view-bookmark-jump-handler pdf-view-bookmark-jump)))))))
  )

;; TODO
;; assume you are in the pdf-annot-list buffer
;; (defun chriad/pdf-annot-make-record ()
;;   `(,@(bookmark-make-record-default nil t 1)
;;    (pdf-annot-id . (pdf-annot-get-id (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer) ))
;;    (handler . (ignore)))

;; TODO hook pdf-annot-list-mode with set-local make-bookmark-function

;; (defun pdf-view-region-bookmark-make-record  (&optional no-page no-slice no-size no-origin)
;;   "Create a bookmark PDF record.

;; The optional, boolean args exclude certain attributes."
;;   (let ((displayed-p (eq (current-buffer)
;;                          (window-buffer))))
;;     (cons (buffer-name)
;;           (append (bookmark-make-record-default nil t 1)
;;                   `(,(unless no-page
;;                        (cons 'page (pdf-view-current-page)))
;;                     ,(unless no-slice
;;                        (cons 'slice (and displayed-p
;;                                          (pdf-view-current-slice))))
;;                     ,(unless no-size
;;                        (cons 'size pdf-view-display-size))
;;                     ,(unless no-origin
;;                        (cons 'origin
;;                              (and displayed-p
;;                                   (let ((edges (pdf-util-image-displayed-edges nil t)))
;;                                     (pdf-util-scale-pixel-to-relative
;;                                      (cons (car edges) (cadr edges)) nil t)))))
;;                     (handler . pdf-view-bookmark-jump)
;;                     (region . (pdf-view-active-region)))))))

;; pdf-view-active-region-p

;; (defun pdf-view-deactivate-region ()
;;   "Deactivate the region."
;;   (interactive)
;;   (when pdf-view-active-region
;;     (setq pdf-view-active-region nil)
;;     (deactivate-mark)
;;     (pdf-view-redisplay t)))


;; (defun pdf-view-mark-whole-page ()
;;   "Mark the whole page."
;;   (interactive)
;;   (pdf-view-deactivate-region)
;;   (setq pdf-view-active-region
;;         (list (list 0 0 1 1)))
;;   (pdf-view--push-mark)
;;   (pdf-view-display-region))
