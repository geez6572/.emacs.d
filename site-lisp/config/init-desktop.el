;; 保存desktop
(desktop-save-mode 1)
(setq desktop-save t)

;; (add-hook 'after-init-hook (lambda ()
;; 			     (desktop-read "/home/evanmeek/.emacs.d/data/desktop")))
(desktop-file-name "~/.emacs.d/desktop/.emacs.desktop"
		   "~/.emacs.d/desktop")

(defun +evan/read-dekstop
    (interactive)
    (desktop-read "~/.emacs.d/desktop/.emacs.desktop"))
(provide 'init-desktop)
