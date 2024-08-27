(el-patch-feature achievements-functions)
(with-eval-after-load 'achievements-functions
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
  )


(el-patch-feature achievements-functions)
(with-eval-after-load 'achievements-functions
    (el-patch-defconst achievements-file
      (expand-file-name ".achievements" "/home/chriad/.local/share/chezmoi/ignored/emacs/")
      "File to store the achievements in."))
