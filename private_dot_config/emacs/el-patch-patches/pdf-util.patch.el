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
