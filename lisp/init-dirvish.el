;;replece emacs flile manage

(use-package dirvish
  :ensure t
  :config
  (dirvish-override-dired-mode)
  )

(require 'dirvish-side)



(provide 'init-dirvish)
