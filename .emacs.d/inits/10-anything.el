(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/"))

(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)
;; (defun my/anything-dired ()
;;   (interactive)
;;   (let ((curbuf (current-buffer)))
;;     (if (anything-other-buffer
;;          '(anything-c-source-files-in-current-dir+)
;;          " *anything-dired*")
;;         (kill-buffer curbuf))))

;; (define-key dired-mode-map (kbd ";") 'my/anything-dired)
