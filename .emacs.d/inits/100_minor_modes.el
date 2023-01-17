;;;;;;;;;;;;;iuiagent-mode;;;;;;;;;;;;;
(easy-mmode-define-minor-mode
 iuiagent-mode ;モード名
 "Minor mode for IUIAgent project." ;モードの説明
 nil ;初期値がONかどうか
 "IUIAgent mode" ;モードラインに表示される文字列
 nil)

;; F9でコンパイル
(add-hook 'iuiagent-mode-hook '(lambda ()
                                 (interactive)
                                 (local-set-key (kbd "<f9>")    ; キーバインドの設定
                                                '(lambda () (interactive) (compile "echo bingo1711 | sudo -S make install")))
                                 ))


