(require 'anzu)

(global-anzu-mode +1)
(set-face-attribute 'anzu-mode-line nil
                    :foreground "black" :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))
;;(global-set-key (kbd "C-c r") 'anzu-query-replace)
;;(global-set-key (kbd "C-c R") 'anzu-query-replace-regexp)
