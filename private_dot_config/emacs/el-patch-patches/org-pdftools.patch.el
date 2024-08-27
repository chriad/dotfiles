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
