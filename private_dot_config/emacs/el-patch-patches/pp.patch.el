(el-patch-defun eval-expression (exp &optional insert-value no-truncate char-print-limit)
  "Evaluate EXP and print value in the echo area.
When called interactively, read an Emacs Lisp expression and
evaluate it.  Value is also consed on to front of the variable
`values'.  Optional argument INSERT-VALUE non-nil (interactively,
with a non `-' prefix argument) means insert the result into the
current buffer instead of printing it in the echo area.

Normally, this function truncates long output according to the
value of the variables `eval-expression-print-length' and
`eval-expression-print-level'.  When NO-TRUNCATE is
non-nil (interactively, with a prefix argument of zero), however,
there is no such truncation.

If the resulting value is an integer, and CHAR-PRINT-LIMIT is
non-nil (interactively, unless given a non-zero prefix argument)
it will be printed in several additional formats (octal,
hexadecimal, and character).  The character format is used only
if the value is below CHAR-PRINT-LIMIT (interactively, if the
prefix argument is -1 or the value doesn't exceed
`eval-expression-print-maximum-character').

Runs the hook `eval-expression-minibuffer-setup-hook' on entering the
minibuffer.

If `eval-expression-debug-on-error' is non-nil, which is the default,
this command arranges for all errors to enter the debugger."
  (interactive
   (cons ((el-patch-swap read--expression pp-read--expression) "Eval: ")
         (eval-expression-get-print-arguments current-prefix-arg)))

  (let (result)
    (if (null eval-expression-debug-on-error)
        (setq result
              (values--store-value
               (eval (let ((lexical-binding t)) (macroexpand-all exp)) t)))
      (let ((old-value (make-symbol "t")) new-value)
        ;; Bind debug-on-error to something unique so that we can
        ;; detect when evalled code changes it.
        (let ((debug-on-error old-value))
          (setq result
	        (values--store-value
                 (eval (let ((lexical-binding t)) (macroexpand-all exp)) t)))
	  (setq new-value debug-on-error))
        ;; If evalled code has changed the value of debug-on-error,
        ;; propagate that change to the global binding.
        (unless (eq old-value new-value)
	  (setq debug-on-error new-value))))

    (el-patch-swap (let ((print-length (unless no-truncate eval-expression-print-length))
          (print-level  (unless no-truncate eval-expression-print-level))
          (eval-expression-print-maximum-character char-print-limit)
          (deactivate-mark))
      (let ((out (if insert-value (current-buffer) t)))
        (prog1
            (prin1 result out)
          (let ((str (and char-print-limit
                          (eval-expression-print-format result))))
            (when str (princ str out))))))
    (let ((print-length     pp-eval-expression-print-length)
          (print-level      pp-eval-expression-print-level)
          (deactivate-mark  nil))
      (cond (insert-value
             (message "Evaluating...done. Value inserted.")
             (setq insert-value  (prefix-numeric-value insert-value))
             (if (or (not (stringp (car values))) (wholenump insert-value))
                 (pp (car values) (current-buffer))
               (princ (car values) (current-buffer))))
            (t (pp-display-expression (car values) "*Pp Eval Output*")))
      (car values)))
    ))
