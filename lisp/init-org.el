;; enable org-src-fontify-natively

(with-eval-after-load 'org
  (setq org-src-fontify-natively t)

  (setq org-agenda-files '("~/.emacs.d"))

  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "Agenda Daily")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1))))

;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)


(provide 'init-org)
