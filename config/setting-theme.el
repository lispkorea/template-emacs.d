;; file: setting-theme.el

(use-package doom-modeline
  ;; ref: https://github.com/seagle0128/doom-modeline
  :ensure t
  :config
  ;; (setq doom-modeline-minor-modes t)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-position-column-line-format '("%l"))
  (setq doom-modeline-total-line-number t)
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-icon t)
  ;; (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (setq doom-modeline-buffer-file-name-style 'relative-to-project)
  (add-hook 'after-init-hook #'doom-modeline-mode))

(use-package doom-themes
  ;; ref: https://github.com/doomemacs/themes
  ;; themelist: https://github.com/doomemacs/themes#theme-list
  :ensure t
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-tomorrow-day t))
