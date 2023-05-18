(use-package prettier
  :ensure t)

(use-package js2-mode
  :ensure t
  :hook
  (js2-mode . lsp)
  :bind (:map js-mode-map
              ("M-." . nil)
              ("C-t w" . 'web-mode-element-wrap)
              ))

(use-package rjsx-mode
  :ensure t
  :init
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)

:hook
(
 (rjsx-mode . lsp)
 (rjsx-mode . prettier-mode)
 (rjsx-mode . smartparens-mode)
 (rjsx-mode . idle-highlight-mode)
 ))
