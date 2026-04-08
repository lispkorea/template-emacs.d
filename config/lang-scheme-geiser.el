;; file: lang-scheme-geiser-chez.el

(use-package geiser
  ;; https://gitlab.com/emacs-geiser/guile
  :ensure t
  :mode ("\\.ss\\'" . scheme-mode)
  :config
  (setq geiser-active-implementations '(mit guile chez))
  )


(use-package geiser-mit
  ;; https://gitlab.com/emacs-geiser/mit
  :ensure t
  :requires (geiser))

(use-package geiser-guile
  ;; https://gitlab.com/emacs-geiser/guile
  :ensure t
  :disabled t
  :requires (geiser))

(use-package geiser-chez
  ;; https://gitlab.com/emacs-geiser/chez
  :ensure t
  :disabled t
  :requires (geiser))


