;; file: lang-common-lisp.el

(use-package sly
  :requires (subr-x)
  :ensure t
  :config
  (setq inferior-lisp-program
        (string-trim
         (shell-command-to-string "which sbcl"))))
