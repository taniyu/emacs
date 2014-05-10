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
    yasnippet
    helm
    helm-descbinds
    yaml-mode
    slim-mode
    js2-mode
    magit
    gitconfig-mode
    flycheck
    rinari
    rhtml-mode
    php-mode
    expand-region
    multiple-cursors
    web-mode
    rainbow-mode
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
