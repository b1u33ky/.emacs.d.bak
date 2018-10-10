;; turn off tool-bar
(tool-bar-mode -1)

;; turn off scroll-bar
(scroll-bar-mode -1)

;; turn on electric-indent-mode
(electric-indent-mode t)

;; show linum-mode
(global-linum-mode t)

;; inhibit splash screen
(setq inhibit-splash-screen t)

;; open emacs with full-screen
(setq  initial-frame-alist (quote ((fullscreen . maximized))))

;; highlight current line
(global-hl-line-mode t)

;; set cursor-type as "bar"
(setq-default cursor-type 'bar)

;; set fontsize
;;(set-frame-font "DejaVu Sans Mono for Powerline-14")
;;(set-frame-font "Droid Sans Mono Slashed for Powerline-14")
;;(set-frame-font "Source Code Pro for Powerline-14")
;;(set-frame-font "Menlo-14")
(set-frame-font "Consolas-16")

(provide 'init-ui)
