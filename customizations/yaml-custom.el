(use-package yaml-mode
  :ensure t
  :hook
  (yaml . eglot-ensure)
  :init
  (add-hook 'yaml-mode-hook #'eglot-ensure))
