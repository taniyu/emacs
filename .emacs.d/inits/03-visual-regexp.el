﻿(add-to-list 'load-path "~/emacs/.emacs.d/elisp")

(require 'visual-regexp)
;;(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
