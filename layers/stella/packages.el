;;; packages.el --- stella layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `stella-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `stella/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `stella/pre-init-PACKAGE' and/or
;;   `stella/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst stella-packages
  '(
    ace-pinyin
    bing-dict
    fcitx
    general
    org
    pangu-spacing
    ;; pyim
    )
  "The list of Lisp packages required by the stella layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; ace-pinyin
(defun stella/init-ace-pinyin ()
  ;; (setq ace-pinyin-use-avy nil) ;; uncomment if you want to use `ace-jump-mode
  (ace-pinyin-global-mode +1)
  ;; (setq ace-pinyin-simplified-chinese-only-p nil)
  )

;; bing-dict
(defun stella/init-bing-dict ()
  (with-eval-after-load 'bing-dict
    (setq bing-dict-show-thesaurus 'both)
    ;; (setq bing-dict-pronunciation-style 'uk)
    ))

(defun stella/init-fcitx ()
  ;; Make sure the following comes before `(fcitx-aggressive-setup)'
  (setq fcitx-active-evil-states '(insert emacs hybrid)) ;; if you use hybrid mode
  (fcitx-aggressive-setup)
  (fcitx-prefix-keys-add "M-m") ;; M-m is common in Spacemacs
  (when (spacemacs/system-is-linux)
    (setq fcitx-use-dbus t) ;; uncomment if you're using Linux
    ))

(defun stella/init-general ()
  )

(defun stella/post-init-org ()
  (with-eval-after-load 'org
    (;; load-languages in org-mode
     org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (sh . t)
       (python . t)
       (R . t)
       (ruby . t)
       (ditaa . t)
       (dot . t)
       (octave . t)
       (sqlite . t)
       (perl . t)
       (C . t)
       ))
    ))

(defun stella/init-pangu-spacing ()
  (global-pangu-spacing-mode 1)
  (setq pangu-spacing-real-insert-separtor t)
  )

;;; packages.el ends here