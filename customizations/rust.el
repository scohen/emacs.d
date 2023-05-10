
;;; Code:

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
      (indent-for-tab-command)))

;; finds all Cargo.toml files in your current project and returns a vector of them
(defun scohen/rust-find-project-config ()
  (let* ((project-root (projectile-project-root))
        (found-cargo-files
         (directory-files-recursively project-root "Cargo.toml")))
    (vconcat found-cargo-files)))

(use-package rustic
  :ensure t
  :after  (projectile)
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c s" . lsp-rust-analyzer-status)
              )
  :config

  (setq rustic-format-on-save t)
  (setq lsp-rust-analyzer-linked-projects (scohen/rust-find-project-config))
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (add-hook 'rustic-mode-hook 'scohen/rustic-mode-hook))

(defun scohen/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)
    (company-mode)
    (auto-fill-mode -1)
    (idle-highlight-mode)
    (smartparens-mode)
    ))
