(setq inhibit-splash-screen t)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/org/")
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "")

(server-start)
(setq dired-listing-switches "-aBhl  --group-directories-first")
;(load "~/.emacs.d/gnuserv")

;(modify-frame-parameters nil '((wait-for-wm . nil)))

;(setq x-select-enable-clipboard t)
;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;;(load "~/.emacs.d/ess-5.3.4/lisp/ess-site")
(load "~/.emacs.d/post")
(load "~/.emacs.d/csv-mode")

(load "~/.emacs.d/ps-ccrypt")
(require 'ps-ccrypt "ps-ccrypt.el")

(setq default-major-mode 'org-mode)

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'post-mode-hook 'flyspell-mode)
(add-hook 'post-mode-hook 'turn-off-auto-fill)


(require 'printing)
     ;; The following lines are always needed.  Choose your own keys.
     (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
     (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
     (global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)

(defun volatile-kill-buffer ()
   "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))

(global-set-key (kbd "C-x k") 'volatile-kill-buffer)     ;; Unconditionally kill unmodified buffers


(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(global-visual-line-mode 1)
(setq TeX-PDF-mode t)

(defun unfill-region (begin end)
  "Remove all linebreaks in a region but leave paragraphs, 
  indented text (quotes,code) and lines starting with an asterix (lists) intakt."
  (interactive "r")
  (replace-regexp "\\([^\n]\\)\n\\([^ *\n]\\)" "\\1 \\2" nil begin end))

;(require 'org-export-latex)

;(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(autoload 'no-word-find-file "~/.emacs.d/no-word" "open word document" t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Liberation Mono"))))
 '(cursor ((t (:background "#ffffff")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(org-directory "~/Desktop/org")
 '(org-mobile-directory "~/Ubuntu One/MobileOrg")
 '(org-mobile-inbox-for-pull "~/Desktop/org/from-mobile.org")
 '(show-paren-mode t))
