﻿;; expand region
(add-to-list 'load-path "~/emacs/.emacs.d/plugins/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

(transient-mark-mode t)