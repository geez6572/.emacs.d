(require 'with-editor)
(require 'magit)
(require 'transient)
(require 'forge)
(add-hook 'magit-mode-hook  (lambda ()
			      (+evan/meow-add-motion-mode-alist 'magit-status-mode)
			      (+evan/meow-add-motion-mode-alist 'magit-status-mode)
			      (meow-define-keys
				'motion
				'("x" . magit-discard)
				'("p" . magit-push)
				'("L" . magit-log)
				'("o" . magit-reset)
				'("C-o" . magit-submodule))
			      ))

(provide 'init-magit)
