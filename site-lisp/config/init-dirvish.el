(require 'dirvish)
(require 'dirvish-side)
(dirvish-override-dired-mode)
(lazy-load-set-keys '(("h" . dired-up-directory)
		      ("l" . dired-find-file))
		    dirvish-mode-map)

(add-hook 'dirvish-mode-hook (lambda ()
			       (+evan/meow-add-motion-mode-alist 'dired-mode)
			       (meow-define-keys
				   'motion
				 '("h" . dired-up-directory)
				 '("l" . dired-find-file))
			       (golden-ratio-mode nil)))

(defun +evan/dirvish-side-current-path ()
  (interactive)
  (dirvish-side buffer-file-name))

;; FACE
;; (set-face-background 'dirvish-hl-line (face-background 'default))

(provide 'init-dirvish)
