(add-to-list 'load-path (expand-file-name "~/emacs/.emacs.d/elisp/popwin-el-master"))
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

