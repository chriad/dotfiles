(with-eval-after-load 'pdf-annots
  (defun get-text-from-annot (a)
    (let* ((buf (alist-get 'buffer a))
           (pag (alist-get 'page a))
           (edges (alist-get 'markup-edges a)))
      (with-current-buffer buf
        (pdf-view-goto-page pag)
        (setq txt (mapcar
                   (lambda (edg)
                     (pdf-info-gettext
                      (pdf-view-current-page)
                      edg
                      pdf-view-selection-style))
                   edges))
        (mapconcat 'identity txt " "))))


;; use pp-buffer to pretty-print like this
;; (((buffer . #<buffer Pam Mastery.pdf>)
;;   (page . 23)
;;   (edges 0.035251 0.821818 0.96011 0.94)
;;   (type . highlight)
;;   (id . annot-23-0)
;;   (flags . 4)
;;   (color . "#ffd500")
;;   (contents . "")
;;   (modified 25410 34080)
;;   (label)
;;   (subject)
;;   (opacity . 0.4)
;;   (popup-edges)
;;   (popup-is-open)
;;   (created)
;;   (markup-edges
;;    (0.698895 0.8213 0.922652 0.84296)
;;    (0.035912 0.853791 0.961326 0.875451)
;;    (0.035912 0.886282 0.928177 0.907942)
;;    (0.035912 0.918773 0.417127 0.940433)))
;;  ((buffer . #<buffer Pam Mastery.pdf>)
;;   (page . 31)
;;   (edges 0.035251 0.047273 0.923006 0.100606)
;;   (type . highlight)
;;   (id . annot-31-0)
;;   (flags . 4)
;;   (color . "#ffd500")
;;   (contents . "")
;;   (modified 25410 34643)
;;   (label)
;;   (subject)
;;   (opacity . 0.4)
;;   (popup-edges)
;;   (popup-is-open)
;;   (created)
;;   (markup-edges
;;    (0.162983 0.046931 0.922652 0.068592)
;;    (0.035912 0.079422 0.546961 0.101083)))
;;  ((buffer . #<buffer Pam Mastery.pdf>)
;;   (page . 31)
;;   (edges 0.035251 0.321818 0.935066 0.404848)
;;   (type . highlight)
;;   (id . annot-31-1)
;;   (flags . 4)
;;   (color . "#ffd500")
;;   (contents . "")
;; q  (modified 25410 34664)
;;   (label)
;;   (subject)
;;   (opacity . 0.4)
;;   (popup-edges)
;;   (popup-is-open)
;;   (created)
;;   (markup-edges
;;    (0.035912 0.3213 0.900552 0.34296)
;;    (0.035912 0.353791 0.933702 0.375451)
;;    (0.035912 0.386282 0.662983 0.404332)))
;;  ((buffer . #<buffer Pam Mastery.pdf>)
;;   (page . 36)
;;   (edges 0.672238 0.443051 0.719751 0.481318)
;;   (type . ink)
;;   (id . annot-36-0)
;;   (flags . 4)
;;   (color . "#000000")
;;   (contents . "")
;;   (modified 25410 35949)))


  ;; eval this in pdf-view-mode
  (defun helm-annots-get ()
    (interactive)
    (helm :sources (helm-build-in-buffer-source "test"
                   :data  (-map (lambda (x) (get-text-from-annot x)) (sort (pdf-annot-getannots nil
                                                                                           '(highlight)
                                                                                           pdf-annot-list-document-buffer)
                                                                      #'pdf-annot-compare-annotations)))
        :buffer "*helm pdf-annots*"))


  ;; TODO define key
  ;; (evil-define-key 'normal pdf-annot-minor-mode-map (kbd "x") 'helm-annots-get)

  ;; (define-key pdf-annot-minor-mode-map (kbd "C-c C-x") 'helm-annots-get)


  ;; (spacemacs/declare-prefix-for-mode 'spacemacs-pdf-view-mode "mo" "custom")
  ;; (spacemacs/set-leader-keys-for-major-mode 'spacemacs-pdf-view-mode "ol" 'helm-annots-get)
  )
