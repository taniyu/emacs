(add-to-list 'load-path (expand-file-name "~/emacs/.emacs.d/elisp/"))
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))
