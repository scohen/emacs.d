(defun sc/set-formatter-exs ()
  (if (projectile-project-p)
      (let ((formatter-exs (locate-dominating-file buffer-file-name ".formatter.exs")))
        (if formatter-exs
            (setq elixir-format-arguments
                  (list "--dot-formatter"
                        (concat formatter-exs ".formatter.exs")))
          (setq elixir-format-arguments nil)))
    (setq elixir-format-arguments nil)))

(defun sc/clean-elixir ()
  (interactive)
  (delete-trailing-whitespace)
  (untabify (point-min) (point-max))
  (lsp-format-buffer))


(defun sc/elixir-mode-hook ()
  (require 'smartparens-config)
  ;; "Kill Auto fill and burn the corpse"
  (auto-fill-mode -1)
  ;; idle highlight mode highlights the word under the cursor
  ;; (idle-highlight-mode 1)
  )


(defun sc/set-web-mode-engine ()
  (web-mode-set-engine "elixir"))

(use-package elixir-ts-mode
  :ensure t
  :load-path "~/Projects/elixir-ts-mode"

  :init
  (remove-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'web-mode-hook (lambda () (web-mode-set-engine "elixir")))

  :bind
  (:map elixir-ts-mode-map ("C-c e f" . sc/clean-elixir))

  :custom
  (lsp-elixir-server-command '("~/Projects/lexical/_build/dev/package/lexical/bin/start_lexical.sh"))

  :hook
  (
   (elixir-ts-mode . idle-highlight-mode)
   (elixir-ts-mode . company-mode)
   (elixir-ts-mode . lsp-mode)
   (elixir-ts-mode . smartparens-mode)
   (elixir-ts-mode . sc/elixir-mode-hook)
   (elixir-format . sc/set-formatter-exs)
   (web-mode . sc/set-web-mode-engine)
   (before-save . sc/clean-elixir)))

(provide 'elixir)
