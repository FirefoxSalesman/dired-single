(require 'dired)

(defun dired-single-do (proc cond)
  (let ((old-buffer (buffer-name)))
   (funcall proc)
   (if (and (equal major-mode 'dired-mode) cond)
       (kill-buffer old-buffer))))

(defun dired-single-next ()
  (interactive)
  (dired-single-do 'dired-find-file (f-directory? (dired-get-file-for-visit))))

(defun dired-single-prev ()
  (interactive)
  (dired-single-do 'dired-up-directory t))

(provide 'dired-single)
