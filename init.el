;; file: init.el

(progn ;; `initial-file&directory'
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (load custom-file 'noerror)
  ;; lock 파일 .#파일명
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup.html
  (setq make-backup-files nil)
  ;; backup 파일 파일명~
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/elisp/File-Locks.html
  (setq create-lockfiles nil)
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Save-Control.html
  (setq auto-save-default nil))

(setq debug-on-error t)


(progn              ;; `설정'
  (require 'subr-x) ; for thread-last
  (thread-last
    "config-loader.el"
    (locate-user-emacs-file)
    (file-truename)
    (load-file))
  (defconst CONFIG_DIR "config/")
  (defconst CONFIG_LIST
    '(
;;; =========== `boot-'
      boot-elpaca.el
      ;; boot-package.el
;;; =========== `base-'
      base-define.el
      base-setting.el
;;; =========== `os-'
      os-windows.el
      os-macos.el
      os-linux.el
;;; =========== `setting-'
      setting-theme.el
      setting-ui.el
      setting-navigation.el
      setting-editting.el
      setting-font.el
      setting-treemacs.el
      setting-projectile.el
;;; =========== `lang-' : language(programming)
      lang-emacs-lisp.el
      ;; lang-common-lisp-sly.el
      lang-common-lisp-slime.el
      lang-clojure-cider.el
      lang-racket-racket-mode.el
;;; =========== `file-' : file type
      file-markdown.el
      file-json.el
;;; =========== `util-'
      util-git.el
      util-flymake.el
      util-quickrun.el
      util-command.el
      util-company.el
      ;; util-completion.el
;;; =========== `ai-'
      ;; ai-tabnine.el
      ))
  (config-loader:load-config CONFIG_DIR CONFIG_LIST))

