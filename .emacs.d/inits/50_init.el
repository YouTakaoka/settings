
;;; Load path setting
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; Force menu bar to be one line
(menu-bar-mode -1)
;;; Save backup and auto-save files into ~/.emacs.d/backup
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
(setq auto-save-file-name-transforms
        `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)
;;; splash screenを無効にする
(setq inhibit-splash-screen t)
;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)
;; C-u C-SPC C-SPC …でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)
;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
;; (require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+")
;;; ファイルを開いた位置を保存する
;; (require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))
;;; 釣合う括弧をハイライトする
(show-paren-mode 1)
;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)
;;; 現在行に色をつける
(global-hl-line-mode 1)
;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)
;;; シェルに合わせるため、C-hは後退に割り当てる
;(global-set-key (kbd "C-h") 'delete-backward-char)
;; C-hをBackSpaceキーに変更
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
;;; モードラインに時刻を表示する
(display-time)
;;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)
;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))
;;; ログの記録行数を増やす
(setq message-log-max 10000)
;;; 履歴をたくさん保存する
(setq history-length 1000)
;;; メニューバーとツールバーとスクロールバーを消す
(menu-bar-mode -1)
;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)
;;; automatically insert closing parenthesis
(electric-pair-mode 1)

;;;;;;;;;;;;;;;;;;;;;; paredit ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'paredit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; カスタマイズ
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; カスタマイズ用のファイルを設定
(setq custom-file "~/.emacs.d/custom_setttings.el")

;; カスタマイズ用ファイルをロード
(load custom-file t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 日本語の設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 環境に合わせた日本語文字コードに設定
;;  Windows => SJIS
;;  Linux => 環境変数 LANG から
;(set-language-environment "Japanese")

;; set-language-environment でうまくいかない場合に設定
;; (prefer-coding-system 'utf-8)

;; ファイルの文字コードだけ別に指定したい場合に設定
 (setq-default buffer-file-coding-system 'utf-8-unix) ; BOM 付き UTF-8

;;;;;;;;;;;;;;;;; Set line numbers ;;;;;;;;;;;;;;;
;; (require 'linum)            ;\左に行番号表示
(global-linum-mode)



;;;;;;;;;;;;;;;;;;;; SKK settings ;;;;;;;;;;;;;;;;;;
(setq skk-server-prog "/usr/local/bin/google-ime-skk") ; google-ime-skkの場所
(setq skk-server-inhibit-startup-server nil) ; 辞書サーバが起動していなかったときに Emacs からプロセスを立ち上げる
(setq skk-server-host "localhost") ; サーバー機能を利用
(setq skk-server-portnum 55100)     ; ポートはgoogle-ime-skk
(setq skk-share-private-jisyo t)   ; 複数 skk 辞書を共有

;;;;;;;;;;;;;;;;;;;;; flycheck settings ;;;;;;;;;;;;;;
(require 'flycheck)
; (require 'flycheck-java)

;; C++ mode
(add-hook 'c-mode-common-hook 'flycheck-mode)

;;;;;;;;;;;;;;;;;;;;; JDEE server ;;;;;;;;;;;;;;;;
(custom-set-variables
  '(jdee-server-dir "~/myJars")
 )

;;;;;;;;;;;;;;;;;;;;;;; Git関連 ;;;;;;;;;;;;;;;;;;
(require 'magit)
(define-key global-map (kbd "M-g") 'magit-status)


