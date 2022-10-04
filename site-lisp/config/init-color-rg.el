(require 'color-rg)

(add-hook 'color-rg-mode-hook #'(lambda () (meow-insert)))
(provide 'init-color-rg)
