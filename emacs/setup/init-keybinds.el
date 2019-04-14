(defun fsj-set-marker ()
  (set-mark-command)
  (set-mark-command))

;; EVIL mode
(use-package evil
  :after magit
  :config
  (evil-mode 1)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

  ;; enable EVIL in Magit
  (evil-set-initial-state 'magit-mode 'normal)
  (evil-set-initial-state 'magit-status-mode 'normal)
  (evil-set-initial-state 'magit-diff-mode 'normal)
  (evil-set-initial-state 'magit-log-mode 'normal)
  (evil-set-initial-state 'git-commit-mode 'normal)
  (evil-define-key 'normal magit-mode-map
    "c" 'magit-commit
    "g" 'magit-refresh
    "z" 'magit-stash
    "v" 'magit-discard
    "\t" 'magit-section-toggle)
  (evil-define-key 'normal magit-log-mode-map
    "c" 'magit-commit
    "g" 'magit-refresh
    "v" 'magit-discard
    "z" 'magit-stash
    "\t" 'magit-section-toggle)
  (evil-define-key 'normal magit-diff-mode-map
    "c" 'magit-commit
    "g" 'magit-refresh
    "v" 'magit-discard
    "z" 'magit-stash
    "\t" 'magit-section-toggle))

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
    "cg" 'customize-group
    "ff" 'find-file
    "fL" 'load-file
    "ft" 'neotree-toggle
    "gs" 'magit-status
    "ms" 'fsj-set-marker
    "mj" '(set-mark-command 1)
    "mG" 'pop-gloabl-mark
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

(provide 'init-keybinds)

