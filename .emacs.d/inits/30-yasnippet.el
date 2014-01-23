(add-to-list 'load-path "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/global-mode 1)
(yas/initialize)
(yas/load-directory "~/emacs/.emacs.d/plugins/yasnippet-0.6.1c/snippets/")
(yas/load-directory "~/emacs/.emacs.d/plugins/snippet")

(setq yas/prompt-functions '(yas/dropdown-prompt))

;; 既存スニペットを挿入
;; (define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; ;; 新規スニペットを作成するバッファを用意する
;; (define-key yas-minor-mode-map (kbd "C-x y n") 'yas-new-snippet)
;; ;; 既存スニペットの閲覧、編集
;; (define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file)
 
;; anything interface
;; (eval-after-load "anything-config"
;;   '(progn
;;      (defun my-yas/prompt (prompt choices &optional display-fn)
;;        (let* ((names (loop for choice in choices
;;                            collect (or (and display-fn (funcall display-fn choice))
;;                                        choice)))
;;               (selected (anything-other-buffer
;;                          `(((name . ,(format "%s" prompt))
;;                             (candidates . names)
;;                             (action . (("Insert snippet" . (lambda (arg) arg))))))
;;                          "*anything yas/prompt*")))
;;          (if selected
;;              (let ((n (position selected names :test 'equal)))
;;                (nth n choices))
;;            (signal 'quit "user quit!"))))
;;      (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
;;      (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))
