(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; custom keys
(global-set-key (kbd "C-x /") 'comment-dwim)
(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x p") 'projectile-switch-project)
(global-set-key (kbd "C-x t") 'treemacs)
(global-set-key (kbd "M-<right>") 'sp-forward-sexp)
(global-set-key (kbd "M-<left>") 'sp-backward-sexp)
(global-set-key (kbd "M-d") 'sp-kill-sexp)
(global-set-key (kbd "C-c u") 'sp-unwrap-sexp)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c (") 'wrap-with-parens)
(global-set-key (kbd "C-c {") 'wrap-with-braces)
(global-set-key (kbd "C-c [") 'wrap-with-brackets)
(global-set-key (kbd "C-c '") 'wrap-with-single-quotes)
(global-set-key (kbd "C-c \"") 'wrap-with-double-quotes)
(global-set-key (kbd "C-c `") 'wrap-with-back-quotes)

;; string inflections
(global-set-key (kbd "C-c i u") 'string-inflection-underscore)
(global-set-key (kbd "C-c i c") 'string-inflection-lower-camelcase)
(global-set-key (kbd "C-c i C") 'string-inflection-camelcase)

;; sorting
(global-set-key (kbd "C-c C-s c") 'sort-columns)
(global-set-key (kbd "C-c C-s f") 'sort-fields)
(global-set-key (kbd "C-c C-s l") 'sort-lines)


;; multiple cursors

(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m >") 'mc/mark-next-like-this)

(global-set-key (kbd "C-c m <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m r") 'mc/mark-all-in-region)

(global-set-key (kbd "C-c m #") 'mc/insert-numbers)
(global-set-key (kbd "C-c m [") 'set-rectangular-region-anchor)


;; revert buffer
(global-set-key (kbd "C-c C-r") 'revert-buffer-no-confirm)


;; Magit
(global-set-key (kbd "C-c m b") 'magit-blame)


;; ripgrep
(rg-enable-default-bindings)
