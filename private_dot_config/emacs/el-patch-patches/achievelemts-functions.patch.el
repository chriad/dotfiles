;;; helpers
(defun achievements-goto-definition ()
    "Go to the source of this achievement"
  (ignore))



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
    (let ((map (make-sparse-keymap))
          (menu-map (make-sparse-keymap "Achievements")))
      (set-keymap-parent map tabulated-list-mode-map)
      (define-key map "d" 'achievements-disable)
      ;; (define-key map "t" 'achievements-toggle-show-disabled)
      (define-key map [menu-bar achievements-menu] (cons "Achievements" menu-map))
      (define-key menu-map [mq]
                  '(menu-item "Quit" quit-window
                              :help "Quit Viewing Achievements"))
      (define-key menu-map [s1] '("--"))
      (define-key menu-map [mn]
                  '(menu-item "Next" next-line
                              :help "Next Line"))
      (define-key menu-map [mp]
                  '(menu-item "Previous" previous-line
                              :help "Previous Line"))
      (define-key menu-map [s2] '("--"))
      (define-key menu-map [md]
                  '(menu-item "Disable" achievements-disable
                              :help "Disable an achievement. It won't show up in this list, and you can never earn it"))
      (define-key menu-map [s3] '("--"))
      (define-key menu-map [mg]
                  '(menu-item "Refresh list" revert-buffer
                              :help "Recalculate this list"))
      map)
    "Local keymap for `achievements-list-mode' buffers.")

  )
