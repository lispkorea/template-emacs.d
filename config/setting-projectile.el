;; file: setting-projectile.el

(use-package projectile
  ;; ref: https://github.com/bbatsov/projectile
  ;; ref: https://docs.projectile.mx/
  :ensure t
  :bind ("C-x p" . projectile-find-file)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alien)
  (projectile-mode +1))
