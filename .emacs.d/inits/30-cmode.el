(add-hook 'c-mode-common-hook '(lambda ()
  ;(c-set-style "stroustrup")     ; インデントスタイル
  (setq c-basic-offset 2 indent-tabs-mode nil)        ; インデント幅: 2
  ;(c-toggle-auto-hungry-state t) ; DELで左側の空白を全削除
  ;(c-toggle-auto-hungry-state 1) ; ;の入力で改行
  (c-toggle-hungry-state 1) ; ;の入力で改行
  ;(setq c-hanging-braces-alist '((substatement-open after)
  ;(substatement-close before)))  ; {}の入力の後に改行
  ;; オートインデント
  ;(define-key c-mode-base-map "\C-m" 'newline-and-indent)
  ;(local-unset-key "\)")
  ;(local-unset-key "}")
  ;(local-unset-key ">")
))
