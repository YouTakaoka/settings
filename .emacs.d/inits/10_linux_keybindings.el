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

;; reload buffer
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
