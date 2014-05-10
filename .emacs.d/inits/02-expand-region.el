;; expand region
(require 'expand-region)
(global-set-key (kbd "C-,") 'er/expand-region) ;; 広げる
(global-set-key (kbd "C-M-,") 'er/contract-region) ;; 狭める

(transient-mark-mode t)
