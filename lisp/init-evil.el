(use-package evil
  :init (progn
          (setq evil-want-integration nil)
          (setq evil-want-minibuffer t) ;; 在minibuffer中启用evil
          )
  :config
  (define-key evil-normal-state-map "i" 'evil-insert t)
  (define-key evil-normal-state-map "I" 'evil-insert-line t)
  (define-key evil-normal-state-map "h" 'evil-insert)
  (define-key evil-normal-state-map "H" 'evil-insert-line)
  (define-key evil-motion-state-map "j" 'evil-backward-char)
  (define-key evil-motion-state-map "I" 'evil-window-top)
  (define-key evil-motion-state-map "k" 'evil-next-line)
  (define-key evil-motion-state-map "i" 'evil-previous-line)
  (define-key evil-motion-state-map "l" 'evil-forward-char)
  )


(provide 'init-evil)
