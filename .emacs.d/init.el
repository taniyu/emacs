;; ~/emacs/.emacs.d/site-lisp 
(let ((default-directory (expand-file-name "~/emacs/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/emacs/.emacs.d/inits")

