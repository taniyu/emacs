(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.03)

(key-chord-define-global "gl" 'goto-line)
(key-chord-define-global "gr" 'helm-git-grep)
