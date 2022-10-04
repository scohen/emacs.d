(use-package yaml-mode
  :ensure t
  :hook
  (yaml . lsp)
  :init
  (add-hook 'yaml-mode-hook #'lsp))
