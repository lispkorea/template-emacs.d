;; file: setting-font.el

;; https://dejavu-fonts.github.io/
;; https://github.com/naver/d2codingfont
;; https://www.google.com/get/noto/help/cjk/
;; ref: https://www.emacswiki.org/emacs/SetFonts

;; 0 o O l L i I 1 !
;; , . "" '' ``
;; ;:|\/
;; [](){}<>
;; +-*~
;; S s C c V v P p

;; 한글 테스트
;; AABB CCDDEE

;; abcdefghijklmnopqrstuvwxyz
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; Ξεσκεπάζω την ψυχοφθόρα βδελυγμία.
;; αβγδεζηθικλμνξοπρστυφχψως
;; ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ
;; У рудога вераб’я ў сховішчы
;; пад фатэлем ляжаць нейкія гаючыя зёлкі.
;; абвгґдђѓеёєжнњопрс
;; тћќуўuфхцчџшщъыьэюя
;; АБВГҐДЂЃЕЁЄЖНЊОПРС
;; ТЋЌУЎUФХЦЧЏШЩЪЫЬЭЮЯ
;; & 1234567890 .,:;… ¡!¿?
;; '" ‘’ “” ‚„ ′″‹› «» -–—
;; (/)[|]{\} * †‡§¶|‖ @ №
;; $£¥€₹₺₽¢ƒ %‰ ¼½¾⅓⅔⅛⅜⅝
;; +−×÷∙=<>≤≥±^≠~≈¬ #π∞µ∂∫√
;; •◦▪▫▴▸▾◂▵▹▿◃
;; ●○■□▲▶▼◀△▷▽◁❒◆►◄◙◉◘
;; ←↖↑↗→↘↓↙ ⇐⇑⇒⇓ ↔↕↨ ♀♂ ☼⌂ ☑ ✓
;; ♪ ♫ ♥ ​♣​ ♦​ ♠​ ☺​ ☻ ​❤​ ☕​ 💩 ​🤖​ 🔒
;;      




(when (display-graphic-p)
  (defun font-installed-p (font-name)
    "Return t if FONT-NAME is available on the system."
    (if (null (find-font (font-spec :name font-name)))
        nil
      t))
  ;; `비쥬얼::폰트_nerd-icons'
  (use-package nerd-icons
    ;; ref: https://github.com/rainstormstudio/nerd-icons.el
    :ensure t
    :if
    (or (display-graphic-p)
        (daemonp))
    :config
    (when (and (display-graphic-p)
               (not (font-installed-p nerd-icons-font-family)))
      (nerd-icons-install-fonts t)
      (message "⚠ Nerd Font not found. On Windows, please open the font file and click 'Install' to install it system-wide.")))
  (use-package nerd-icons-dired
    ;; https://github.com/rainstormstudio/nerd-icons-dired
    :ensure t
    :after (nerd-icons dired)
    :hook (dired-mode . nerd-icons-dired-mode))
  (use-package nerd-icons-ibuffer
    ;; https://github.com/seagle0128/nerd-icons-ibuffer
    :ensure t
    :after (nerd-icons ibuffer)
    :hook (ibuffer-mode . nerd-icons-ibuffer-mode)))

(when (display-graphic-p)
  (defun available-font? (font)
    (->> (font-family-list)
         (member font)))
  (let ((font-name "D2Coding"))
    (when (available-font? font-name)
      (set-face-font 'default font-name)
      (set-frame-font font-name nil t)
      (set-fontset-font "fontset-default" '(#x1100 . #x11ff) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '#x20a9 (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#x302e . #x302f) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#x3130 . #x318f) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#x3200 . #x321e) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#x3260 . #x327f) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#xa960 . #xa97f) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#xac00 . #xd7a3) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#xd7b0 . #xd7ff) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '(#xffa1 . #xffdc) (cons font-name "iso10646"))
      (set-fontset-font "fontset-default" '#xffe6 (cons font-name "iso10646"))
      (set-fontset-font t 'hangul (font-spec :name font-name))
      (set-face-attribute 'default nil :family font-name)
      (setq face-font-rescale-alist
            `((,font-name . 1))))))
