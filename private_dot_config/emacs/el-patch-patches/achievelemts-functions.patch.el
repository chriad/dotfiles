;;; helpers
(defun achievements-goto-definition ()
    "Go to the source of this achievement. Traverse achievements-list and extract source"
  (ignore))

;; (defun achievements-disable ()
;;   "Disable the current achievement.
;; This expects to be called from `achievements-list-mode'."
;;   (interactive)
;;   (let* ((id (tabulated-list-get-id))
;;          (achievement (achievements-get-achievements-by-name id)))
;;     (when (and achievement
;;                (y-or-n-p "Do you really want to disable this achievement? "))
;;       (setf (emacs-achievement-predicate achievement) nil)
;;       (revert-buffer))))


;;; patches
(el-patch-feature achievements-functions)
(with-eval-after-load 'achievements-functions

  ;; change config file location
  (el-patch-defconst achievements-file
    (expand-file-name ".achievements" "/home/chriad/.local/share/chezmoi/ignored/emacs/")
    "File to store the achievements in.")

  (el-patch-defun achievements-earned-message (achievement)
    "Display the message when an achievement is earned."
    (message "ACHIEVEMENT UNLOCKED: You've earned the `%s' achievement!"
             (emacs-achievement-name achievement))
    (require 'notifications)
    (notifications-notify :title (format "ACHIEVEMENT UNLOCKED: You've earned the `%s' achievement!"
                                         (emacs-achievement-name achievement)
                                         :body (format "You've earned the `%s' achievement! [%s]"
                                                       (emacs-achievement-name achievement)
                                                       (emacs-achievement-description achievement))))
    (with-current-buffer (get-buffer-create "*achievements-log*")
      (goto-char (point-min))
      (when (> (buffer-size) 0)
        (insert "\n")
        (goto-char (point-min)))
      (insert (format "You've earned the `%s' achievement! [%s]"
                      (emacs-achievement-name achievement)
                      (emacs-achievement-description achievement)))))


  ;; modify default keybindings
  (el-patch-defvar achievements-list-mode-map
    (let ((map (make-sparse-keymap)))
      (set-keymap-parent map tabulated-list-mode-map)
      (define-key map "d" 'achievements-disable)
      (define-key map "g" 'achievements-goto-definition)
      (define-key map "r" 'revert-buffer) ;; recalculate list
      ;; (define-key map "t" 'achievements-toggle-show-disabled)
      map)
    "Local keymap for `achievements-list-mode' buffers.")


  )
