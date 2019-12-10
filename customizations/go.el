; go customizations
(setenv "GOPATH" "~/Projects/magnus")
(setq exec-path (cons "/usr/local/bin/" exec-path))
(setq exec-path (cons "~/Projects/magnus/bin" exec-path))

(add-to-list 'load-path "~/.emacs.d/vendor/go-mode.el")
(require 'go-mode-load)

(defun go-mode-hooks ()
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving

  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-hooks)
