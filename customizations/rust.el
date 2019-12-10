
;;; Code:
(require 'rust-mode)
(setq racer-rust-src-path
      (string-trim
       (shell-command-to-string
        "echo `~/.cargo/bin/rustc --print sysroot`/lib/rustlib/src/rust/src")))

(setq exec-path (append exec-path  '("~/.cargo/bin")))
(defun rust-mode-hooks ()
  (auto-fill-mode -1)
  (eldoc-mode)
  (flycheck-mode)
  (idle-highlight-mode 1)
  (racer-mode)
  (company-mode)
  (smartparens-mode))

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(add-hook 'rust-mode-hook 'rust-mode-hooks)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(defvar racer-rust-src-path)

(defvar company-tooltip-align-annotations)
(setq company-tooltip-align-annotations t)
(setq rust-format-on-save t)
