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

(provide 'init-better-defaults)
