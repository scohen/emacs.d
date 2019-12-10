(require 'web-mode)

;; web mode for eex files

(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(setq web-mode-engines-alist
      '(
        ("elixir"  ."\\.eex\\'"),
        ("css"     ."\\.sass\\'")
        ))

(setq web-mode-extra-constants '(("elixir" . ("for" "case"))))
(setq web-mode-extra-constants '(("erlang" . ("for" "case"))))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(defun web-mode-customizations ()
  "Web mode customizations."

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)



  )

(defun web-mode-hooks ()
  (smartparens-mode)
  (prettier-js-mode))

(add-hook 'web-mode-hook 'web-mode-customizations)
(add-hook 'web-mode-hook 'web-mode-hooks)
(eval-after-load 'web-mode
       '(add-hook 'web-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix))))
