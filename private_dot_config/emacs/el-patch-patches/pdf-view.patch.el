
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
                           (cons 'slice (and displayed-p
                                             (pdf-view-current-slice))))
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
