(server-start)

;; Backup settings
(setq
   backup-by-copying t
   backup-directory-alist
     '(("." . "~/.emacs.d/backup")
   auto-save-file-name-transforms
     ((".*" "~/.emacs.d/backup" t)))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

;; Load setup
(let ((default-directory  "~/dotFiles/emacs/setup"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
;; Load deps
(let ((default-directory  "~/dotFiles/emacs/packages"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'custom-theme-load-path "~/dotFiles/emacs/themes")
(load-file "~/dotFiles/emacs/packages/dash.el/dash.el")
(load-file "~/dotFiles/emacs/packages/autothemer/autothemer.el")
;; Package setup
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(require 'use-package)

;; Setup
(require 'init-git)
(require 'init-utils)
(require 'init-keybinds)
(require 'init-ui)
(require 'init-languages)

