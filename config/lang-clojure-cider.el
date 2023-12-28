;; file: lang-clojure-cider.el


;; ** custom
;;    | C-c C-x C-c C-r | cider-refresh                                               |
;;    | C-M-t           | projectile-toggle-between-implementation-and-test           |
;;    | C-c C-o         | cider-find-and-clear-repl-output or cider-repl-clear-buffer |

;; ** elisp
;;    |-----------------+-------------------------------|
;;    | eval            |                               |
;;    |-----------------+-------------------------------|
;;    | C-c M-;         | cider-eval-defun-to-comment   |
;;    | C-c C-e         | cider-eval-last-sexp          |
;;    | C-M-x           | cider-eval-defun-at-point     |
;;    | C-c C-m         | cider-macroexpand-1           |
;;    | C-c M-m         | cider-macroexpand-all         |
;;    | C-c M-n (M-)n   | cider-repl-set-ns             |
;;    |-----------------+-------------------------------|
;;    | nav             |                               |
;;    |-----------------+-------------------------------|
;;    | M-.             | cider-find-var                |
;;    | M-,             | cider-pop-back                |
;;    | M-TAB           | complete-symbol               |
;;    | C-c C-z         | cider-switch-to-repl-buffer   |
;;    |-----------------+-------------------------------|
;;    | connection      |                               |
;;    |-----------------+-------------------------------|
;;    | C-c C-x C-c C-j | cider-connect-clj             |
;;    | C-c C-q         | cider-quit                    |
;;    | C-c M-r         | cider-restart                 |
;;    |-----------------+-------------------------------|
;;    | test            |                               |
;;    |-----------------+-------------------------------|
;;    | C-c C-t C-t     | cider-test-run-test           |
;;    | C-c C-t C-g     | cider-test-rerun-test         |
;;    | C-c C-t C-n     | cider-test-run-ns-tests       |
;;    | C-c C-t C-r     | cider-test-rerun-failed-tests |
;;    |-----------------+-------------------------------|
;;    | hang            |                               |
;;    |-----------------+-------------------------------|
;;    | C-c C-b         | cider-interrupt               |
;;    |-----------------+-------------------------------|
;;    | doc             |                               |
;;    |-----------------+-------------------------------|
;;    | C-c C-d C-d     | cider-doc                     |
;;    | C-c C-d C-j     | cider-javadoc                 |
;;    |-----------------+-------------------------------|

(use-package cider
  ;; ref: https://github.com/clojure-emacs/cider
  ;; ref: https://cider.readthedocs.io/en/latest/interactive_programming/
  :ensure t
  :bind
  ;; https://github.com/clojure-emacs/cider/blob/master/doc/interactive_programming.md
  ;; https://github.com/clojure-emacs/cider/blob/master/cider.el
  ()
  :config
  ;; https://github.com/clojure-emacs/cider/blob/master/doc/configuration.md

  ;; overriding default cider-find-and-clear-repl-output to forcing clear!
  (define-key cider-mode-map (kbd "C-c C-o")
              #'(lambda () (interactive) (cider-find-and-clear-repl-output t)))
  (define-key cider-repl-mode-map (kbd "C-c C-o")
              'cider-repl-clear-buffer)

  ;; I don't like paredit.
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'turn-on-eldoc-mode)

  (setq cider-popup-stacktraces nil)
  (setq cider-repl-popup-stacktraces t)
  (setq cider-auto-jump-to-error nil)
  (setq nrepl-buffer-name-show-port t)

  (setq cider-overlays-use-font-lock t)
  (setq clojure-indent-style 'align-arguments)

  ;; for cider-eval-defun-to-comment
  (setq cider-eval-result-prefix ";; => ")

  ;; for cider-doc
  (setq cider-prompt-for-symbol nil)

  (setq cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-wrap-history t
        cider-repl-history-size 10000
        cider-prefer-local-resources t)

  (defun cider-reset ()
    (interactive)
    (cider-interactive-eval "(user/reset)"))

  (defun cider-refresh ()
    (interactive)
    (cider-interactive-eval "(require '[clojure.tools.namespace.repl]) (clojure.tools.namespace.repl/refresh)"))

  (define-key cider-repl-mode-map (kbd "C-c C-x C-c C-r")
              'cider-refresh))


(use-package clojure-mode
  :ensure t
  :requires cider
  :config
  (add-hook 'clojure-mode-hook 'subword-mode)
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

  ;; (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (define-clojure-indent
   (implement '(1 (1)))
   (letfn     '(1 ((:defn)) nil))
   (proxy     '(2 nil nil (1)))
   (reify     '(:defn (1)))
   (deftype   '(2 nil nil (1)))
   (defrecord '(2 nil nil (1)))
   (specify   '(1 (1)))
   (specify   '(1 (1)))
   ;;
   (fn-traced '(1 (1))))

  (define-key clojure-mode-map (kbd "C-;") 'mark-sexp)
  (customize-set-variable 'clojure-align-forms-automatically t)

  ;; eye-candy
  (add-to-list 'auto-coding-alist '("\\.clj\\'" . utf-8))
  (add-to-list 'auto-coding-alist '("\\.cljs\\'" . utf-8))
  (add-to-list 'auto-coding-alist '("\\.cljx\\'" . utf-8))

  (font-lock-add-keywords
   'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "λ")
                              nil)))))
  (font-lock-add-keywords
   'clojure-mode `(("\\(#\\)("
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "ƒ")
                              nil)))))
  (font-lock-add-keywords
   'clojure-mode `(("\\(#\\){"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "∈")
                              nil))))))
