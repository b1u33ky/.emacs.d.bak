
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
    )
  (require 'cl)

  ;;add whatever packages you want here
  (defvar b1u33ky/packages '(
			     company
			     solarized-theme
			     monokai-theme
			     kaolin-themes
			     moe-theme
			     hungry-delete
			     swiper
                             counsel
			     smartparens
			     popwin
			     org-pomodoro
			     helm-ag
			     reveal-in-osx-finder
			     web-mode
			     js2-refactor
			     expand-region
			     iedit
			     flycheck
			     auto-yasnippet
			     evil
			     evil-leader
			     evil-surround
			     window-numbering
			     which-key
			     yasnippet
			     )  "Default packages")

(setq package-selected-packages b1u33ky/packages)

 
(defun b1u33ky/packages-installed-p ()
  (loop for pkg in b1u33ky/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

  (unless (b1u33ky/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg b1u33ky/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Always start smartparens mode in emacs-lisp-mode.
;; (require 'smartparens-config)
 ;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; enable hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; configure swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; enable company-mode
(global-company-mode t)

;; enable popwin
(require 'popwin)
(popwin-mode t)

;; load theme "(load-theme 'solarized-light t)"
;; (load-theme 'monokai t)
(load-theme 'monokai t)

;; config js2-mode for js file
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; config for web mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, htlm tag and html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  
  (if (eq major-mode 'web-mode)
      (progn
	(setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2)4 2))
	(setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	(setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(defun js2-imenu-make-index ()
        (interactive)
        (save-excursion
          ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
          (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                     ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                     ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))

(add-hook 'js2-mode-hook
                (lambda ()
                  (setq imenu-create-index-function 'js2-imenu-make-index)))

(add-hook 'js2-mode-hook 'flycheck-mode)


(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(global-evil-leader-mode)

(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
 "bk" 'kill-buffer
 "pf" 'counsel-git
 "ps" 'helm-do-ag-project-root
 "0" 'select-window-0
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-3
 "w/" 'split-window-right
 "w-" 'split-window-below
 ":" 'counsel-M-x
 "wm" 'toggle-frame-maximized)

(window-numbering-mode t)

(require 'evil-surround)
(global-evil-surround-mode t)

 (dolist (mode '(ag-mode
                  flycheck-error-list-mode
                  git-rebase-mode
		  occur-mode))
    (add-to-list 'evil-emacs-state-modes mode))

(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kdb "N") 'evil-search-previous
	      (kdb "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up
	      )))

(which-key-mode)
(setq which-key-side-window-location 'right)

(require 'expand-region)

(require 'org-pomodoro)

(provide 'init-packages)
