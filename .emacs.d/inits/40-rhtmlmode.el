;;; rhtml-mode
(add-to-list 'load-path "~/emacs/.emacs.d/plugins/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda ( (rinari-launch))))
