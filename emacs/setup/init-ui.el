(require 'ansi-color)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq ring-bell-function 'ignore)
(setq inhibit-splash-screen t)

;; Colors
(setq black "#101016")
(setq pink "#ff79c6")
(setq dark-gray "#16161e")
(setq gray "#262626")
(setq off-white "#f8f8f2")
(setq dark-purple "#281156")
(setq purple "#6272a4")
(setq dark-red "#840a0a")
(setq green "#50fa7b")
(setq light-blue "#8be9fd")
(setq orange "#ffb86c")

;; Maximize
(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Set default font
(set-face-attribute 'default nil
  :family "Lekton Nerd Font Mono"
  :height 200
  :weight 'normal
  :width 'expanded)

;; Themes
(load-theme 'dracula t)
(set-background-color dark-gray)
(if window-system (global-hl-line-mode t))
(if window-system (show-paren-mode 1))
(set-face-foreground 'highlight nil)
(set-face-background 'hl-line black)

;; Line numbers
(if window-system (global-display-line-numbers-mode 1))
(menu-bar-display-line-numbers-mode 'relative)
(set-face-foreground 'line-number off-white)
(set-face-background 'line-number gray)
(set-face-foreground 'line-number-current-line pink)
(set-face-background 'line-number-current-line black)

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
  (setq spaceline-all-the-icons-highlight-file-name t)
  (setq spaceline-all-the-icons-separator-type 'none)
  (setq spaceline-all-the-icons-primary-separator "")
  (setq spaceline-all-the-icons-secondary-separator "")
  (setq spaceline-all-the-icons-window-number-always-visible t)
  (setq spaceline-all-the-icons-icon-set-flycheck-slim (quote outline))
  (setq spaceline-all-the-icons-icon-set-git-ahead (quote commit))
  (setq spaceline-all-the-icons-icon-set-modified (quote circle))
  (setq spaceline-all-the-icons-icon-set-window-numbering (quote square))
  (setq spaceline-all-the-icons-window-number-always-visible t)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

  ;; Powerline
  (set-face-background 'mode-line gray)
  (set-face-background 'powerline-active1 dark-purple)
  (set-face-foreground 'powerline-active1 off-white)
  (set-face-background 'powerline-active2 black)
  (set-face-foreground 'powerline-active2 off-white)
  ;; Evil states
  (set-face-background 'spaceline-evil-emacs purple)
  (set-face-foreground 'spaceline-evil-emacs off-white)
  (set-face-background 'spaceline-evil-insert light-blue)
  (set-face-foreground 'spaceline-evil-insert dark-gray)
  (set-face-background 'spaceline-evil-normal pink)
  (set-face-foreground 'spaceline-evil-normal dark-gray)
  (set-face-background 'spaceline-evil-visual orange)
  (set-face-foreground 'spaceline-evil-visual dark-gray)
  (set-face-background 'spaceline-evil-replace dark-red)
  (set-face-foreground 'spaceline-evil-replace off-white)
  (set-face-background 'spaceline-evil-motion green)
  (set-face-foreground 'spaceline-evil-motion off-white)

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

