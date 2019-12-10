(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook
          (lambda ()
          (smartparens-mode)
          (prettier-js-mode)
          (setq typescript-indent-level 2)
          (lambda ()
            (add-hook 'after-save-hook 'eslint-fix))))

;; formats the buffer before saving
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'setup-tide-mode)
(setq typescript-indent-level 2)
