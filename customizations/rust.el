
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


;; dap mode is for debugging rust

(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Run"
	 :gdbpath "rust-lldb"
         :target nil
         :cwd nil)))


(use-package rustic
  :ensure
  :after  (projectile)
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status)
              ("<tab>" . tab-indent-or-complete)
              ("TAB" . tab-indent-or-complete)
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
    (flycheck-mode)
    (company-mode)
    (auto-fill-mode -1)
    (idle-highlight-mode)
    (smartparens-mode)
    ))
