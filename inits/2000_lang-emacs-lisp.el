;; file: 2000_lang-emacs-lisp.el

(use-package lang-emacs-lisp
  :ensure nil
  :bind
  (("C-c C-l" . (lambda () (interactive) (load-file buffer-file-name)))
   ("C-c C-z" . ielm))
  :config
  (add-hook 'emacs-lisp-mode-hook
	    #'eldoc-mode)
  ;; ref: imenu - https://www.gnu.org/software/emacs/manual/html_node/emacs/Imenu.html
  (add-hook 'emacs-lisp-mode-hook
	    #'(lambda () (imenu-add-to-menubar "@Index")))
  ;; ref: prettify-symbols-mode - prog-mode.el
  (add-hook 'emacs-lisp-mode-hook
	    #'prettify-symbols-mode)
  ;; ref: https://stackoverflow.com/a/6914626
  (add-hook 'emacs-lisp-mode-hook
            '(lambda ()
               (set (make-local-variable lisp-indent-function)
                    'common-lisp-indent-function)))
  ;; ref: inferior-emacs-lisp-mode "버퍼: *ielm*"
  (add-hook 'lisp-interaction-mode-hook
	    #'eldoc-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook
	    #'eldoc-mode))

;; (use-package eldoc-box
;;   :ensure t
;;   :config
;;   (add-hook 'emacs-lisp-mode-hook #'eldoc-box-hover-at-point-mode))
