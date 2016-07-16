(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; 自動インストールの設定
(require 'cl)

(defvar installing-package-list
  '(
    ;; 使いたいパッケージ名を記述
    auto-complete
    coffee-mode
    company
    expand-region
    flycheck
    gitconfig-mode
    guide-key
    helm
    helm-descbinds
    helm-git-grep
    helm-gtags
    ibuffer-vc
    indent-guide
    js2-mode
    key-chord
    magit
    multiple-cursors
    php-mode
    projectile
    projectile-rails
    rainbow-mode
    rainbow-delimiters
    rhtml-mode
    slim-mode
    sass-mode
    web-mode
    yasnippet
    yaml-mode
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
