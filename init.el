(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/customizations/")
(add-to-list 'exec-path "/Users/steve/bin")
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load "global.el")
(load "treesitter-custom.el")
(load "treemacs-config.el")
(load "smartparens-custom.el")
(load "python-pyright.el")
(load "markdown.el")
(load "magit-custom.el")
(load "json.el")
(load "css.el")
(load "javascript.el")
(load "web.el")
(load "multiple-cursor-custom.el")
;; disabling polymode because it confuses lsp
;; (load "polymode-custom.el")

(load "elixir.el")
(load "yaml-custom.el")
(load "rust.el")
(load "global-key-bindings.el")

(cond
 ((string-equal system-type "windows-nt")
  (load "windows.el"))

 ((string-equal system-type "darwin")
  (load "mac.el"))

 ((string-equal system-type "gnu/linux")
  (load "linux.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(custom-enabled-themes '(glacial-complete))
 '(custom-safe-themes
   '("83470e2d51dce231f40d4c112db3ceceb5438c66c3de9b0c136972c23ab7bea2" "1a188b325118ce3a60cef0d737d29d1fadc709fcd21b156c88a7dd74b651eaab" "ce3ffec16fa28e2ae33fde72c662a256ed93a35358ce11076fc7c9f6d5164ef6" default))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(package-selected-packages
   '(rg string-inflection elixir-ts-mode lsp-treemacs lsp-ui lsp-pyright rust-mode helm helm-lsp lsp-mode tree-sitter-langs magit-filenotify rustic yaml-mode multiple-cursors web-mode eslint-fix rjsx-mode js2-mode prettier json-mode elpy py-autopep8 smartparens yasnippet use-package treemacs-projectile treemacs-magit treemacs-icons-dired diminish delight))
 '(show-paren-mode t)
 '(warning-suppress-types '((lsp-mode) (lsp-mode) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t nil))))
(put 'downcase-region 'disabled nil)
