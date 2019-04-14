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
  (setq spaceline-all-the-icons-separator-type 'slant)
  (setq spaceline-all-the-icons-primary-separator "")
  (setq spaceline-all-the-icons-secondary-separator "")
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
  (spaceline-toggle-all-the-icons-minor-modes-on)
  (spaceline-toggle-all-the-icons-vc-status-on))

;; Dashboard
(use-package dashboard
  :ensure t
  :if (< (length command-line-args) 2)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/dotFiles/emacs/logo.png")
  (setq dashboard-banner-logo-title "")
  (setq dashboard-center-content t)
  (setq dashboard-items '((projects . 15) (recents . 5)))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(provide 'init-ui)

