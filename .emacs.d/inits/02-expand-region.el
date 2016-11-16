;; expand region
(use-package expand-region
  :bind (("C-c e r" . er/expand-region)
         ("C-c c r" . er/contract-region)
         )
  :config
  (transient-mark-mode t)
  )

