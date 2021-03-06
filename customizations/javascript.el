(use-package js2-mode
  :bind (:map js-mode-map
              ("M-." . nil)
              ("C-t w" . 'web-mode-element-wrap)
              ))

(use-package rjsx-mode
  :init
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  ;; (setq lsp-eslint-server-command
  ;;       '("/usr/local/bin/node"
  ;;         "/Users/steve/.vscode/extensions/dbaeumer.vscode-eslint-2.0.15/server/out/eslintServer.js"
  ;;         "--stdio"))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)


(defun set-prettier-config ()
  (defvar prettier-js-args)
  (if (projectile-project-p)
      (let ((prettier-config-dir (locate-dominating-file buffer-file-name "prettier.config.js")))
        (if prettier-config-dir
            (defvar prettier-js-args
                  (list "--config prettier.config.js"
                        "--write"))
          (setq prettier-js-args nil)))
    (setq prettier-js-args nil)))
:hook
(
 (rjsx-mode . lsp)
 (rjsx-mode . prettier-js-mode)
 (rjsx-mode . smartparens-mode)
 (rjsx-mode . idle-highlight-mode)
 ))
;; (require 'js2-mode)
;; (require 'xref-js2)

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (setq js2-basic-offset 2)
;; (setq js-indent-level 2)
;; (setq js2-strict-missing-semi-warning nil)
;; (setq lsp-eslint-server-command
;;    '("/usr/local/bin/node"
;;      "/Users/steve/.vscode/extensions/dbaeumer.vscode-eslint-2.0.15/server/out/eslintServer.js"
;;      "--stdio"))

;; (defun set-prettier-config ()
;;   (defvar prettier-js-args)
;;   (if (projectile-project-p)
;;       (let ((prettier-config-dir (locate-dominating-file buffer-file-name "prettier.config.js")))
;;         (if prettier-config-dir
;;             (defvar prettier-js-args
;;                   (list "--config prettier.config.js"
;;                         "--write"))
;;           (setq prettier-js-args nil)))
;;     (setq prettier-js-args nil)))


;; ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; ;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)
;; (add-hook 'js2-mode-hook #'lsp)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (prettier-js-mode)
;;             (smartparens-mode)
;;             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
