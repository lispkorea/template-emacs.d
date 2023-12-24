;; file: 2003_lang-racket.el


;; ref: https://racket-mode.com/
;; command: https://racket-mode.com/#Commands

;; C-M-i        complete-symbol 
;; C-c C-k	racket-run-module-at-point
;; C-c C-c	racket-run-module-at-point
;; C-M-x	racket-send-definition
(use-package racket-mode
  :ensure t
  :config
  (require 'racket-xp)
  (add-hook 'racket-mode-hook #'racket-xp-mode))

