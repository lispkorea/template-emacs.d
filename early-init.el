;; file: early-init.el

;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html
;; ref: https://github.com/DiamondBond/emacs/blob/master/early-init.el

(setq gc-cons-threshold 16777216) ; 16mb



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
