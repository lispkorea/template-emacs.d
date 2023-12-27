;; file: setting-navigation.el

(progn
  ;; `스크롤'
  (setq redisplay-dont-pause t)
  (setq scroll-margin 1)
  (setq scroll-step 1)
  (setq scroll-conservatively 10000)
  (setq scroll-preserve-screen-position 1)
  ;; `마우스'
  (setq mouse-wheel-follow-mouse 't)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))))

(use-package projectile
  ;; ref: https://github.com/bbatsov/projectile
  ;; ref: https://docs.projectile.mx/
  :ensure t
  :config
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alien)
  (projectile-mode +1))


(progn ;; `treemacs'
  (use-package treemacs
    ;; ref: https://github.com/Alexander-Miller/treemacs
    :ensure t
    :defer t
    :bind ("<f2>" . treemacs-rename-file)
    :config
    (treemacs-follow-mode +1)
    (treemacs-filewatch-mode +1)
    (treemacs-hide-gitignored-files-mode +1)
    ;; (add-hook 'after-init-hook #'treemacs)
    )
  (use-package treemacs-projectile
    :ensure t
    :after (treemacs projectile))
  (use-package treemacs-magit
    :ensure t
    :requires (magit)
    :after (treemacs magit))
  ;; (use-package treemacs-icons-dired
  ;;   :hook (dired-mode . treemacs-icons-dired-enable-once)
  ;;   :ensure t)
  ;; (use-package lsp-treemacs
  ;;   :ensure t
  ;;   :after (treemacs)
  ;;   :config
  ;;   (add-hook 'prog-mode-hook #'lsp-treemacs-sync-mode))
  )

(progn ;; `ibuffer'
  (use-package ibuffer
    ;; Emacs(22)
    ;; ref: https://github.com/emacs-mirror/emacs/blob/master/lisp/ibuffer.el
    :config
    (defalias 'list-buffers 'ibuffer)
    (setq ibuffer-expert t))
  ;; (use-package nerd-icons-ibuffer
  ;;   ;; ref: https://github.com/seagle0128/nerd-icons-ibuffer
  ;;   :requires ibuffer
  ;;   :ensure t
  ;;   :hook (ibuffer-mode . nerd-icons-ibuffer-mode))
  )


(use-package ido-vertical-mode
  ;; ref: https://github.com/creichert/ido-vertical-mode.el
  :ensure t
  :config
  (ido-mode +1)
  (ido-vertical-mode +1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package amx
  ;; smex => amx
  ;; ref: https://github.com/DarwinAwardWinner/amx
  :ensure t
  :config
  (amx-mode))

