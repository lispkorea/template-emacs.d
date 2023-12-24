;; file: 1000_ui-visual.el

(progn ;; `비쥬얼::시작화면'
  ;; ref: https://github.com/emacs-mirror/emacs/blob/master/lisp/startup.el
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html
  (setq inhibit-startup-screen t))

(progn ;; `비쥬얼::라인'
  ;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Line-Truncation.html
  ;; `C-x x t` : (toggle-truncate-lines)
  (setq-default truncate-lines t)
  (setq-default indicate-empty-lines t)
  (global-display-line-numbers-mode +1)
  (global-hl-line-mode +1))

(use-package whitespace
  ;; ref: https://www.emacswiki.org/emacs/WhiteSpace
  :config
  (setq whitespace-style
        '(face
          trailing
          tabs
          tab-mark
          ))
  (global-whitespace-mode +1))

(progn ;; `비쥬얼::단순모드_On/Off'
  ;; 켜기: 양수     ; +1로 통일
  ;; 끄기: 0포함 음수; -1로 통일
  (display-time-mode +1)
  (tool-bar-mode -1)
  (menu-bar-mode +1)
  (scroll-bar-mode +1)
  (which-function-mode +1))

(progn ;; `비쥬얼::투명화'
  (defun toggle-transparency ()
    (interactive)
    (let ((alpha (frame-parameter nil 'alpha)))
      (set-frame-parameter
       nil
       'alpha
       (if (eql (cond ((numberp alpha) alpha)
                      ((numberp (cdr alpha)) (cdr alpha))
                      ;; Also handle undocumented (<active> <inactive>) form.
                      ((numberp (cadr alpha)) (cadr alpha)))
                100)
           '(80 . 50)
         '(100 . 100)))))
  (global-set-key (kbd "C-c t") 'toggle-transparency))

(progn ;; `비쥬얼::폰트_all-the-icons'
  ;; ref: https://github.com/domtronn/all-the-icons.el
  (use-package all-the-icons
    :ensure t
    :if (or (display-graphic-p)
	    (daemonp))
    :config
    ;; ref: https://github.com/domtronn/all-the-icons.el/issues/120#issuecomment-565438080
    (defun aorst/font-installed-p (font-name)
      "Check if font with FONT-NAME is available."
      (if (find-font (font-spec :name font-name))
	  t
	nil))
    (when (and (not (aorst/font-installed-p "all-the-icons"))
               (window-system))
      (all-the-icons-install-fonts t)))
  (use-package all-the-icons-dired
    ;; https://github.com/jtbm37/all-the-icons-dired
    :ensure t
    :after (all-the-icons dired)
    :hook (dired-mode . all-the-icons-dired-mode))
  (use-package all-the-icons-ibuffer
    ;; https://github.com/seagle0128/all-the-icons-ibuffer
    :ensure t
    :after (all-the-icons ibuffer)
    :hook (ibuffer-mode . all-the-icons-ibuffer-mode)))

(use-package paren
  ;; `비쥬얼::하이라이트_괄호범위'
  ;; parenthesis : 괄호만
  ;; expression  : 표현식전체
  ;; mixed       : 한 화면에 보이면 괄호, 아니면 표현식전체
  :config
  (setq show-paren-delay 0)
  (setq show-paren-style 'expression)
  ;; (setq show-paren-style 'parenthesis)
  ;; (setq show-paren-style 'mixed)
  (show-paren-mode +1))

(use-package rainbow-delimiters
  ;; `비쥬얼::하이라이트_괄호_형형색색'
  ;; ref: https://github.com/Fanael/rainbow-delimiters
  ;; ref: https://qiita.com/yakshaver/items/8f9efd5ced058e576f5e
  :ensure t
  :config
  (require 'color)
  (setq rainbow-delimiters-outermost-only-face-count 1)
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#9a4040")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#ff5e5e")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#ffaa77")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#dddd77")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#80ee80")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "#66bbff")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "#da6bda")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "#afafaf")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#f0f0f0")
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package highlight-numbers
  ;; `비쥬얼::하이라이트_숫자'
  ;; ref: https://github.com/Fanael/highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(use-package hl-todo
  ;; `비쥬얼::하이라이트_TODO'
  ;; ref: https://github.com/tarsius/hl-todo
  :ensure t
  :config
  (global-hl-todo-mode t))

(use-package smooth-scrolling
  ;; ref: https://github.com/aspiers/smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode +1))

(use-package doom-modeline
  ;; ref: https://github.com/seagle0128/doom-modeline
  :ensure t
  :config
  ;; (setq doom-modeline-minor-modes t)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-position-column-line-format '("%l"))
  (setq doom-modeline-total-line-number t)
  (setq doom-modeline-buffer-file-name-style 'relative-to-project)
  (add-hook 'after-init-hook #'doom-modeline-mode))

(use-package doom-themes
  ;; ref: https://github.com/doomemacs/themes
  ;; themelist: https://github.com/doomemacs/themes#theme-list
  :ensure t
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-tomorrow-night t))


(use-package solaire-mode
  ;; ref: https://github.com/hlissner/emacs-solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))
