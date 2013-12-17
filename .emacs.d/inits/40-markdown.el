;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
"Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; markdownのコマンドのパス追加
(setq markdown-command "perl C:/Perl/site/bin/Markdown.pl")
