(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; `app/views/application`と`app/views/shared`のビューも探す候補に入れる
(defun projectile-rails-goto-template-at-point ()
  (interactive)
  (let* ((template (projectile-rails-filename-at-point))
         (dir (projectile-rails-template-dir template))
         (name (projectile-rails-template-name template))
         (format (projectile-rails-template-format template)))
    (if format
        (loop for processor in '("erb" "haml" "slim")
              for template = (s-lex-format "${dir}${name}.${format}.${processor}")
              for partial = (s-lex-format "${dir}_${name}.${format}.${processor}")
              for partial-2 = (expand-file-name
                               (s-lex-format "_${name}.${format}.${processor}")
                               (projectile-expand-root "app/views/application"))
              for partial-3 = (expand-file-name
                               (s-lex-format "_${name}.${format}.${processor}")
                               (projectile-expand-root "app/views/shared"))
              until (or
                     (projectile-rails-ff template)
                     (projectile-rails-ff partial)
                     (projectile-rails-ff partial-2)
                     (projectile-rails-ff partial-3)))
      (message "Could not recognize the template's format")
      (dired dir))))

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
