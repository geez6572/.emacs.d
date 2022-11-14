
(require-package 'all-the-icons-ibuffer)

(add-hook 'ibuffer-mode-hook #'all-the-icons-ibuffer-mode)

(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)

(provide `all-the-icon-cf)
