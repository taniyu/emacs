(use-package visual-regexp
  :bind (("C-c q" . vr/query-replace)
         ;; if you use multiple-cursors, this is for you:
         ("C-c m" . vr/mc-mark))
  )
