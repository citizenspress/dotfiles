
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (package-initialize)



(server-start) 

(setq initial-scratch-message nil)

(display-time)

(prefer-coding-system locale-coding-system)

(transient-mark-mode 1)

(when (not window-system)
  (set-keyboard-coding-system locale-coding-system)
  (set-terminal-coding-system locale-coding-system)
)


(require 'ob-css)
(require 'ox-publish)

(xterm-mouse-mode t)


;;SET MAJOR MODE TO ORG
(setq default-major-mode 'org-mode)
(global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-cb" 'org-iswitchb)




;;SCROLLING
(setq scroll-conservatively 10000)
;;(setq auto-window-vscroll nil)

;;LOAD FLYSPELL FOR EVERYTHING WRITING

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(org-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(latex-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))


;;LOAD CCENCRYPT
(setq load-path (cons "/home/graham/.emacs.d/lisp" load-path))
;;(require 'ps-ccrypt "ps-ccrypt.el")



;;POST MODE FOR MUTT
(load "~/.emacs.d/post")
(add-hook 'post-mode-hook 
  (lambda()
(auto-fill-mode -1)
    (setq fill-column 72)    rfc 1855 for usenet messages
    ))
(dolist (hook '(post-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))




;;PHP MODE
(autoload 'php-mode "~/.emacs.d/php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode)) 



;;XMPP CHAT
;;(load "jabber-autoloads")

;;   (add-hook 'jabber-chat-mode-hook 'goto-address)
;    (require 'autosmiley)
;    (add-hook 'jabber-chat-mode-hook 'autosmiley-mode)



;;DO INLINE WORDCOUNT
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)


;;CSV MODE
;;(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
;;(autoload 'csv-mode "csv-mode" "Major mode for editing comma-separated value files." t)

;;DISABLE BELL FUNCTION
(setq ring-bell-function 'ignore)

;;CURRENT BUFFER NAME IN TITLE BAR
(setq frame-title-format "%b")

(setq inhibit-startup-echo-area-message "graham")


;;UNFILL DAMNIT!
(defun unfill-region (begin end)
  "Remove all linebreaks in a region but leave paragraphs, 
  indented text (quotes,code) and lines starting with an asterix (lists) intakt."
  (interactive "r")
  (replace-regexp "\\([^\n]\\)\n\\([^ *\n]\\)" "\\1 \\2" nil begin end))


;;MORE UNFILL
;Stefan Monnier <foo at acm.org>. It is the opposite of 
;fill-paragraph. Takes a multi-line paragraph and makes 
;it into a single line of text.
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))


;;ENABLE UNDOC; a mode which edits MS Word .doc files.
;;http://www.ccs.new.edu/home/guttman/undoc.el 
(autoload 'undoc "~/.emacs.d/lisp/undoc.el" "A minor mode which kills MS word files dead." t) 
(autoload 'undoc-current-buffer "undoc" "" t)
(autoload 'undoc-region-after-mime-dedcode "undoc" "" t) 

;;USE ANSI COLORS FOR SHELL-MODE 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; Magit Key Binding
(global-set-key (kbd "C-x g") 'magit-status)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(flyspell-default-dictionary nil)
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote org-mode))
 '(ispell-local-dictionary "canadian")
 '(org-agenda-files (quote ("~/cupe-files/privatization.org")))
 '(org-default-notes-file "~/.notes.org")
 '(org-directory "~/documents/org")
 '(org-mobile-agendas (quote default))
 '(org-mobile-directory "~/cupe-files/mobile-org/")
 '(org-mobile-inbox-for-pull "~/documents/org/flagged.org")
 '(package-selected-packages (quote (markdown-mode magit el-get)))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t))

;; danneskjold-theme.el --- beautiful high-contrast theme

;; Copyright (c) 2016 Dmitry Akatov

;; Author: Dmitry Akatov <akatovda@yandex.com>
;; URL: https://github.com/rails-to-cosmos/
;; Package-Version: 20160311.458

;;; Commentary:

;;; Code:
(deftheme danneskjold
  "Created 2016-03-16.")

(let ((bg "#000000")
      (fg "#ffffff")

      ;; Shades of grey
      (black "#000000")
      (frost "#D0E1F9" )
      (comment "#8593AE")
      (anthracite "#3a3f4b")
      (slightly-brighter-than-midnight "#282c34")
      (as-dark-as-midnight "#21252b")
      (white "#FFFFFF")

      ;; Shades of yellow
      (sunrise "#FFDB45")
      (saffron "#F9BA32")

      ;; Shades of green
      (spring-flower "#B3DE81")
      (summer-flower "#013220")

      ;; Shades of blue
      (twitter "#4CB5F5")

      ;; Shades of red
      (waddles "#FF87BA")
      (krayola "#E38B75")
      (santa "#F34A4A")
      (red-forest "#8b0000"))

  (custom-theme-set-faces
   'danneskjold
   `(default ((t (:foreground ,fg :background ,bg))))
   `(fringe ((t (:background ,bg))))
   `(region ((t (:background ,anthracite))))
   `(button ((t (:foreground ,frost :underline t :weight normal))))
   `(link ((t (:foreground ,frost :underline t))))
   `(menu ((t (:foreground ,fg :background ,as-dark-as-midnight))))

   `(show-paren-match ((t (:background ,twitter :foreground ,white))))

   `(font-lock-string-face ((t (:foreground ,krayola))))
   `(font-lock-builtin-face ((t (:foreground ,twitter))))
   `(font-lock-variable-name-face ((t (:foreground ,sunrise))))
   `(font-lock-keyword-face ((t (:foreground ,frost))))
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,anthracite))))
   `(font-lock-function-name-face ((t (:foreground ,fg))))
   `(font-lock-type-face ((t (:foreground ,saffron))))
   `(font-lock-constant-face ((t (:foreground ,fg))))

   `(mmm-default-submode-face ((t (:background ,as-dark-as-midnight))))

   `(header-line ((t (:background ,bg
                      :foreground ,comment
                      :underline ,comment
                      :weight normal
                      :box ,(list
                             :line-width 4
                             :color bg
                             )))))

   ;; Mode-line
   `(mode-line ((t (:background ,as-dark-as-midnight
                                :foreground ,fg
                                :box ,(list
                                       :line-width 4
                                       :color as-dark-as-midnight)))))
   `(mode-line-inactive ((t (:background ,slightly-brighter-than-midnight
                                         :foreground ,fg
                                         :box ,(list
                                                :line-width 4
                                                :color slightly-brighter-than-midnight)))))
   `(mode-line-buffer-id ((t (:foreground ,fg))))


   `(font-lock-warning-face ((t (:foreground ,santa))))
   `(compilation-warning ((t (:foreground ,santa))))
   `(compilation-info ((t (:foreground ,spring-flower))))
   `(highlight ((t (:background ,as-dark-as-midnight :foreground ,frost))))

   `(linum ((t (:foreground ,anthracite))))

   `(widget-field ((t (:foreground ,fg :background ,slightly-brighter-than-midnight))))
   `(widget-button ((t (:foreground ,saffron))))

   ;; Highlight quoted mode-line
   `(highlight-quoted-symbol ((t (:foreground ,waddles))))

   ;; Hl-line and hlinum-activate
   `(linum-highlight-face ((t (:foreground ,anthracite :background ,as-dark-as-midnight :weight bold))))
   `(hl-line ((t (:background ,as-dark-as-midnight))))

   ;; Magit
   `(magit-diff-added ((t (:foreground ,spring-flower))))
   `(magit-diff-added-highlight ((t (:foreground ,spring-flower))))
   `(magit-diff-removed ((t (:foreground ,santa))))
   `(magit-diff-removed-highlight ((t (:foreground ,santa))))
   `(magit-diff-context ((t (:background ,bg :foreground ,frost))))
   `(magit-diff-context-highlight ((t (:background ,bg :foreground ,frost))))
   `(magit-section-highlight ((t (:background ,bg))))
   `(magit-section-heading ((t (:foreground ,sunrise :inherit nil))))
   `(magit-diff-hunk-heading ((t (:foreground ,twitter :background ,slightly-brighter-than-midnight))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,twitter :background ,slightly-brighter-than-midnight))))
   `(magit-diff-lines-heading ((t (:foreground ,frost :background ,slightly-brighter-than-midnight))))
   `(magit-blame-heading ((t (:foreground ,twitter :background ,slightly-brighter-than-midnight))))

   ;; Org
   `(org-todo ((t (:foreground ,santa))))
   `(org-done ((t (:foreground ,spring-flower))))
   `(org-hide ((t (:foreground ,anthracite))))
   `(org-link ((t (:foreground ,frost :underline t))))
   `(org-date ((t (:foreground ,comment))))
   `(org-block-begin-line ((t (:foreground ,sunrise))))
   `(org-block-background ((t (:background ,as-dark-as-midnight))))
   `(org-block-end-line ((t (:foreground ,sunrise))))
   `(org-tag ((t (:foreground ,anthracite))))
   `(org-special-keyword ((t (:foreground ,sunrise))))
   `(org-priority ((t (:foreground ,comment))))
   `(org-level-1 ((t (:foreground ,"yellow"))))
   `(org-level-2 ((t (:foreground ,spring-flower))))
   `(org-level-3 ((t (:foreground ,twitter))))
   `(org-level-4 ((t (:foreground ,sunrise))))   

   ;; Prodigy
   `(prodigy-red-face ((t (:foreground ,santa))))
   `(prodigy-green-face ((t (:foreground ,spring-flower))))
   `(prodigy-yellow-face ((t (:foreground ,sunrise))))

   ;; Rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,spring-flower))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,santa))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,frost))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,saffron))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,waddles))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,frost))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,spring-flower))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,santa))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,frost))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,saffron))))

   ;; Company-mode
   ;; `(company-tooltip ((t (:foreground ,fg :background ,as-dark-as-midnight))))
   ;; `(company-tooltip-selection ((t (:foreground ,fg :background ,slightly-brighter-than-midnight))))
   ;; `(company-scrollbar-fg ((t (:background ,as-dark-as-midnight))))
   ;; `(company-scrollbar-bg ((t (:background ,slightly-brighter-than-midnight))))
   ;; `(company-tooltip-common ((t (:foreground ,saffron))))
   ;; `(company-preview ((t (:background ,slightly-brighter-than-midnight))))
   ;; `(company-preview-common ((t (:background ,slightly-brighter-than-midnight :foreground ,santa))))
   ;; `(company-mouse ((t (:background ,as-dark-as-midnight))))

   ;; Flycheck
   `(flycheck-warning ((t (:foreground ,santa :underline t))))

   ;; js2-mode
   `(js2-function-param ((t (:foreground ,saffron))))

   ;; erc
   `(erc-timestamp-face ((t (:foreground ,santa))))
   `(erc-prompt-face ((t (:foreground ,spring-flower))))
   `(erc-nick-default-face ((t (:foreground ,frost))))
   `(erc-notice-face ((t (:foreground ,waddles))))
   `(erc-button ((t (:foreground ,frost))))
   `(erc-current-nick-face ((t (:foreground ,santa))))

   ;; eshell
   `(eshell-prompt ((t (:foreground ,santa))))
   `(eshell-ls-executable ((t (:foreground ,spring-flower))))
   `(eshell-ls-directory ((t (:foreground ,twitter))))
   `(eshell-ls-readonly ((t (:foreground ,anthracite))))

   ;; dired
   `(dired-directory ((t (:foreground ,twitter))))
   `(dired-git-face ((t (:foreground ,santa))))
   `(dired-ignored ((t (:foreground ,anthracite))))
   `(dired-filetype-omit ((t (:foreground ,anthracite))))
   `(dired-filetype-common ((t (:foreground ,saffron))))
   `(dired-filetype-execute ((t (:foreground ,spring-flower))))
   `(dired-filetype-source ((t (:foreground ,waddles))))
   `(dired-filetype-plain ((t (:foreground ,comment))))
   `(dired-filetype-link ((t (:foreground ,twitter :underline t))))
   `(dired-flagged ((t (:foreground ,santa :underline t))))
   `(dired-marked ((t (:foreground ,saffron :underline t))))

   `(diredp-dir-heading ((t (:foreground ,saffron))))

   `(dired-subtree-depth-1-face ((t (:background ,"#21252b"))))
   `(dired-subtree-depth-2-face ((t (:background ,"#282c34"))))
   `(dired-subtree-depth-3-face ((t (:background ,bg))))

   ;; ido
   `(minibuffer-prompt ((t (:foreground ,comment))))
   `(ido-first-match ((t (:foreground ,frost))))
   `(ido-only-match ((t (:foreground ,frost))))
   `(ido-subdir ((t (:foreground ,frost))))
   `(ido-vertical-match-face ((t (:foreground ,twitter))))

   ;; vertical-border
   `(vertical-border ((t (:foreground "#282a2e"))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'danneskjold)
;;; danneskjold-theme.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Linux Libertine Mono O" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal)))))


