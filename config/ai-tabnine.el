;; file: ai-tabnine.el

;; ref: https://www.tabnine.com/install/emacs
;; ref: https://github.com/TommyX12/company-tabnine
;; Run M-x company-tabnine-install-binary to install the TabNine binary for your system.


(use-package company-tabnine
  :ensure t
  :requires (company)
  :config
  (require 'company-tabnine)
  (add-to-list 'company-backends #'company-tabnine))
