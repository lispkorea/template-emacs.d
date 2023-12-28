;; file: early-init.el

;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html
;; ref: https://github.com/DiamondBond/emacs/blob/master/early-init.el

(setq 16MB 16777216) ; 16mb

;; 기본 #define GC_DEFAULT_THRESHOLD (100000 * word_size)
;; most-positive-fixnum
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)           ; 기본 0.1
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq site-run-file nil)


(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16MB)
            (setq gc-cons-percentage 0.1)
            (setq file-name-handler-alist file-name-handler-alist-original)))

;; Silence compiler warnings
(setq warning-minimum-level :emergency)
(setq warning-suppress-types '((comp)))
(setq native-comp-async-report-warnings-errors nil)
(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local cl-functions))
(setq-default native-comp-speed 3) ;; -O3

(setq native-comp-deferred-compilation nil)
(setq native-comp-deferred-compilation-deny-list nil)



(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq idle-update-delay 0.1)
(setq bidi-inhibit-bpa t)


(setq frame-inhibit-implied-resize t)

(setq fast-but-imprecise-scrolling t)
(setq inhibit-compacting-font-caches t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; (setq package-enable-at-startup nil)
;; (setq package--init-file-ensured t)
;; (setq use-package-always-defer t)
(setq package-native-compile t)

