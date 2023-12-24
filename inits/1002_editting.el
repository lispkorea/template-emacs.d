;; file: 1002_editting.el


(use-package electric-pair-mode
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Matching.html
  :ensure nil
  :init
  (require 'elec-pair)
  (setq electric-pair-preserve-balance t)
  (add-hook 'prog-mode-hook #'electric-pair-local-mode))


(use-package apheleia
  :ensure t
  :demand
  :config
  (add-hook 'clojure-mode-hook #'apheleia-mode)
  (add-hook 'emacs-lisp-mode-hook #'apheleia-mode)

  (setf (alist-get 'cljstyle     apheleia-formatters) '("cljstyle" "pipe"))
  (setf (alist-get 'clojure-mode apheleia-mode-alist) 'cljstyle)
  )
