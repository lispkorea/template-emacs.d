;; file: 1002_editting.el


(use-package electric-pair-mode
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Matching.html
  :ensure nil
  :init
  (require 'elec-pair)
  (setq electric-pair-preserve-balance t)
  (add-hook 'prog-mode-hook #'electric-pair-local-mode))


