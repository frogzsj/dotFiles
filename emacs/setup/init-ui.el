;; Turn off all the bars
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

;; Neotree
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; Status bar
(set-face-background 'mode-line "#000000")
(use-package all-the-icons)
(use-package powerline)
(use-package spaceline)
(use-package spaceline-all-the-icons 
  :after (spaceline magit neotree)
  :config
  (setq spaceline-all-the-icons-highlight-file-name t)
  (setq spaceline-all-the-icons-separator-type 'none)
  (setq spaceline-all-the-icons-window-number-always-visible t)
  (spaceline-all-the-icons-theme)
  (spaceline-toggle-all-the-icons-git-status-on)
  (spaceline-toggle-all-the-icons-vc-icon-off)
  (spaceline-toggle-all-the-icons-mode-icon-on)
  (spaceline-toggle-all-the-icons-vc-status-on)
  (spaceline-all-the-icons--setup-neotree)
  (spaceline-all-the-icons--setup-git-ahead))

;; Dashboard
;;(use-package dashboard
;;  :ensure t
 ;; :config
 ;; (dashboard-setup-startup-hook)
 ;; (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))
;; Line numbers
(use-package nlinum-relative
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0.3)
  (setq nlinum-relative-current-symbol ""))


;; EVIL mode
(use-package evil
  :config
  (evil-mode 1))
(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "gs" 'magit-status
    "wd" 'delete-window))

(provide 'init-ui)
