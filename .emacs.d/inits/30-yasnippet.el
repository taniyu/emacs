(use-package yasnippet
  :init
  (yas-global-mode 1)
  :bind (:map yas-minor-mode-map
         ("C-x y i" . yas-insert-snippet) ;; 既存スニペットを挿入
         ("C-x y n" . yas-new-snippet) ;; 新規スニペットを作成するバッファを用意する
         ("C-x y v" . yas-visit-snippet-file)) ;; 既存スニペットの閲覧、編集
  :config
  (setq yas-snippet-dirs
        '("~/emacs/.emacs.d/plugins/snippet"
          "~/emacs/.emacs.d/plugins/yasnippets_rails/rails-snippets"
          yas-installed-snippets-dir
          ))
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
  )
