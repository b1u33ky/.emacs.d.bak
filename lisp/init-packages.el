
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )
  (require 'cl)

  ;;add whatever packages you want here
  (defvar b1u33ky/packages '(
			     company
			     solarized-theme
			     monokai-theme
			     hungry-delete
			     swiper
                             counsel
			     smartparens
			     popwin
			     
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
(load-theme 'solarized-light t)

(provide 'init-packages)
