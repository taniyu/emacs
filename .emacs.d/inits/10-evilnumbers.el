(add-to-list 'load-path (expand-file-name "~/emacs/.emacs.d/elisp/"))
(autoload 'evil-numbers "evil-numbers", nil t)
;; (smartrep-define-key
;;     global-map "C-c" '(("+" . 'evil-numbers/inc-at-pt)
;;                        ("-" . 'evil-numbers/dec-at-pt)))
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
