;;;; -*- eval: (outline-minor-mode); eval: (hs-minor-mode -1); -*-

;;; experiments
;; experiment with chriad-pdf-annots-list

;; (defun pdf-annot-getannots (&optional pages types buffer)

;; (pdf-annot-getannots '(50 . 70) '(highlight))

;; (defun pdf-info-normalize-page-range (pages)
;;   "Normalize PAGES for sending to the server.

;; PAGES may be a single page number, a cons \(FIRST . LAST\), or
;; nil, which stands for all pages.

;; map pdf-annot-get id (pdf-annot-getannots '(50 . 70) '(highlight)) # returns list of alists. Each annot is a element of the list and itself an alist.

;; TODO make c-c c-s in annots-buffer save annots to pdf

;; ((buffer . #<buffer name.pdf>)
;;  (page . 236)
;;  (edges 0.141502 0.052133 0.206901 0.073379)
;;  (type . link)
;;  (id . annot-236-4)
;;  (flags . 0)
;;  (color . "#ff0000")
;;  (contents . "")
;;  (modified 22147 54079))

;; TODO toggle: buffer-live-p *Annot* or pdf-annot-edit-contents-minor-mode
;; (defun tablist-toggle-context-window ()
;;   (interactive)
;;   (if (window-live-p tablist-context-window)
;;       (tablist-hide-context-window)
;;     (tablist-display-context-window)))

;;; helpers


;; TODO make fortune from region
;; use (pdf-info-metadata)
;; ((title . "")
;;  (author . "")
;;  (subject . "")
;;  (keywords-raw . "")
;;  (keywords)
;;  ...)

;; when in pdf-annot-list-buffer, press J to go to next page in pdf-document-buffer
(defun chriad/pdf-annot-next-page ()
  (interactive)
  (with-selected-window (display-buffer pdf-annot-list-document-buffer)
    (pdf-view-next-page)))


(defun chriad/pdf-annot-previous-page ()
  (interactive)
  (with-selected-window (display-buffer pdf-annot-list-document-buffer)
    (pdf-view-previous-page)))


(defun chriad/annot-from-tablist ()
  (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer))

(defun chriad/pdf-annot-list-toggle-annot-contents ()
  (interactive)
  (let ((a (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer)))
    (pdf-annot-list-context-function (pdf-annot-get-id a) pdf-annot-list-document-buffer)
    )
  )

(defun chriad/annot-highlights-text-to-sidecar (&optional embed)
  (ignore))

;; TODO pdf-annot-show-annotation
;; TODO (pdf-view-current-page) -> 113
;; pdf-info-getannots
(defun chriad/pdf-annot-previous-jump ()
  "jump to previous annotation from document buffer"
  (interactive)
  (ignore))

(defun chriad/pdf-annot-next-jump ()
  "jump to next annotation from document buffer"
  (interactive)
  (ignore))

;; calls pdf-annot-edit-contents
;; TODO does not work
(defun chriad/pdf-annot-edit-contents ()
  (interactive)
  (let ((a (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer)))
    (pdf-annot-edit-contents a))
  (tabulated-list-print t))

;; (pdf-annot-run-modified-hooks :change a) ;; NOTE: This will only update the pdf-view buffer, i.e. change highlight color
    ;; (tabulated-list-print))
;; (tabulated-list-print) ;; TODO does not work programatically but interactive


;; Quickly add content to field, workaround for chriad/pdf-annot-edit-contents
(defun chriad/pdf-annot-content-tag ()
  (interactive)
  (let ((a (pdf-annot-getannot (tabulated-list-get-id) pdf-annot-list-document-buffer)))
    (pdf-annot-put a 'contents (read-string "content>")))
  (tabulated-list-print t t))

(defun chriad/pdf-annot-with-annot-text ()
  (interactive)
  (let* ((a (chriad/annot-from-tablist))
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
      (mapconcat 'identity txt "　")))) ;;returns string


(defun chriad/pdf-annot-with-annot-text-copy-to-kill-ring ()
  (kill-new (mapconcat 'identity (chriad/pdf-annot-with-annot-text) " ")))


;; TODO mapconcat check hyphenation first bla- bli -> blabli
;; TODO bind to pdf-annot-list keymap
(defun chriad/pdf-annot-copy-highlight-text ()
  (interactive)
  (let* ((a (chriad/annot-from-tablist))
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
      (kill-new (mapconcat 'identity txt " "))
      )))

;; (defun chriad/pdf-annot-get-highlight-text (a)
;;   (interactive)
;;   (let* (page (pdf-annot-get a 'page))
;;         (edges (pdf-annot-get-display-edges a)))
;;     (with-current-buffer pdf-annot-list-document-buffer
;;       (pdf-view-goto-page page)
;;       (setq txt (mapcar
;;                  (lambda (edg)
;;                    (pdf-info-gettext
;;                     (pdf-view-current-page)
;;                     edg
;;                     pdf-view-selection-style))
;;                  edges))
;;       (kill-new (mapconcat 'identity txt " "))))


;; add as `Basic`: then in anki change note type to cloze
(defun chriad/pdf-annot-with-annot-text-as-anki-card ()
  (interactive)
  (require 'anki-connect)
  (let ((txt (chriad/pdf-annot-with-annot-text)))
    (anki-connect-add-note "map" "Basic" `(("Front" . ,txt) ("Back" . "")))))


;; TODO bind to key in annot-list-map
;; TODO also maybe hook to pdf-annot-activate-handler-function
(defun pdf-annot---edit-this-annot ()
  (interactive)
  (pdf-annot-edit-contents (pdf-annot-getannot (tabulated-list-get-id)
                                               pdf-annot-list-document-buffer)))

;; TODO to add pasting highlighted text, look at pdf-annot-edit-contents-noselect
(defun pdf-annot---edit-this-annot-highlight-text-as-content ()
  "open content (called context in tablist lingo) window here and paste highlighted text"
  (ignore))


;;; patches
(el-patch-feature pdf-annot)

(with-eval-after-load 'pdf-annot
;;;; pdf-annot-list-annotation
;;  inelegant way to get rid of comment window that lists the contents of this annotation with a header (date, author etc.)
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
;;;; pdf-annot-show-annotation
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

;;;; pdf-annot-list-display-annotation-from-id
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
                                 (pdf-annot-getannot id pdf-annot-list-document-buffer)))))

;;;; pdf-annot-print-property
  ;; concise time display
  (el-patch-defun pdf-annot-print-property (a property)
    "Pretty print annotation A's property PROPERTY."
    (let ((value (pdf-annot-get a property)))
      (cl-case property
        (color
         (propertize (or value "")
                     'face (and value
                                `(:background ,value))))
        ((created modified)
         (let ((date value))
           (if (null date)
               "No date"
             (el-patch-swap (current-time-string date) (format-time-string "%Y-%m" date))
             )))
        ;; print verbatim
        (subject
         (or value "No subject"))
        (opacity
         (let ((opacity (or value 1.0)))
           (format "%d%%" (round (* 100 opacity)))))
        (t (format "%s" (or value ""))))))
  )

;;; helpers

;; DEPRECATED, use -with-annot-text-
;; helm source for annotations
;; TODO momoize, write to sidecar, get checksum to see if something changed
;; TODO add action to edit highlighted text as annotation content (pdf-annot---edit-this-annot)
(defun chriad/pdf-annot-get-highlighted-text (a)
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
      ;; `(,@(mapconcat 'identity txt " ") . ,@(pdf-annot-get-id (a)))
      (mapconcat 'identity txt " ")
      )
    )
  )

;; TODO on RET, goto annotation
(defun chriad/pdf-annot-browse-annot-contents ()
  (interactive)
  (require 'helm)
  (setq annots (sort (pdf-annot-getannots nil
                                          '(highlight)
                                          pdf-annot-list-document-buffer)
                     #'pdf-annot-compare-annotations))
  (helm :sources (helm-build-in-buffer-source "test"
                   :action '(("ignore" . ignore))
                   :data (-map (lambda (x)
                                 (chriad/pdf-annot-get-highlighted-text x)) annots))
        :buffer "*helm pdf-annots*"))

;; when in annt buffer, pop up outline in same buffer
;; TODO change to the outline element corresponding to the current page
(defun chriad/outline-from-annots-buffer ()
  (interactive)
  (let ((pdf-outline-display-buffer-action '((display-buffer-reuse-window display-buffer-same-window) . nil)))
    (pdf-outline pdf-annot-list-document-buffer nil)))


;;; bindings
;; K: overwrite tablist-do-kill-lines
(use-package pdf-tools
  :defer 2
  :config
  (evilified-state-evilify-map pdf-annot-list-mode-map
    :mode  pdf-annot-list-mode
    :eval-after-load pdf-annot
    :bindings
    "J"                 'chriad/pdf-annot-next-page
    "K"                 'chriad/pdf-annot-previous-page
    "my"                'chriad/pdf-annot-with-annot-text-copy-to-kill-ring
    "mo"                'chriad/outline-from-annots-buffer
    "mE"                'pdf-annot---edit-this-annot-highlight-text-as-content
    "mt"                'chriad/pdf-annot-content-tag
    "me"                'chriad/pdf-annot-edit-contents
    "ma"                'chriad/pdf-annot-with-annot-text-as-anki-card
    "mh"                'chriad/pdf-annot-browse-annot-contents))

;;; end
