(require 'ansi-color)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq ring-bell-function 'ignore)
(setq inhibit-splash-screen t)

;; Maximize
(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Set default font
(set-face-attribute 'default nil
  :family "Lekton Nerd Font Mono"
  :height 185
  :weight 'normal
  :width 'expanded)

;; Themes
(load-theme 'dracula t)
(set-background-color "#16161e")
(if window-system (global-hl-line-mode t))
(if window-system (show-paren-mode 1))
(set-face-foreground 'highlight nil)
(set-face-background 'hl-line "#101016")

;; Line numbers
(if window-system (global-display-line-numbers-mode 1))
(menu-bar-display-line-numbers-mode 'relative)
(set-face-foreground 'line-number "#ffffff")
(set-face-background 'line-number "#262626")
(set-face-foreground 'line-number-current-line "#ff79c6")
(set-face-background 'line-number-current-line "#101016")

;; Neotree
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; Status bar
(use-package winum
  :config (winum-mode))
(use-package fancy-battery
  :config (fancy-battery-mode))
(use-package all-the-icons)
(use-package powerline)
(use-package spaceline)
(use-package spaceline-all-the-icons 
  :after (spaceline magit neotree)
  :config
  (custom-set-faces
    '(powerline-active1 ((t (:background "SlateBlue4" :foreground "#f8f8f2"))))
    '(powerline-active2 ((t (:background "MediumPurple4" :foreground "#f8f8f2")))))
  (setq spaceline-all-the-icons-highlight-file-name t)
  (setq spaceline-all-the-icons-separator-type 'none)
  (setq spaceline-all-the-icons-window-number-always-visible t)
  (setq spaceline-all-the-icons-icon-set-flycheck-slim (quote outline))
  (setq spaceline-all-the-icons-icon-set-git-ahead (quote commit))
  (setq spaceline-all-the-icons-icon-set-modified (quote circle))
  (setq spaceline-all-the-icons-icon-set-window-numbering (quote square))
  (setq spaceline-all-the-icons-window-number-always-visible t)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-neotree)
  (spaceline-toggle-all-the-icons-neotree-context-on)
  (spaceline-toggle-all-the-icons-neotree-index-on)
  (spaceline-toggle-all-the-icons-neotree-open-bracket-on)
  (spaceline-all-the-icons--setup-git-ahead)
  (spaceline-toggle-all-the-icons-battery-status-on)
  (spaceline-toggle-all-the-icons-git-status-on)
  (spaceline-toggle-all-the-icons-vc-icon-off)
  (spaceline-toggle-all-the-icons-mode-icon-on)
  (spaceline-toggle-all-the-icons-vc-status-on))

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/dotFiles/emacs/logo.png")
  (setq dashboard-banner-logo-title "")
  (setq dashboard-center-content t)
  (setq dashboard-items '((projects . 15) (recents . 5)))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;; EVIL mode
(use-package evil
  :config
  (evil-mode 1)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))
(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "bn" 'next-buffer
    "bl" 'list-buffers
    "bk" 'kill-this-buffer
    "bK" 'kill-some-buffers
    "bp" 'previous-buffer
    "ff" 'ag-dired
    "ft" 'neotree-toggle
    "gs" 'magit-status
    "pd" 'projectile-find-dir
    "pf" 'projectile-find-file
    "pF" 'projectile-find-file-dwim
    "pg" 'projectile-find-tag
    "pG" 'projectile-regenerate-tags
    "pk" 'projectile-kill-buffers
    "pr" 'projectile-recentf
    "pR" 'projectile-replace
    "pp" 'projectile-switch-project
    "ss" 'ag
    "sf" 'ag-dired
    "sF" 'ag-project-dired
    "sp" 'ag-project
    "tn" 'shell-pop
    "wd" 'delete-window
    "wh" 'evil-window-left
    "wH" 'evil-window-move-far-left
    "wj" 'evil-window-down
    "wJ" 'evil-window-move-very-bottom
    "wk" 'evil-window-up
    "wK" 'evil-window-move-very-top
    "wl" 'evil-window-right
    "wL" 'evil-window-move-far-right
    "ws" 'split-window-below
    "w=" 'balance-windows
    "w/" 'split-window-right))

(provide 'init-ui)

