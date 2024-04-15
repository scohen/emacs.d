;; Enable completions everywhere

;;; Code:
(setq package-native-compile t)
(setq treesit-font-lock-level 4)
(ido-mode 1)
(ido-everywhere 1)

(menu-bar-mode 1)
(tool-bar-mode 1)
(toggle-scroll-bar -1)
(global-display-line-numbers-mode)
(remove-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(set-face-attribute 'default nil
                    :family "Office Code Pro"
                    :height 125 ;; measured in 1/10 of a pt.
                    :weight 'normal)

(use-package tree-sitter-langs :ensure t)

(use-package idle-highlight-mode
  :ensure t
  :diminish idle-highlight-mode)

(use-package ripgrep
  :ensure t)

(use-package diminish
  :ensure t)

(use-package delight
  :ensure t)

(use-package autorevert
  :ensure t
  :delight auto-revert-mode)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config)

(setq text-mode-hook
        '(lambda nil
                (auto-fill-mode -1)))

(turn-off-auto-fill)

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
  :ensure t
  :init
  (exec-path-from-shell-initialize))

;; flycheck config

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init (global-flycheck-mode)
  :diminish flycheck-mode
  :hook
  (prog-mode . flyspell-prog-mode))

;; end flycheck config


;; yasnippet is required by company
(use-package yasnippet
  :ensure t)

(use-package yasnippet-snippets
  :ensure t)

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
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-echo-delay 0)

  (global-company-mode 1))


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
  )


(use-package lsp-mode
  :ensure t
  :config

  :bind
  (:map lsp-mode-map
        ("M-." . lsp-find-definition)
        ("M-," . lsp-find-references)
        ("C-c l f" . lsp-format-buffer)
        ("C-c l l" . flymake-diagnostics-buffer-mode)
        ("C-c l a" . lsp-execute-code-action)
        ("C-c l r" . lsp-rename)
        ("C-c l q" . lsp-workspace-restart)
        ("C-c l Q" . lsp-workspace-shutdown)
        ("C-c l s" . lsp-treemacs-symbols)
        ("C-c l S" . helm-lsp-workspace-symbol)
        ("<tab>" . tab-indent-or-complete)
        ("TAB" . tab-indent-or-complete)
        )
  :config
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024 4)) ;; 4mb
  (setq lsp-idle-delay 0.725)
  ;; log io is only true for debugging lexical
  (setq lsp-log-io t)
  (setq lsp-file-watch-threshold 5000)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-modeline-code-actions-segments '(count icon name))

  :init
  '(lsp-mode)
  )


(use-package lsp-treemacs
  :ensure t)

;; end company config



(projectile-mode +1)


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

(setq inhibit-startup-screen t)
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
