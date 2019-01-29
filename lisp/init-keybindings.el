;; type <f2> to open-my-init-file
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; type the keybinding to open your recentf files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; enhance find-function find-variable find-function-on-keys
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; some keybindings about plugin "swiper"
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; org-agenda shorcut
(global-set-key (kbd "C-c a") 'org-agenda)

;; counsel-git shortcut
(global-set-key (kbd "C-c p f") 'counsel-git)

;; type "C-M-\\" to indent-region-or-buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;  another way to complete things in Emacs
(global-set-key (kbd "s-/") 'hippie-expand)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-s e") 'iedit-mode)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(global-set-key (kbd "C-w") 'backward-kill-word)

;; remap C-n as next item when company mode is enable
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; command key as meta keybinding
(when (eq system-type 'darwin)
 (setq mac-option-key-is-meta nil)
 (setq mac-command-key-is-meta t)
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier nil))

(provide 'init-keybindings)
