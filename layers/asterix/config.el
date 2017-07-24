;;; config.el --- asterix Layer configuration variables File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; ;; reset frame size
;; (asterix/reset-frame-size)
;; ;; learn from liu233w
;; (add-hook 'after-make-frame-functions 'asterix/reset-frame-size)

;; (unless (functionp 'asterix/reset-frame-size)
;;   (defun asterix/reset-frame-size (&optional frame)
;;     "reset frame size"
;;     (interactive)
;;     (when frame
;;       (select-frame frame))
;;     (set-frame-size (selected-frame) 96 48))
;;   )

;; set face-attribute font, disabling in default theme
(set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
(set-face-attribute 'font-lock-type-face nil :weight 'semi-bold :slant 'italic)
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
;; (set-face-attribute 'font-lock-string-face nil :foreground '"forest green")

;; ;; swap numbers and symbols
;; ;; (add-hook 'evil-insert-state-entry-hook 'evil-swap-keys-swap-number-row)
;; (add-hook 'prog-mode-hook 'evil-swap-keys-swap-number-row)

;; performance of opening large file
(add-hook 'find-file-hook 'spacemacs/check-large-file)
(defun spacemacs/check-large-file ()
  (when (> (buffer-size) 500000)
    (progn
      (fundamental-mode)
      (hl-line-mode -1)
      ;; (evil-swap-keys-mode -1)
      )))

;; improve the performance of opening org file
;; (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
(add-hook 'org-mode-hook (lambda ()
                           ;; (auto-fill-mode)  ;; if column ==80 return
                           (setq truncate-lines nil)  ;; truncate lines ignore words
                           ;; (visual-line-mode t)
                           ;; (spacemacs/toggle-centered-point-on)
                           ))

;; performance of opening markdown file
(add-hook 'markdown-mode-hook (lambda ()
                                ;; (visual-line-mode t)
                                (spacemacs/toggle-centered-point-on)))

;; line-numbers for yaml-mode
(add-hook 'yaml-mode-hook (lambda () (spacemacs/toggle-line-numbers-on)) 'append)
