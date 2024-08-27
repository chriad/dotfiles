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
      (org-table-align))))
