;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;; el-get settings
(add-to-list 'load-path "~/.emacs.d/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; load-path setting
(add-to-list 'load-path "~/.emacs.d/bin")

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

;; yatex
(el-get-bundle yatex)
;;
;; YaTeX
;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|atril\\|xreader\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|MicrosoftEdge\\|microsoft-edge\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
(setq tex-command "ptex2pdf -u -l -ot '-synctex=1'")
;(setq tex-command "lualatex -synctex=1")
;(setq tex-command "latexmk")
;(setq tex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e '$lualatex=q/lualatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -norc -gg -pdflua")
(setq bibtex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq makeindex-command  "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
;(setq dvi2-command "xdg-open")
(setq dvi2-command "evince")
;(setq dvi2-command "atril")
;(setq dvi2-command "okular --unique")
;(setq dvi2-command "zathura -x \"emacsclient --no-wait +%{line} %{input}\"")
;(setq dvi2-command "qpdfview --unique")
;(setq dvi2-command "texworks")
;(setq dvi2-command "texstudio --pdf-viewer-only")
;(setq tex-pdfview-command "xdg-open")
(setq tex-pdfview-command "evince")
;(setq tex-pdfview-command "atril")
;(setq tex-pdfview-command "okular --unique")
;(setq tex-pdfview-command "zathura -x \"emacsclient --no-wait +%{line} %{input}\"")
;(setq tex-pdfview-command "qpdfview --unique")
;(setq tex-pdfview-command "texworks")
;(setq tex-pdfview-command "texstudio --pdf-viewer-only")
(setq dviprint-command-format "wine cmd /c start AcroRd32.exe `echo %s | sed -e \"s/\\.[^.]*$/\\.pdf/\"`")
(require 'dbus)
(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))
(defun evince-inverse-search (file linecol &rest ignored)
  (let* ((fname (decode-coding-string (url-unhex-string (un-urlify file)) 'utf-8))
         (buf (find-file fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col))
      (x-focus-frame (selected-frame)))))
(dbus-register-signal
 :session nil "/org/gnome/evince/Window/0"
 "org.gnome.evince.Window" "SyncSource"
 'evince-inverse-search)
(with-eval-after-load 'yatexprc
  (defun YaTeX-preview-jump-line ()
    "Call jump-line function of various previewer on current main file"
    (interactive)
    (save-excursion
      (save-restriction
        (widen)
        (let*((pf (or YaTeX-parent-file
                      (save-excursion (YaTeX-visit-main t) (buffer-file-name))))
              (pdir (file-name-directory pf))
              (bnr (substring pf 0 (string-match "\\....$" pf)))
              ;(cf (file-relative-name (buffer-file-name) pdir))
              (cf (buffer-file-name)) ;2016-01-08
              (buffer (get-buffer-create " *preview-jump-line*"))
              (line (count-lines (point-min) (point-end-of-line)))
              (previewer (YaTeX-preview-default-previewer))
              (cmd (cond
                    ((string-match "Skim" previewer)
                     (format "%s %d '%s.pdf' '%s'"
                             YaTeX-cmd-displayline line bnr cf))
                    ((string-match "evince" previewer)
                     (format "%s '%s.pdf' %d '%s'"
                             "fwdevince" bnr line cf))
                    ((string-match "sumatra" previewer)
                     (format "%s \"%s.pdf\" -forward-search \"%s\" %d"
                             previewer bnr cf line))
                    ((string-match "zathura" previewer)
                     (format "%s --synctex-forward '%d:0:%s' '%s.pdf'"
                             previewer line cf bnr))
                    ((string-match "qpdfview" previewer)
                     (format "%s '%s.pdf#src:%s:%d:0'"
                             previewer bnr cf line))
                    ((string-match "okular" previewer)
                     (format "%s '%s.pdf#src:%d %s'"
                             previewer bnr line (expand-file-name cf)))
                    )))
          (YaTeX-system cmd "jump-line" 'noask pdir))))))
(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))
;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; latex-math-preview
;; (el-get-bundle latex-math-preview)
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
(add-hook 'yatex-mode-hook
         '(lambda ()
         ;; (YaTeX-define-key "p" 'latex-math-preview-expression)
         ;; (YaTeX-define-key "\C-p" 'latex-math-preview-save-image-file)
         ;; (YaTeX-define-key "j" 'latex-math-preview-insert-symbol)
         ;; (YaTeX-define-key "\C-j" 'latex-math-preview-last-symbol-again)
         ;; (YaTeX-define-key "\C-b" 'latex-math-preview-beamer-frame)))
         (local-set-key "\C-cp" 'latex-math-preview-expression)
         (local-set-key "\C-c\C-p" 'latex-math-preview-save-image-file)
         (local-set-key "\C-cj" 'latex-math-preview-insert-symbol)
         (local-set-key "\C-c\C-j" 'latex-math-preview-last-symbol-again)
         (local-set-key "\C-c\C-b" 'latex-math-preview-beamer-frame)))

(setq latex-math-preview-in-math-mode-p-func 'YaTeX-in-math-mode-p)
(setq latex-math-preview-command-path-alist
      '((latex . "/usr/local/texlive/2021/bin/x86_64-linux/latex") (dvipng . "/usr/local/texlive/2021/bin/x86_64-linux/dvipng") (dvips . "/usr/local/texlive/2021/bin/x86_64-linux/dvips")))

