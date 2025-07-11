;; file: lang-common-lisp-slime.el

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program (executable-find "sbcl"))
  (setq slime-contribs '(slime-asdf
                         slime-fancy
                         slime-indentation
                         slime-sbcl-exts
                         slime-scratch))
  (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
  (setq slime-net-coding-system 'utf-8-unix)
  :config
  (progn
    (define-key slime-mode-map (kbd "C-c M-n") 'slime-sync-package-and-default-directory)
    ;; slime-lisp-implementations
    ;; common-lisp-hyperspec-root
    ;; common-lisp-hyperspec-symbol-table
    ;; common-lisp-hyperspec-issuex-table

    ;; `overlay'
    ;; ref: https://www.reddit.com/r/emacs/comments/bi4xk1/evaluation_overlays_in_slime_for_common_lisp/
    (require 'cl-lib)
    (require 'eros)
    (defun custom:slime-eval-last-expression-eros ()
      (interactive)
      (let* ((region (slime-region-for-defun-at-point))
             (form (apply #'buffer-substring-no-properties region))
             (pos-end (list (- (cadr region) 1)))
             (expr (slime-eval `(swank:eval-and-grab-output ,form))))
        (cl-destructuring-bind (output value) expr
          (let ((val (concat output value)))
            (eros--make-result-overlay value
              :where pos-end
              :duration eros-eval-result-duration)
            (message value)))))
    ;; (keymap-set slime-mode-map "C-M-x" 'slime-eval-defun)
    (keymap-set slime-mode-map "C-M-x" 'custom:slime-eval-last-expression-eros)))
