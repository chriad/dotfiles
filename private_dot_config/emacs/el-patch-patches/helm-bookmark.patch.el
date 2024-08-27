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
             never (funcall pred bookmark))))
