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

;; org-agenda shortcut
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-better-defaults)
