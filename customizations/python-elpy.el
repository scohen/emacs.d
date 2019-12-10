(require 'python-mode)

;; enable this when we switch to python > 3.6
;; (use-package blacken :ensure t)
;; (use-package python-mode
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'blacken-mode))

(use-package py-autopep8
  :ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package python-mode :ensure t
  :init

  (setq py-autopep8-options '("--max-line-length=120"))
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  ;; (add-hook 'python-mode-hook 'blacken-mode)
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (add-hook 'python-mode-hook 'smartparens-mode)
  (add-hook 'python-mode-hook 'idle-highlight-mode))

(provide 'python-elpy)
