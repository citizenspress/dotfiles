
; Load the package manager

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (package-initialize)

;; Unbind Pesky Sleep Button -- this stops the weird C-z action 
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;; Starts the emacs server
;; Start emacs with "emacsclient -c"

(server-start) 


;; Do not load the scratch message
;; This leaves a black scratch page to work from
(setq initial-scratch-message nil)
;; Display the time in the bottom bar
(display-time)

(prefer-coding-system locale-coding-system)

;; Keep transient marks on.
(transient-mark-mode 1)


;; Set keyboard coding when in terminal
(when (not window-system)
  (set-keyboard-coding-system locale-coding-system)
  (set-terminal-coding-system locale-coding-system)
)


;;SET MAJOR MODE TO ORG
;; This sets Org-Mode as your main mode and sets Org cammands
(setq default-major-mode 'org-mode)
(global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-cb" 'org-iswitchb)




;;SCROLLING
(setq scroll-conservatively 10000)


;;LOAD FLYSPELL FOR EVERYTHING WRITING

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(org-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(latex-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))


;;POST MODE FOR MUTT
;; Download post mode for mutt from Github

(load "~/.emacs.d/post")
(add-hook 'post-mode-hook 
  (lambda()
(auto-fill-mode -1)
    (setq fill-column 72)    rfc 1855 for usenet messages
    ))
(dolist (hook '(post-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))


;;DO INLINE WORDCOUNT
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)


;;DISABLE BELL FUNCTION because it is annoying
(setq ring-bell-function 'ignore)

;;CURRENT BUFFER NAME IN TITLE BAR
;; Sets the name of the frame
(setq frame-title-format "%b")


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
 ;; Don't default flyspell dictionary
 '(flyspell-default-dictionary nil)
 '(global-visual-line-mode t)
;;Don't show startup screen
 '(inhibit-startup-screen t)
;; Set the initial mode to Org-Mode
 '(initial-major-mode (quote org-mode))

;; Set Dictionary for flyspell
 '(ispell-local-dictionary "canadian")

;; Set Magit mode
 '(package-selected-packages (quote (markdown-mode magit el-get)))
;; Set send mail function for quotes
 '(send-mail-function (quote smtpmail-send-it))

;;Show matching brackets.
 
'(show-paren-mode t))


