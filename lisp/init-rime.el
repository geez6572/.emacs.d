;;在emacs中使用rime

(use-package rime
  :ensure t
  :custom
  (default-input-method "rime"))

;; 默认值
(setq rime-translate-keybindings
      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))

(provide 'init-rime)
