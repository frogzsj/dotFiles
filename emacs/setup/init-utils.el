;; Ag
(use-package ag
  :config
  (setq ag-reuse-buffers t)
  (setq ag-highlight-search t))

;; Dired
(defun dired-mode-setup ()
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'dired-mode-setup)

;; Projectile
(use-package projectile
  :config
  (projectile-mode 1)
  (recentf-mode 1))

;; Terminal
(use-package exec-path-from-shell)
(setq explicit-shell-file-name "/bin/zsh")
(add-hook 'ansi-term-mode-hook 'inhibit-global-linum-mode)
(defun inhibit-global-linum-mode ()
  (add-hook 'after-change-major-mode-hook
            (lambda () (linum-mode 0))
            :append :local))
(use-package shell-pop)
(custom-set-variables
  '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  '(shell-pop-term-shell "/bin/zsh")
  '(shell-pop-window-size 30)
  '(shell-pop-full-span t)
  '(shell-pop-window-position "bottom"))

;; Kill buffer
(defun kill-this-buffer (&optional arg)
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

(provide 'init-utils)

