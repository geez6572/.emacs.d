;;安装图标
(add-to-list `load-path "~/.emacs.d/lisp/preload/packages/all-the-icons")
(add-to-list `load-path "/snap/telega/current/share/emacs/site-lisp/telega/")

(when (display-graphic-p)
  (require 'all-the-icons))

(use-package counsel)
(use-package all-the-icons-ivy-rich)
(use-package doom-modeline)
(use-package dashboard)
(use-package neotree)


(require `counsel)
(provide `init-preload-local)
