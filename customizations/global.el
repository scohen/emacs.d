;; Enable completions everywhere

;;; Code:
(ido-mode 1)
(ido-everywhere 1)
(projectile-mode)

(menu-bar-mode 1)
(tool-bar-mode 1)
(toggle-scroll-bar -1)
(global-linum-mode 1)
(remove-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(set-face-attribute 'default nil
                    :family "Office Code Pro"
                    :height 125 ;; measured in 1/10 of a pt.
                    :weight 'normal)


(setq projectile-enable-caching t)
(setq text-mode-hook
	'(lambda nil
		(auto-fill-mode -1)))

(turn-off-auto-fill)

;; Split vertically
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

(defun iwb ()
  "Indent the presently active buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

; Save when emacs loses focus
(defun save-all ()
  (interactive)
  (save-some-buffers t))

(add-function :after after-focus-change-function #'save-all)

(use-package exec-path-from-shell
  :ensure
  :init
  (exec-path-from-shell-initialize))


;; flycheck config

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :hook
  (prog-mode . flyspell-prog-mode))

;; end flycheck config


;; Company configuration
(use-package company
  :ensure t
  :diminish company-mode
  :hook
  (prog-mode . yas-minor-mode)
  :hook
  (prog-mode . global-company-mode)
 :config
(setq company-backends '(company-capf
                         company-keywords
                         company-semantic
                         company-files
                         company-etags
                         company-elisp
                         company-irony
                         company-jedi
                         company-yasnippet))
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-echo-delay 0)

  (global-company-mode 1))



(use-package lsp-imenu
  :after lsp-mode
  :hook
  (lsp-after-open . lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :diminish lsp-ui
  :init (lsp-ui-mode)
  :hook ((lsp-mode . lsp-ui-mode))
  :config
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-enable-file-watchers nil)
  )


(use-package lsp-mode
  :ensure t
  :diminish lsp-mode
  :bind
  (("M-." . lsp-find-definition)
   ("M-," . lsp-find-references)
   ("<f7>" . lsp-format-buffer)
   )
  :init
  '(lsp-mode))

;; end company config



;; Projectile prefix
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; custom keys
(global-set-key (kbd "C-x /") 'comment-dwim)
(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x p") 'projectile-switch-project)
(global-set-key (kbd "C-x t") 'treemacs)
(global-set-key (kbd "C-x r g") 'projectile-ripgrep)
(global-set-key (kbd "M-<right>") 'sp-forward-sexp)
(global-set-key (kbd "M-<left>") 'sp-backward-sexp)
(global-set-key (kbd "M-d") 'sp-kill-sexp)
(global-set-key (kbd "C-c l") 'goto-line)

;;end custom keys


; display the current file's path in the frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(add-hook 'after-init-hook 'global-company-mode)

; only use spaces.
(setq-default indent-tabs-mode nil)

; set the initial frame geometry
(defun get-default-height ()
  (/ (- (display-pixel-height) 120)
     (frame-char-height)))

;; Max length guide
;; (setq fci-rule-column 100)
;; (setq fci-rule-color "#583856")

;; Control how emacs backs up files
(setq backup-directory-alist `(("." . "~/.emacs-backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

(when (window-system)
  (set-frame-position (selected-frame) 0 0)
  (add-to-list 'default-frame-alist '(width . 240))
  (add-to-list 'default-frame-alist (cons 'height (get-default-height))))
