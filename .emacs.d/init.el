;;; el-get settings
(add-to-list 'load-path "~/.emacs.d/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;;;;;;;;;;;;;;;;;;;;;;; packages ;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
(el-get-bundle auto-complete)

;; ddskk
(el-get-bundle ddskk)

;; helm
(el-get-bundle helm)

;; flycheck
(el-get-bundle flycheck)

;; eclim
;; (el-get-bundle eclim)

;; jdee
(el-get-bundle jdee)

;; memoize
(el-get-bundle memoize)

;; php-mode
(el-get-bundle php-mode)

;; quickrun
(el-get-bundle quickrun)

;; magit
(el-get-bundle magit)

;; init-loader
(el-get-bundle init-loader)
(init-loader-load)

