(use-package git-gutter)
(global-git-gutter-mode 1)

(use-package magit
  :config
  (custom-set-variables
    '(with-editor-emacsclient-executable "/usr/local/bin/emacsclient")))
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/dotFiles/emacs/packages/magit/Documentation/"))

(provide 'init-git)
