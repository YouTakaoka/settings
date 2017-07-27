
;;; Load path setting
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; パッケージの設定
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)
;;; splash screenを無効にする
(setq inhibit-splash-screen t)
;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)
;; C-u C-SPC C-SPC …でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)
;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+")
;;; ファイルを開いた位置を保存する
(require 'saveplace)
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
(global-set-key (kbd "C-h") 'delete-backward-char)
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
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;; automatically insert closing parenthesis
(electric-pair-mode 1)

;;;;;;;;;;;;;;;;;;;;;; paredit ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'paredit)


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
 (setq-default buffer-file-coding-system 'utf-8-with-signature) ; BOM 付き UTF-8

;;;;;;;;;;;;;;;;; Set line numbers ;;;;;;;;;;;;;;;
(require 'linum)            ;\左に行番号表示
(global-linum-mode)

;;;;;;;;;;;;;;;;;; SKK settings ;;;;;;;;;;;;;;;;;
;; make what-whereでSKK modulesで表示されるディレクトリを指定
(add-to-list 'load-path "/usr/local/share/emacs/24.3/site-lisp/skk")
;; M-x skk-tutorialでNo file found as 〜とエラーが出たときにskk-tut-fileを設定
;; make what-whereでSKK tutorialsで表示されるディレクトリ上のSKK.tutを指定
(setq skk-tut-file "/usr/share/skk/SKK.tut")
(require 'skk)
(global-set-key "\C-x\C-j" 'skk-mode)

(setq skk-server-prog "/usr/local/bin/google-ime-skk") ; google-ime-skkの場所
(setq skk-server-inhibit-startup-server nil) ; 辞書サーバが起動していなかったときに Emacs からプロセスを立ち上げる 
(setq skk-server-host "localhost") ; サーバー機能を利用
(setq skk-server-portnum 55100)     ; ポートはgoogle-ime-skk
(setq skk-share-private-jisyo t)   ; 複数 skk 辞書を共有


;;;;;;;;;;;;;; Font settings ;;;;;;;;;;;;;;;;;;;;;
(cond (window-system
       (set-default-font "Monospace")
       (set-fontset-font (frame-parameter nil 'font)
                         'japanese-jisx0208
                         '("Takaoゴシック" . "unicode-bmp")
                         )))


;;;;;;;;;;;;;; auto-install settings ;;;;;;;;;;;;
(setq auto-install-use-wget t)
;; (install-elisp-from-emacswiki "auto-install.el")
(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'auto-install)
;; Add Emacs Lisp installed by auto-install to the load path.
;; Default is ~/.emacs.d/auto-install/
(add-to-list 'load-path auto-install-directory)
;; Add the page name of EmacsWiki to the auto-complition candidates.
(auto-install-update-emacswiki-package-name t)
;; Set comptibility mode of install-elisp.el
(auto-install-compatibility-setup)
;; Integrate the buffers associated with ediff into single frame.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;;;;;;;;;;;;;;;;;;;;;;; flycheck ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;; flymake ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flymake)

;; Java
(add-hook 'java-mode-hook 'flymake-mode-on)

(defun my-java-flymake-init ()
  (list "javac" (list (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-with-folder-structure))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.java$" my-java-flymake-init flym))


;;;;;;;;;;;;;;;;;;;;;;;; mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))

;; python-mode
(autoload 'python-mode "python-mode" "Python editing mode." t)
(custom-set-variables
 '(py-indent-offset 4)
 )
(add-hook 'python-mode-hook
          '(lambda()
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             )
          )

;;;;;;;;;;;;;;;;;;;;;;;; backup ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;set backup directory to the "backup" directory
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
        backup-directory-alist))
;;set auto-save directory to the "backup" directory
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backup/") t)))

;;;;;;;;;;;;;;;;;;;;;;;; sticky settings ;;;;;;;;;;;;;;;;;;;
;; (require 'sticky)
;; (use-sticky-key ";" sticky-alist:ja)    ; for japanese keyboards

;;;;;;;;;;;;;;;;;;;;;;;; key-bind settings ;;;;;;;;;;;;;;;;;
;; C-c x: Execute script
(define-key global-map (kbd "C-c x") 'quickrun)

;; C-c c: Compile
(define-key global-map (kbd "C-c c") 'compile)

;;  C-z: Move window 
(define-key global-map (kbd "C-z") 'other-window)

;; Assign helm-mini to M-RET
(define-key global-map (kbd "M-RET") 'helm-mini)

;; C-c C-v: Mark set
(define-key global-map (kbd "C-c C-v") 'set-mark-command)

;; C-c SPC: Copy region  
(define-key global-map (kbd "C-c SPC") 'kill-ring-save)

;; C-c l  : Copy line
(define-key global-map (kbd "C-c l") 'quick-copy-line)
(fset 'quick-copy-line
   "\C-@\C-e\C-[w\C-f")


;;;;;;;;;;;;;;;;;;;;;;; point-undo ;;;;;;;;;;;;;;;;;;;
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)

;;;;;;;;;;;;;;;;;;;;;;;; helm settings ;;;;;;;;;;;;;;;
(require 'helm-config)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;; auto-complete settings ;;;;;;;;;;;;;;;
(require 'auto-complete-config)
(global-auto-complete-mode 1)

(provide 'init)
;;; init.el ends here

