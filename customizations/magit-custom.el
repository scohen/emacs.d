;; Displays magit-status in the current frame

;; the following forces magit to split the buffer vertically
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

;; (setq magit-display-buffer-function
;;       (lambda (buffer)
;;         (display-buffer
;;          buffer
;;          (if
;;              (and (derived-mode-p 'magit-mode)
;;                   (memq (with-current-buffer buffer major-mode)
;;                         '(magit-process-mode
;;                           magit-revision-mode
;;                           magit-diff-mode
;;                           magit-stash-mode
;;                           magit-status-mode)))
;;              nil
;;            '(display-buffer-use-some-window)))))
;;            ;;'(display-buffer-same-window)))))

;; (require 'magit)



(defun magit-display-buffer-pop-up-frame (buffer)
  (if (with-current-buffer buffer (eq major-mode 'magit-status-mode))
      (display-buffer buffer
                      '((display-buffer-reuse-window
                         display-buffer-pop-up-frame)
                        (reusable-frames . t)))
    (magit-display-buffer-traditional buffer)))

(use-package magit
  :ensure t
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-pop-up-frame))
