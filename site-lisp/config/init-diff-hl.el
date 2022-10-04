(require 'diff-hl)
(add-hook 'prog-mode-hook (lambda ()
			    (diff-hl-mode t)))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(provide 'init-diff-hl)
