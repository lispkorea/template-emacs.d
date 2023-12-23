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


(use-package package
  ;; 
  ;; ref: https://github.com/emacs-mirror/emacs/blob/master/lisp/emacs-lisp/package.el
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html
  ;; 
  ;; elpa(`E`macs `L`isp `P`ackage `A`rchive)
  ;; melpa(`M`ilkypostman `E`macs `L`isp `P`ackage `A`rchive)
  ;; 
  ;; elpa(gnu): https://elpa.gnu.org/
  ;; elpa(nognu): https://elpa.nongnu.org/
  ;; melpa: http://melpa.org/
  ;; melpa(stable): http://stable.melpa.org/
  ;; 미러 칸트대학: https://www.mirrorservice.org/
  ;; 미러 칭화대학: https://mirrors.tuna.tsinghua.edu.cn/help/elpa/
  :config
  (progn ;; `elpa'
    (defconst PACKAGE_ELPA_GNU
      '("gnu" . "https://elpa.gnu.org/packages/"))
    (defconst PACKAGE_ELPA_NOGNU
      '("nongnu" . "https://elpa.nongnu.org/nongnu/")))
  (progn ;; `melpa'
    (defconst PACKAGE_MELPA
      '("melpa" . "http://melpa.org/packages/"))
    (defconst PACKAGE_MELPA_STABLE
      '("melpa-stable" . "http://stable.melpa.org/packages/")))
  (progn ;; `mirrorservice'
    (defconst PACKAGE_MIRRORSERVICE_MELPA
      '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/"))
    (defconst PACKAGE_MIRRORSERVICE_MELPA_STABLE
      '("melpa-stable" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/")))
  (progn ;; `tsinghua'
    (defconst PACKAGE_TSINGHUA_GNU
      '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
    (defconst PACKAGE_TSINGHUA_NOGNU
      '("nognu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/"))
    (defconst PACKAGE_TSINGHUA_MELPA
      '("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
    (defconst PACKAGE_TSINGHUA_MELPA_STABLE
      '("melpa-stable-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")))

  ;;(setq-default package-user-dir DIR_ROOT_PACKAGE)
  (setq package-archives
	(list
         PACKAGE_ELPA_GNU
         PACKAGE_ELPA_NOGNU
         PACKAGE_MELPA
         )))

(use-package init-loader
  :ensure t
  :init
  (let* ((my-inits-dir (locate-user-emacs-file "inits")))
    (unless (file-exists-p my-inits-dir)
      (make-directory my-inits-dir t))
    (setq init-loader-directory my-inits-dir)
    ;; (setq init-loader-byte-compile t)
    (init-loader-load)))

