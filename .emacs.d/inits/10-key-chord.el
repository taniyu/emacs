(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.04)

(key-chord-define-global "gl" 'goto-line)
(key-chord-define-global "gr" 'helm-git-grep)
(key-chord-define-global "qr" 'query-replace-regexp)
(key-chord-define-global "fk" 'helm-for-files)
(key-chord-define-global "fj" 'helm-M-x)
