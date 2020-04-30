(require 'mmm-mode)


(setq mmm-parse-when-idle 't)

(mmm-add-classes
  '((markdown-elixirp
    :submode elixir-mode
    :face mmm-declaration-submode-face
    :front "^\{:language=\"elixir\"\}[\n\r]+~~~"
    :back "^~~~$")))

(mmm-add-classes
  '((elixir-eex
    :submode web-mode
    :face mmm-declaration-submode-face
    :front "^.*?\~L\"\"\""
    :back "^.*?\"\"\"")))

(mmm-add-classes
  '((elixir-eex
    :submode web-mode
    :face mmm-declaration-submode-face
    :front "^.*?\~E\"\"\""
    :back "^.*?\"\"\"")))


(mmm-add-classes
  '((markdown-elixirp2
    :submode elixir-mode
    :face mmm-declaration-submode-face
    :front "^\`\`\`elixir"
    :back "^\`\`\`")))

(mmm-add-classes
  '((markdown-jsp
    :submode js-mode
    :face mmm-declaration-submode-face
    :front "^\{:language=\"javascript\"\}[\n\r]+~~~"
    :back "^~~~$")))

(mmm-add-classes
  '((markdown-jsp2
    :submode elixir-mode
    :face mmm-declaration-submode-face
    :front "^\`\`\`javascript"
    :back "^\`\`\`")))

;; (mmm-add-classes
;;   '((markdown-ruby
;;     :submode ruby-mode
;;     :face mmm-declaration-submode-face
;;     :front "^~~~\s?ruby[\n\r]"
;;     :back "^~~~$")))

(mmm-add-classes
  '((markdown-elixir
    :submode elixir-mode
    :face mmm-declaration-submode-face
    :front "^~~~\s?elixir[\n\r]"
    :back "^~~~$")))

(mmm-add-classes
  '((markdown-js
    :submode js-mode
    :face mmm-declaration-submode-face
    :front "^~~~\s?javascript[\n\r]"
    :back "^~~~$")))

(setq mmm-submode-decoration-level 0)

(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-rubyp))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-elixirp))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-elixirp2))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-jsp))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-jsp2))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-ruby))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-elixir))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-js))
(add-to-list 'mmm-mode-ext-classes-alist '(elixir-mode nil elixir-eex))
