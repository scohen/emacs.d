(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-control-modifier 'control
      mac-option-modifier 'none)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))
