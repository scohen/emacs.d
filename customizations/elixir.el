;; alchemist
;; (add-to-list 'load-path "~/.emacs.d/vendor/alchemist.el/")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-elixir/")
(require 'smartparens-config)

;; (setq alchemist-help-docs-ansi-color-enabled t)

(defun set-formatter-exs ()
  (if (projectile-project-p)
      (let ((formatter-exs (locate-dominating-file buffer-file-name ".formatter.exs")))
        (if formatter-exs
            (setq elixir-format-arguments
                  (list "--dot-formatter"
                        (concat formatter-exs ".formatter.exs")))
          (setq elixir-format-arguments nil)))
    (setq elixir-format-arguments nil)))

(defun clean-elixir ()
  (interactive)
  (delete-trailing-whitespace)
  (untabify (point-min) (point-max))
  (elixir-format))

(defun elixir-mode-hooks ()
  ;; "Kill Auto fill and burn the corpse"
  (auto-fill-mode -1)

 ;; (alchemist-mode)
  (company-mode)
  ;; idle highlight mode highlights the word under the cursor
  (idle-highlight-mode 1)
  (smartparens-mode)
  (flycheck-mix-setup)
  (flycheck-mode)
  )


(use-package elixir-mode
  :init

  (remove-hook 'text-mode-hook 'turn-on-auto-fill)

  (add-hook 'elixir-mode-hook #'lsp)
  (add-hook 'elixir-format-hook 'set-formatter-exs)
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'clean-elixir nil t)))
  (add-hook 'elixir-mode-hook 'elixir-mode-hooks)

  :config
  (use-package eglot :ensure t)
  (use-package flycheck-mix :ensure t)
  (use-package alchemist :ensure t)
  (use-package smartparens :ensure t)
  )

(require 'elixir-mode)
