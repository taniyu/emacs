(add-to-list 'load-path (expand-file-name "~/emacs/.emacs.d/elisp/"))
(autoload 'ruby-mode "ruby-mode")
;(autoload 'run-ruby "inf-ruby")
;(autoload 'inf-ruby-keys "inf-ruby")
(global-set-key "\C-crb" 'ruby-mode)
;; .rbを関連付け
(setq auto-mode-alist
  (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist
  (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(setq ruby-deep-indent-paren-style nil)
;(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
;; インデント幅: 4
;(add-hook 'ruby-mode-hook '(lambda () (setq ruby-indent-level 2)))
(setq ruby-indent-level 2)
;(setq ruby-indent-tabs-mode nil)
;; ruby-electric
;(autoload 'ruby-electric "ruby-electric")
;(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;(setq ruby-electric-expand-delimiters-list nil)
;; encodeを入力しないようにする
(defun ruby-mode-set-encoding () nil)
