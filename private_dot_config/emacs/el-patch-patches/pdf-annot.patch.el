;;; helpers

;; experiment with chriad-pdf-annots-list

;; (defun pdf-annot-getannots (&optional pages types buffer)

;; (pdf-annot-getannots '(50 . 70) '(highlight))

;; (defun pdf-info-normalize-page-range (pages)
;;   "Normalize PAGES for sending to the server.

;; PAGES may be a single page number, a cons \(FIRST . LAST\), or
;; nil, which stands for all pages.

;; map pdf-annot-get id (pdf-annot-getannots '(50 . 70) '(highlight)) # returns list of alists. Each annot is a element of the list and itself an alist.



;; ((buffer . #<buffer name.pdf>)
;;  (page . 236)
;;  (edges 0.141502 0.052133 0.206901 0.073379)
;;  (type . link)
;;  (id . annot-236-4)
;;  (flags . 0)
;;  (color . "#ff0000")
;;  (contents . "")
;;  (modified 22147 54079))

(defun pdf-annot-next-jump ()
  (ignore))

;; TODO mapconcat check hyphenation first bla- bli -> blabli
;; TODO bind to pdf-annot-list keymap
(defun pdf-annot---copy-highlight-annotation-text ()
  (interactive)
  (let* ((a (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer))
         (page (pdf-annot-get a 'page))
         (edges (pdf-annot-get-display-edges a)))
    (with-current-buffer pdf-annot-list-document-buffer
      (pdf-view-goto-page page)
      (setq txt (mapcar
                 (lambda (edg)
                   (pdf-info-gettext
                    (pdf-view-current-page)
                    edg
                    pdf-view-selection-style))
                 edges))
      (kill-new (mapconcat 'identity txt " ")))))

;; TODO bind to key in annot-list-map
;; TODO also maybe hook to pdf-annot-activate-handler-function
(defun pdf-annot---edit-this-annot ()
  (interactive)
  (pdf-annot-edit-contents (pdf-annot-getannot (tabulated-list-get-id)
                                               pdf-annot-list-document-buffer)))

;; TODO to add pasting highlighted text, look at pdf-annot-edit-contents-noselect
(defun pdf-annot---edit-this-annot-highlight-text-as-content ()
  (ignore))


;;; patches
(el-patch-feature pdf-annot)

(with-eval-after-load 'pdf-annot
  ;; inelegant way to get rid of comment window that lists the contents of this annotation with a header (date, author etc.)
  (el-patch-defun pdf-annot-list-annotations ()
    "List annotations in a Dired like buffer.

\\{pdf-annot-list-mode-map}"
    (interactive)
    (pdf-util-assert-pdf-buffer)
    (let* ((buffer (current-buffer))
           (name (format "*%s's annots*"
                         (file-name-sans-extension
                          (buffer-name))))
           (annots-existed (and (get-buffer name)
                                pdf-annot-list-buffer)))
      (with-current-buffer (get-buffer-create name)
        (delay-mode-hooks
          (unless (derived-mode-p 'pdf-annot-list-mode)
            (pdf-annot-list-mode))
          (setq pdf-annot-list-document-buffer buffer)
          (unless annots-existed
            (tabulated-list-print))
          (setq tablist-context-window-function
                (el-patch-swap (lambda (id) (pdf-annot-list-context-function id buffer)) nil)
                tablist-operations-function #'pdf-annot-list-operation-function)
          (let ((list-buffer (current-buffer)))
            (with-current-buffer buffer
              (setq pdf-annot-list-buffer list-buffer))))
        (run-mode-hooks)
        (pop-to-buffer
         (current-buffer)
         pdf-annot-list-display-buffer-action)
        (tablist-move-to-major-column)
        (tablist-display-context-window))
      (add-hook 'pdf-info-close-document-hook
                #'pdf-annot-list-update nil t)
      (add-hook 'pdf-annot-modified-functions
                #'pdf-annot-list-update nil t)))

  ;; when browsing annotations, copy the corresponding text to clipboard
  ;; also change highlight attributes

  ;; TODO (face-background 'default nil)

  (el-patch-defun pdf-annot-show-annotation (a &optional highlight-p window)
    (save-selected-window
      (when window (select-window window 'norecord))
      (pdf-util-assert-pdf-window)
      (let ((page (pdf-annot-get a 'page))
            (size (pdf-view-image-size)))
        (unless (= page (pdf-view-current-page))
          (pdf-view-goto-page page))
        (let ((edges (pdf-annot-get-display-edges a)))
          (when highlight-p
            (pdf-view-display-image
             (pdf-view-create-image
              (pdf-cache-renderpage-highlight
               page (car size)
               `((el-patch-swap "white" "#292b2e") (el-patch-swap "steel blue" "yellow") (el-patch-swap 0.35 0.4) ,@edges))
              :map (pdf-view-apply-hotspot-functions
                    window page size)
              :width (car size))))
          (pdf-util-scroll-to-edges
           (pdf-util-scale-relative-to-pixel (car edges)))))))

  ;; do not highlight annotation
  (el-patch-defun pdf-annot-list-display-annotation-from-id (id)
    "Display the Annotation ID in the PDF file.

This allows us to follow the tabulated-list of annotations and
have the PDF buffer automatically move along with us."
    (interactive (list (tabulated-list-get-id)))
    (when id
      (unless (buffer-live-p pdf-annot-list-document-buffer)
        (error "PDF buffer was killed"))
      (when (timerp pdf-annot-list-display-annotation--timer)
        (cancel-timer pdf-annot-list-display-annotation--timer))
      (setq pdf-annot-list-display-annotation--timer
            (run-with-idle-timer 0.1 nil
                                 (lambda (buffer a)
                                   (when (buffer-live-p buffer)
                                     (with-selected-window
                                         (or (get-buffer-window buffer)
                                             (display-buffer
                                              buffer
                                              '(nil (inhibit-same-window . t))))
                                       (pdf-annot-show-annotation a (el-patch-swap t t)))))
                                 pdf-annot-list-document-buffer
                                 (pdf-annot-getannot id pdf-annot-list-document-buffer))))))

  ;; override some keys
  ;; (el-patch-defvar pdf-annot-list-mode-map
  ;;   (let ((km (make-sparse-keymap)))
  ;;     (define-key km (kbd "C-c C-f") #'pdf-annot-list-follow-minor-mode)
  ;;     (define-key km (kbd "SPC") #'pdf-annot-list-display-annotation-from-id)
  ;;     (define-key km (kbd "y") #'pdf-annot---copy-highlight-annotation-text)
  ;;     km))


  ;; helm source for annotations
  ;; TODO momoize, write to sidecar, get checksum to see if something changed
  ;; TODO add action to edit highlighted text as annotation content (pdf-annot---edit-this-annot)
  (defun pdf-annot---get-text-from-annot (a)
    (let* ((buf (alist-get 'buffer a))
           (pag (alist-get 'page a))
           (edges (pdf-annot-get-display-edges a)))
      (with-current-buffer buf
        (pdf-view-goto-page pag)
        (setq txt (mapcar (lambda (edg)
                            (pdf-info-gettext (pdf-view-current-page)
                                              edg
                                              pdf-view-selection-style))
                          edges))
        (mapconcat 'identity txt " "))))

  ;; eval this in pdf-view-mode
  ;; TODO on RET, goto annotation
  (defun pdf-annot---browse-annot-texts ()
    (interactive)
    (helm :sources (helm-build-in-buffer-source "test"
                     :data (-map (lambda (x)
                                   (pdf-annot---get-text-from-annot x))
                                 (sort (pdf-annot-getannots nil
                                                            '(highlight)
                                                            pdf-annot-list-document-buffer)
                                       #'pdf-annot-compare-annotations)))
          :buffer "*helm pdf-annots*"))

;; when in annt buffer, pop up outline in same buffer
(defun outline-from-annot-buffer ()
  (interactive)
  (let ((pdf-outline-display-buffer-action '((display-buffer-reuse-window display-buffer-same-window) . nil)))
    (pdf-outline pdf-annot-list-document-buffer nil))) 

  ;; TODO copy annotation text on y
  ;; (define-key pdf-annot-list-mode-map (kbd "y") 'pdf-annot---copy-highlight-annotation-text)


;; load after pdf layer?
  (use-package pdf-tools
    :defer 2
    :config
    (evilified-state-evilify-map pdf-annot-list-mode-map
      :mode  pdf-annot-list-mode
      :eval-after-load pdf-annot
      :bindings
      "y"                'pdf-annot---copy-highlight-annotation-text
      "o"                'outline-from-annot-buffer
      "e"                'pdf-annot---edit-this-annot-highlight-text-as-content
      "h"                'pdf-annot---browse-annot-texts))
