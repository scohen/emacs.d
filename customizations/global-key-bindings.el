(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; custom keys
(global-set-key (kbd "C-x /") 'comment-dwim)
(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x p") 'projectile-switch-project)
(global-set-key (kbd "C-x t") 'treemacs)
(global-set-key (kbd "C-x r g") 'projectile-ripgrep)
(global-set-key (kbd "M-<right>") 'sp-forward-sexp)
(global-set-key (kbd "M-<left>") 'sp-backward-sexp)
(global-set-key (kbd "M-d") 'sp-kill-sexp)
(global-set-key (kbd "C-c u") 'sp-unwrap-sexp)
(global-set-key (kbd "C-c l") 'goto-line)
(global-set-key (kbd "C-c (") 'wrap-with-parens)
(global-set-key (kbd "C-c {") 'wrap-with-braces)
(global-set-key (kbd "C-c [") 'wrap-with-brackets)
(global-set-key (kbd "C-c '") 'wrap-with-single-quotes)
(global-set-key (kbd "C-c \"") 'wrap-with-double-quotes)
(global-set-key (kbd "C-c `") 'wrap-with-back-quotes)

;; multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
