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
  (eglot-format-buffer))


(defun sc/elixir-mode-hook ()
  (require 'smartparens-config)
  ;; "Kill Auto fill and burn the corpse"
  (auto-fill-mode -1)
  (company-mode)
  (smartparens-mode)
  ;; idle highlight mode highlights the word under the cursor
  (idle-highlight-mode 1))

(use-package elixir-mode
  :ensure t
  :init
  (remove-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'elixir-format-hook 'set-formatter-exs)
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'clean-elixir nil t)))
  (add-hook 'web-mode-hook (lambda () (web-mode-set-engine "elixir")))

  :bind
  (:map elixir-mode-map
        ("C-c e f" . clean-elixir))
  :hook
  (
   (elixir-mode . eglot-ensure)
   (elixir-mode . sc/elixir-mode-hook))



  :config
  (use-package smartparens :ensure t))
