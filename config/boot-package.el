(progn
  (require 'package)
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

  (setq package-check-signature nil)

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
      '("gnu-tsinghua" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
    (defconst PACKAGE_TSINGHUA_NOGNU
      '("nognu-tsinghua" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/"))
    (defconst PACKAGE_TSINGHUA_MELPA
      '("melpa-tsinghua" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
    (defconst PACKAGE_TSINGHUA_MELPA_STABLE
      '("melpa-stable-tsinghua" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")))

  ;;(setq-default package-user-dir DIR_ROOT_PACKAGE)
  (setq package-archives
        (list
         PACKAGE_TSINGHUA_GNU
         PACKAGE_TSINGHUA_NOGNU
         PACKAGE_TSINGHUA_MELPA

         PACKAGE_ELPA_GNU
         PACKAGE_ELPA_NOGNU
         PACKAGE_MELPA
         ))
  (setq package-archive-priorities
        '(
	  ("gnu-tsinghua"     . 102)
          ("gnu-mirror-tsinghua" . 101)
          ("melpa-tsinghua"   . 100)
	  ("gnu"     . 10)
          ("gnu-mirror" . 5)
          ("melpa"   . 1)))
  )
