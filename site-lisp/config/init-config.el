;; 打开emacs后必须立刻使用的
(enable-theme 'doom-one)
(require 'init-ui)
(require 'init-generic)
(require 'init-emacs)
(require 'init-better-default)
(require 'lazy-load)
(require 'one-key)
(require 'meow)


;; 打开窗口后再使用
(add-hook 'window-setup-hook (lambda ()
			       (+evan/set-fonts)
			       (+evan/set-cn-fonts)
			       (require 'init-one-key)
			       (require 'init-meow)
			       (require 'init-key)
			       (require 'init-mode)
			       (require 'init-ivy)
			       (require 'init-window)))

;; 延迟启动
(run-with-idle-timer 0.2 nil (lambda ()
			       (require 'init-wakatime)
			       (require 'init-auto-save)
			       (require 'init-helpful)
			       (require 'init-rime)
			       (require 'init-lsp-bridge)
			       (require 'init-which-key)))

(provide 'init-config)
