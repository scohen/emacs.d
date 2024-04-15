
;; enable this when we switch to python > 3.6
;; (use-package blacken :ensure t)
;; (use-package python-mode
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'blacken-mode))

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(use-package py-autopep8
  :ensure t)

(use-package lsp-pyright
  :ensure t)

(use-package python-ts-mode
  :init

  (setq py-autopep8-options '("--max-line-length=120"))
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  ;; (add-hook 'python-mode-hook 'blacken-mode)
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  :hook
  (python-ts-mode . smartparens-mode)
  (python-ts-mode . idle-highlight-mode)
  (python-ts-mode . lsp-mode))

(provide 'python-elpy)
