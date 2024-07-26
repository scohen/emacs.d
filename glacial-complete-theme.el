
;;; glacial-complete-theme.el --- Custom theme for faces

;; Copyright (C) 2011-2014 Free Software Foundation, Inc.

;; Author: Steve Cohen

;;; Code:

(deftheme glacial-complete
  "Face colors using a deep blue background.")

(require 'color)
(let ((class '((class color) (min-colors 89)))
      (background-color "#28282B")
      (pink "DeepPink3")
      (diff-added "#003E17")
      (diff-deleted "#48001E")
      (diff-foreground "#b3b3b3")
      (dark-pink "#342832")
      (contrasty-red "#BB364F"))

  (custom-theme-set-faces
   'glacial-complete
   `(Info-title-1-face ((,class (:family "helv" :weight bold :height 1.728))))
   `(Info-title-2-face ((,class (:family "helv" :weight bold :height 1.44))))
   `(Info-title-3-face ((,class (:family "helv" :weight bold :height 1.2))))
   `(Info-title-4-face ((,class (:family "helv" :weight bold))))
   `(company-tooltip ((,class (:background "grey30"))))
   `(company-tooltip-common ((t (:inherit font-lock-function-face))))
   `(company-tooltip-selection ((,class :foreground "grey80" :background "grey20")))
   `(company-tooltip-annotation ((,class (:foreground ,contrasty-red, :weight bold))))
   `(company-scrollbar-fg ((t :background ,pink)))
   `(company-scrollbar-bg ((t :background ,dark-pink)))
   `(compilation-column-number ((,class (:foreground "LightGreen"))))
   `(compilation-error ((,class (:foreground "Red1"))))
   `(compilation-info ((,class (:weight normal :foreground "LightSkyBlue"))))
   `(compilation-line-number ((,class (:foreground "LightGreen"))))
   `(compilation-mode-line-exit ((,class (:foreground "blue4"))))
   `(cperl-array-face ((,class (:foreground "yellow2"))))
   `(cperl-hash-face ((,class (:foreground "coral1"))))
   `(cursor ((,class (:background "#B54639"))))
   `(default ((,class (:background ,background-color :foreground "gray85"))))
   ;; `(diff-added ((,class (nil))))
   ;; `(diff-changed ((,class (nil))))
   `(diff-context ((,class (:foreground "294436"))))
   `(diff-file-header ((,class (:background "grey60"))))
   `(diff-function ((,class (:inherit diff-header))))
   `(diff-header ((,class (:background "grey45"))))
   `(diff-hunk-header ((,class (:inherit diff-header))))
   `(diff-index ((,class (:inherit diff-file-header))))
   `(diff-indicator-added ((,class (:foreground ,diff-foreground :background "#447152"))))
   `(diff-indicator-changed ((,class (:foreground ,diff-foreground :background "#385570"))))
   `(diff-indicator-removed ((,class (:foreground ,diff-foreground :background "#484A4A"))))
   `(diff-refine-change ((,class (:background ,background-color))))
   ;; `(diff-removed ((,class (nil))))
   `(dired-marked ((,class (:background "#D7503C" :foreground "white"))))
   `(ediff-current-diff-A ((,class (:background "#27586B" :foreground ,diff-foreground))))
   `(ediff-current-diff-B ((,class (:background "#AA7439" :foreground ,diff-foreground))))
   `(ediff-current-diff-C ((,class (:background "#1E5D35" :foreground ,diff-foreground))))
   `(ediff-even-diff-B ((,class (:background "Grey50" :foreground ,diff-foreground))))
   `(ediff-fine-diff-A ((,class (:background "#1C4251" :foreground ,diff-foreground))))
   `(ediff-fine-diff-B ((,class (:background "#90572A" :foreground ,diff-foreground))))
   `(ediff-fine-diff-C ((,class (:background "#143F24" :foreground ,diff-foreground))))
   `(ediff-odd-diff-A ((,class (:background "Grey40" :foreground ,diff-foreground))))
   `(ediff-odd-diff-B ((,class (:background "Grey35" :foreground ,diff-foreground))))
   `(ediff-odd-diff-C ((,class (:background "Grey30" :foreground ,diff-foreground))))
   `(error ((,class (:foreground "red"))))
   `(elixir-attribute-face ((,class (:foreground "#94558D" :slant italic))))
   `(elixir-ts-attribute-face ((,class (:foreground "#94558D" :slant italic))))
   `(elixir-ts-module-attribute-face ((,class (:foreground "#94558D" :slant italic))))
   `(elixir-ts-comment-doc-attribute-face ((,class (:foreground "#94558D" :slant italic))))
   `(elixir-ts-comment-doc-identifier-face ((,class (:foreground "#94558D" :slant italic))))
   `(elixir-atom-face ((,class (:foreground "#2f8c9b", :background "#282C30"))))
   `(elixir-ts-atom-face ((,class (:foreground "#2f8c9b", :background "#282C30"))))
   `(flymake-error ((,class (:background nil :underline (:style wave :color "red")))))
   `(flymake-warning ((,class (:background nil :underline  (:style wave :color "#e89c4c")))))
   `(font-lock-comment-delimiter-face ((,class (:foreground "gray50"))))
   `(font-lock-comment-face ((,class (:foreground "#8395a8"))))
   `(font-lock-builtin-face ((,class (:foreground ,contrasty-red))))
   `(font-lock-constant-face ((,class (:foreground "#53eaa8"))))
   `(font-lock-doc-face ((,class (:foreground "#8395a8"))))
   `(font-lock-function-name-face ((,class (:foreground "#f1a957"))))
   `(font-lock-function-call-face ((,class (:foreground nil))))
   `(font-lock-keyword-face ((,class (:foreground ,contrasty-red))))
   `(font-lock-preprocessor-face ((,class (:foreground "gold"))))
   `(font-lock-reference-face ((,class (:foreground ,contrasty-red))))
   `(font-lock-regexp-grouping-backslash ((,class (:weight bold))))
   `(font-lock-regexp-grouping-construct ((,class (:weight bold))))
   `(font-lock-string-face ((,class (:foreground "#529Bc8" :background "#2C3239"))))
   `(font-lock-type-face ((t (:foreground ,pink :background ,dark-pink, :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground "#329dcc"))))
   `(fringe ((,class (:background ,dark-pink :box nil))))
   `(highlight ((,class (:background "#385570"))))
   `(idle-highlight ((,class (:background "#38302A" :underline (:color "#D5801D" :style wave)))))
   `(ido-first-match ((,class (:weight normal :foreground "orange"))))
   `(ido-only-match ((,class (:foreground "#B54639"))))
   `(ido-subdir ((,class (:foreground nil :inherit font-lock-keyword-face))))
   `(info-header-node ((,class (:foreground ,contrasty-red))))
   `(info-header-xref ((,class (:foreground "SeaGreen2"))))
   `(info-menu-header ((,class (:family "helv" :weight bold))))
   `(info-node ((,class (:foreground ,contrasty-red))))
   `(info-xref ((,class (:foreground "SeaGreen2"))))
   `(isearch ((,class (:background "coral2" :foreground "white"))))
   `(isearch-lazy-highlight-face ((,class (:background "coral4" :foreground "white"))))
   `(lazy-highlight ((,class (:background "cadetblue" :foreground "grey90"))))
   `(linum ((,class (:foreground "#515c68" :background "#212124"))))
   `(magit-diff-added ((,class (:background ,diff-added :foreground ,diff-foreground))))
   `(magit-diff-added-highlight ((,class (:background ,diff-added  :foreground ,diff-foreground))))
   `(magit-diff-removed ((,class (:background ,diff-deleted :foreground ,diff-foreground))))
   `(magit-diff-conflict-heading ((,class (:weight bold :background "#163342" :foreground ,diff-foreground :box (:line-width 1 :color "#1d4356" :style nil)))))
   `(magit-diff-hunk-heading ((,class :background "#2a3d47" :box (:color "#2b4a59"))))
   `(magit-diff-removed-highlight ((,class (:background "#70263B" :foreground ,diff-foreground))))
   `(magit-diff-their-highlight ((,class (:background "#1a4c39" :foreground ,diff-foreground))))
   `(match ((,class (:background "DeepPink4"))))
   `(minibuffer-prompt ((,class (:foreground "DeepPink3"))))
   '(mode-line ((t (:weight bold :box (:line-width 1 :color "#555555" :style nil) :foreground "#afafaf" :background "#363639"))))
   '(mode-line-buffer-id ((t (:weight bold :foreground "#f1a957"))))
   '(mode-line-emphasis ((((class color) (min-colors 89)) (:foreground "#eeeeee"))))
   '(mode-line-highlight ((((class color) (min-colors 89)) (:weight bold :box nil :foreground "#bc4537"))))
   '(mode-line-inactive ((((class color) (min-colors 89)) (:weight normal :background "#28282b" :foreground "#a63e32" :box (:line-width 1 :color nil :style pressed-button)))))
   `(neo-root-dir-face ((,class (:foreground ,pink))))
   `(neo-dir-link-face ((,class (:foreground "#B49672"))))
   `(neo-file-link-face ((,class (:foreground "wheat"))))
   `(org-todo ((,class (:foreground ,contrasty-red :weight bold))))
   `(outline-1 ((,class (:foreground "SkyBlue1"))))
   `(outline-2 ((,class (:foreground "CadetBlue1"))))
   `(outline-3 ((,class (:foreground "LightSteelBlue1"))))
   `(outline-4 ((,class (:foreground "turquoise2"))))
   `(outline-5 ((,class (:foreground "aquamarine1"))))
   `(primary-selection ((,class (:background "blue3"))))
   `(py-decorators-face ((, class :foreground "#2f8c9b", :background "#282C30")))
   `(region ((,class (:background "#65271D"))))
   `(show-paren-match ((,class (:foreground "#ffef28" :background "#3b514d" :weight bold))))
   `(show-paren-mismatch ((,class (:background "red1" :foreground "white"))))
   `(smerge-refined-removed ((,class (:foreground ,diff-deleted))))
   `(success ((,class (:foreground "SeaGreen2"))))
   `(warning ((,class (:foreground "Yellow"))))))
(fringe-mode 4)
(provide-theme 'glacial-complete)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; glacial-complete-theme.el ends here
