;; file: util-command.el

(use-package urgrep
  ;; ref: https://github.com/jimporter/urgrep
  :ensure (:host github :repo "jimporter/urgrep"))

(use-package ag
  :ensure t
  :commands (ag)
  :config
  (setq ag-highlight-search t)
  (setq ag-group-matches nil))
