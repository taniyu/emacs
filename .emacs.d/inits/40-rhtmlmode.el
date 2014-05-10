;;; rhtml-mode
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-hook 'rhtml-mode-hook (lambda ( (rinari-launch))))
(set-face-background 'erb-face nil)
(set-face-underline-p 'erb-face t)
(set-face-background 'erb-exec-face nil)
(set-face-underline-p 'erb-exec-face t)
