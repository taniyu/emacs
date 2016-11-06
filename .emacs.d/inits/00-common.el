(custom-set-variables
 ;自動保存しない
 '(auto-save-default nil)
 ;自動保存ファイルの名前を記録しない
 '(auto-save-list-file-name nil t)
 ;自動保存ファイルリストを初期化しない
 '(auto-save-list-file-prefix nil)
 ;何文字目かを表示
 '(column-number-mode t)
 ;バックアップファイルを作成しない
 ;;'(delete-auto-save-files t)
 ;時計を表示
 ;'(display-time-mode t)
 ;タブをスペースに変換
 '(indent-tabs-mode nil)
 ;バックアップファイルを作らない
 ;'(make-backup-files nil)
 ; メニューバー非表示
 '(menu-bar-mode nil)
 ; ツールバー非表示
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
 ;対応する括弧の表示
 '(show-paren-mode t))

;; バックアップファイルの作成場所を変更
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/emacs/.emacs.d/backup"))
        backup-directory-alist))
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/emacs/.emacs.d/backup/") t)))

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq-default tab-width 2)
;; スタートアップページを表示しない
(setq inhibit-startup-message t)
;; Shift+カーソルキーによるウィンドウ移動
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-n") 'next-multiframe-window)
;; 前のウィンドウへ移動
(define-key global-map (kbd "C-M-p") 'previous-multiframe-window)

;; カーソルの位置が何文字目かを表示
;(column-number-mode t)
;; ウインドの上部に関数名を表示
;(which-function-mode 1)
;; C-kで行全体を削除
(setq kill-whole-line t)
;; C-x bでミニバッファにバッファ候補を表示
;(iswitchb-mode t)
;(iswitchb-default-keybindings)
;; (yes/no) を (y/n)に
(fset 'yes-or-no-p 'y-or-n-p)
;; キーバインド
;; C-h をバックスペースに
(global-set-key "\C-h" 'delete-backward-char)

;; 背景色: 黒
(custom-set-faces '(default ((t (
  :foreground "white"      ; 前景色: 白
  :background "black"))))) ; 背景色: 黒

;; 透明度: 80%
(add-to-list 'default-frame-alist '(alpha . 85))
 
;; タイトルバー: バッファ名 - emacs@コンピュータ名
(setq-default frame-title-format (format "%%b - emacs@%s" (system-name)))

;;文字の色つけ-
(global-font-lock-mode t)

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-delay 0)                              ; 表示までの秒数: 0秒
(setq show-paren-style 'expression)                    ; 括弧内もハイライト
(set-face-background 'show-paren-match-face nil)       ; 背景色: なし
(set-face-underline-p 'show-paren-match-face "yellow") ; 下線色: 黄

;; 閉じ括弧の入力でカーソルを左に移動
;;(defun my-insert-bracket-general (lbrackets rbracket)
;;  (insert rbracket)
;;  (when (memq (char-before (1- (point))) lbrackets)
;;    (backward-char)))
;;(defun my-insert-paren ()
;;  (interactive) (my-insert-bracket-general '(?\() ?\)))
;;(defun my-insert-brace ()
;;  (interactive) (my-insert-bracket-general '(?{) ?}))
;;(defun my-insert-bracket ()
;;  (interactive) (my-insert-bracket-general '(?\[) ?\]))
;;(defun my-insert-angle ()
;;  (interactive) (my-insert-bracket-general '(?<) ?>))
;;(defun my-insert-dquote ()
;;  (interactive) (my-insert-bracket-general '(?\") ?\"))
;;(defun my-insert-squote ()
;;  (interactive) (my-insert-bracket-general '(?' ?`) ?'))
;;(global-set-key "\)" 'my-insert-paren)
;;(global-set-key "}"  'my-insert-brace)
;;(global-set-key "\]" 'my-insert-bracket)
;;(global-set-key ">"  'my-insert-angle)
;;(global-set-key "\"" 'my-insert-dquote)
;;(global-set-key "'"  'my-insert-squote)
(require 'flex-autopair)
(flex-autopair-mode 1)


;; バッファ名を一意に識別できるようにする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;; 選択範囲に色を付ける
(setq transient-mark-mode t)

;; window幅に合わせて分割数を変更
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
        (split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

