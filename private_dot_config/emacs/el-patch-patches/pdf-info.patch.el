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
