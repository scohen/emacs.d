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


(use-package elixir-mode
  :ensure t
  :init
  (remove-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'elixir-format-hook 'set-formatter-exs)
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'clean-elixir nil t)))
  (add-hook 'elixir-mode-hook
            (lambda()
              (require 'smartparens-config)
              ;; "Kill Auto fill and burn the corpse"
              (auto-fill-mode -1)
              (company-mode)
              (smartparens-mode)
              ;; idle highlight mode highlights the word under the cursor
              (idle-highlight-mode 1)
              (flycheck-mode)
              ))
  (add-hook 'web-mode-hook (lambda () (web-mode-set-engine "elixir")))
  (sp-local-pair 'elixir-mode "\"\"\"" "\"\"\"")
  :hook
  (elixir-mode . lsp)
  :custom
  (lsp-elixir-server-command '("~/bin/language_server.sh"))
  :config
  (use-package smartparens :ensure t))
