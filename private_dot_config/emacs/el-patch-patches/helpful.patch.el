(el-patch-feature helpful)
(with-eval-after-load 'helpful
  (el-patch-defun helpful--bookmark-make-record ()
    "Create a bookmark record for helpful buffers.

See docs of `bookmark-make-record-function'."
    `((el-patch-add ,@(bookmark-make-record-default))
      (sym . ,helpful--sym)
      (callable-p . ,helpful--callable-p)
      ;; (position    . ,(point))
      (handler     . helpful--bookmark-jump))))
