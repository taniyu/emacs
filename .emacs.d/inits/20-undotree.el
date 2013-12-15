(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/"))
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))
