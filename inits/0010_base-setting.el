;; file: 0010_base-setting.el

(progn ;; `설정::한글'
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Language-Environments.html
  (set-language-environment "Korean"))

(progn ;; `설정::utf-8'
  ;; utf-8 설정
  ;; ref: https://www.masteringemacs.org/article/working-coding-systems-unicode-emacs
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/elisp/Default-Coding-Systems.html
  (set-default-coding-systems 'utf-8)
  (prefer-coding-system 'utf-8))

(progn ;; `설정::Y_혹은_N으로_대답'
  (setq read-answer-short t)
  (setq use-short-answers t))


(progn ;; `설정::인덴트'
  (setq-default indent-tabs-mode nil)
  (setq tab-width 4))

