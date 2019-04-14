(use-package magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/dotFiles/emacs/packages/magit/Documentation/"))

(provide 'init-git)
