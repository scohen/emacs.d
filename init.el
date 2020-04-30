(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/customizations/")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'exec-path "/Users/steve/Projects/elixir-ls/release")

(load "global.el")
(load "treemacs-config.el")
(load "rust.el")
(load "python-elpy.el")
(load "markdown.el")
(load "go.el")
(load "custom-magit.el")
(load "css.el")
(load "javascript.el")
(load "typescript.el")
(load "web.el")
(load "custom-mmm-mode.el")
(load "elixir.el")
(load "yaml.el")

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
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (glacial-complete)))
 '(custom-safe-themes
   (quote
    ("d42557ede44c1daeb2918b76d07c4e81894a964a1012e304b49df2a10a9bdb94" "dde847e0bca1e360efda014eabb65239e98866cd0150d61d09a78f3f62a9677a" "065a1d16954eff4aba48f70e84ea1e8da001fbf9f9021e63ac4552ac444a86da" "5ac4b7db6dec75323663514fb4ef06ab7b6cd0b167156c4d77fb0cf734c47e92" "acb14144548d8916ed1b7879dedb6b9428cfb7223819ff8c6650a8dd076cb9ca" "b8985bc6e7974977b71ab09d5a8cd060c9472391281c1fb6f90e7f35762dd2b4" "c027c9617d081f8fa58c680a3b61eb3ce718dce320fb6d685fca4c0610ad9877" "3ce9221a5ae43b850aef5536f2c572639ff949d40dffffa448fcf759fdf95de5" "aee71116f3c8a01f0a53123a2e24c4f2c77d9cc90815b8bcd45f20d7a30fc6fe" "ecee78d83c8f613b78fd11e1d44642fe8a068809999de8a0964602bfe3f60181" "a24008e7bac1256bff5fc91cbf4d9767b594d2365d89778ed778ef5e971c2e7a" "b5079d2613fe9134457a3ec51a640e2d52229fc1be57dd25d6dd5ed695b85c4d" "0071d0a3a4f5d0775d6ef974a7d5d8d48fb96206036054f3232f37b7c04a7a26" "f3980807e3c0b2dce83c85dba47f3d8ef6f0ae5debe4e8391863328e960a25da" default)))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (lsp-mode lsp-ui magit elpygen racer flycheck-credo flycheck-mix ripgrep jinja2-mode htmlize alchemist erlang jedi-direx jedi magit-popup python-mode idle-highlight smartparens company-jedi virtualenvwrapper 0blayout magit-lfs magithub elixir-mode xref-js2 js2-refactor graphql-mode yaml-mode py-autopep8 python-pylint pyenv-mode use-package rainbow-mode js2-mode web-mode scss-mode flycheck-rust dockerfile-mode exec-path-from-shell cql-mode better-shell idle-highlight-mode hideshowvis hideshow-org cython-mode kotlin-mode fill-column-indicator column-marker markdown-preview-mode clojure-mode undo-tree neotree markdown-mode+ json-mode ido-ubiquitous goto-last-change flx-ido company-inf-ruby company-go color-theme better-defaults base16-theme auto-complete)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
