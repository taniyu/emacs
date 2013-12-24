(add-to-list 'load-path "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
;;(require 'anything-c-yasnippet)
(yas/global-mode 1)
(yas/initialize)
(yas/load-directory "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c/snippets/")
(yas/load-directory "~/emacs/.emacs.d/plugins/snippet")
(yas/load-directory "~/emacs/.emacs.d/plugins/yasnippets_rails/rails-snippets")

(setq yas/next-field-key "TAB")
(setq yas/prev-field-key "<s-tab>")
;; 既存スニペットを挿入
(define-key yas/minor-mode-map (kbd "C-x y i") 'yas/insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas/minor-mode-map (kbd "C-x y n") 'yas/new-snippet)
;; 既存スニペットの閲覧、編集
(define-key yas/minor-mode-map (kbd "C-x y v") 'yas/visit-snippet-file)
