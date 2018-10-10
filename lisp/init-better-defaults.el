;; disable annoying ring bell
(setq ring-bell-function 'ignore)

;; disable auto save list
(setq auto-save-default nil)

;; disable backup files
(setq make-backup-files nil)

;; show match parents
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; enable recentf mode
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; enable delete-selection-mode
(delete-selection-mode t)

;; set "UTF-8" as default language environment
(set-language-environment "UTF-8")

;; org-agenda shortcut
(global-set-key (kbd "C-c a") 'org-agenda)

;; indent-region
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  reveal-in-osx-finder   It is bound to RET, a.
  (indent-rSpacemacsegion (point-min) (point-max)))

;; indent-region or indent-buffer
(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(provide 'init-better-defaults)
