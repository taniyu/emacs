;; (add-to-list 'load-path "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
;;(require 'anything-c-yasnippet)
;; (yas-global-mode 1)
;; (yas-initialize)
;; (yas/load-directory "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c/snippets/")
;; (yas/load-directory "~/emacs/.emacs.d/plugins/snippet")
;; (yas/load-directory "~/emacs/.emacs.d/plugins/yasnippets_rails/rails-snippets")
;;(setq yas/prompt-functions '(yas/dropdown-prompt))

(setq yas-snippet-dirs
      '("~/emacs/.emacs.d/plugins/snippet"
        "~/emacs/.emacs.d/plugins/yasnippets_rails/rails-snippets"
        "~/.emacs.d/elpa/yasnippet-20150811.1222/snippets"
        ))
(yas-global-mode 1)
;; (yas-initialize)

;; (setq yas/next-field-key "TAB")
;; (setq yas/prev-field-key "<s-tab>")
;; 既存スニペットを挿入
(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x y n") 'yas-new-snippet)
;; 既存スニペットの閲覧、編集
(define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file)

;; anything interface
(eval-after-load "helm-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (helm-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*helm yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
     (define-key helm-command-map (kbd "y") 'yas/insert-snippet)))

