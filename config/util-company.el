;; file: util-company.el

(use-package company
  :ensure t
  :config
  ;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  (global-company-mode))



