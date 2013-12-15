(add-to-list 'load-path "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/global-mode 1)
(yas/initialize)
(yas/load-directory "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c/snippets/")
(yas/load-directory "~/emacs/.emacs.d/plugins/snippet")

