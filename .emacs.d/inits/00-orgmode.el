(setq org-startup-truncated nil)
;; DONEの時刻を記録
(setq org-log-done 'time)
(defun change-truncation()
  (interactive)
  (cond ((eq truncate-lines nil)
         (setq truncate-lines t))
        (t
         (setq truncate-lines nil))))
