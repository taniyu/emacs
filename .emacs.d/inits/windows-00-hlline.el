(add-to-list 'load-path (expand-file-name "~/emacs/.emacs.d/elisp/"))

;; 現在行のハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
;;     (:background "magenta"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
;;     (:background  "magenta"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)
