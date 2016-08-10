(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.04)

(key-chord-define-global "uu" (lambda ()
                                (interactive)
                                (switch-to-buffer nil)))
