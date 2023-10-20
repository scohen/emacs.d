(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/customizations/")
(add-to-list 'exec-path "/Users/steve/bin")
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load "global.el")
(load "treemacs-config.el")
(load "smartparens-custom.el")
(load "python-elpy.el")
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
 '(coffee-tab-width 2)
 '(company-idle-delay 0.1)
 '(custom-enabled-themes '(glacial-complete))
 '(custom-safe-themes
   '("d4b68a4975c2106bca457862e7c8bc913a97b1ab8db95bebc7c7d4184e233366" "f495d9c1b97761e184fd59fc39373bcca9e93ddafff56684011f5cbbf2e5365c" "6b8d8eaed9df6b127b834933830c38b01c36f14040998b6d56aae51bb37467fe" "6debab5c4a9d005d95566ca58994503e784acc5a13ca7e274e9c02a8baab26c9" "4d60dd4802ff8208aa7bdb0cec52956a70d755859d73783ce89c18a46409906b" "019ae405a79952decdf70b212b2661249ff3c9b9dcf67b7f8f14680bebfd3b04" "b0104f94b7b72d10fd79be0e69c2b6a7f40e805632f1f4518a46621244506980" "66fd7e198541f783ff1f068cdb421cb652f3a651890e397237a68e780df64043" "d42557ede44c1daeb2918b76d07c4e81894a964a1012e304b49df2a10a9bdb94" "dde847e0bca1e360efda014eabb65239e98866cd0150d61d09a78f3f62a9677a" "065a1d16954eff4aba48f70e84ea1e8da001fbf9f9021e63ac4552ac444a86da" "5ac4b7db6dec75323663514fb4ef06ab7b6cd0b167156c4d77fb0cf734c47e92" "acb14144548d8916ed1b7879dedb6b9428cfb7223819ff8c6650a8dd076cb9ca" "b8985bc6e7974977b71ab09d5a8cd060c9472391281c1fb6f90e7f35762dd2b4" "c027c9617d081f8fa58c680a3b61eb3ce718dce320fb6d685fca4c0610ad9877" "3ce9221a5ae43b850aef5536f2c572639ff949d40dffffa448fcf759fdf95de5" "aee71116f3c8a01f0a53123a2e24c4f2c77d9cc90815b8bcd45f20d7a30fc6fe" "ecee78d83c8f613b78fd11e1d44642fe8a068809999de8a0964602bfe3f60181" "a24008e7bac1256bff5fc91cbf4d9767b594d2365d89778ed778ef5e971c2e7a" "b5079d2613fe9134457a3ec51a640e2d52229fc1be57dd25d6dd5ed695b85c4d" "0071d0a3a4f5d0775d6ef974a7d5d8d48fb96206036054f3232f37b7c04a7a26" "f3980807e3c0b2dce83c85dba47f3d8ef6f0ae5debe4e8391863328e960a25da" default))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(line-number-mode nil)
 '(package-selected-packages
   '(lsp-mode lsp-treemacs flycheck magit magit-section markdown-mode projectile treemacs magit-filenotify rustic yaml-mode elixir-mode multiple-cursors web-mode eslint-fix rjsx-mode js2-mode prettier json-mode python-mode elpy py-autopep8 smartparens yasnippet use-package treemacs-projectile treemacs-magit treemacs-icons-dired ripgrep exec-path-from-shell diminish delight company))
 '(show-paren-mode t)
 '(warning-suppress-types '((lsp-mode) (lsp-mode) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
