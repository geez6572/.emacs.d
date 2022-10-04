;;自定义配置文件  放在init.el文件最后

;;为emacs安装文件管理器neotree
(add-to-list 'load-path "/home/cl/.emacs.d/lisp/leastload/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)



(add-to-list 'load-path "/home/cl/.emacs.d/lisp/preload/configuration")
(require `all-the-icon-cf)


;;设置光标类型
(setq-default  cursor-type `bar)


;;设置emacs的字体大小
(set-face-attribute `default nil :height 160)

;;打开配置文件 定义函数
(defun preconf ()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-preload-local.el"))
(defun leastconf ()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-local.el"))

;;设置emacs启动时全屏显示
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil `fullscreen
                       (if (frame-parameter nil `fullscreen) nil `fullboth)))

(global-set-key [f9] `fullscreen)
(add-to-list `default-frame-alist  `(fullscreen . maximized))


;;设置scratch中的初始内容
(setq-default  initial-scratch-message  " ")


;;配置doom-modeline
(require 'doom-modeline)
(doom-modeline-mode 1)



;;设置emacs启动后的画面
(require 'dashboard)
(dashboard-setup-startup-hook)
;;配置dashbroad
(setq dashboard-banner-logo-title "Ceiling less")
(setq dashboard-startup-banner  4)
(setq dashboard-center-content t)
(setq dashboard-show-shortcuts nil)




;;安装CC-mode
(add-to-list `load-path "~/.emacs.d/lisp/preload/packages/cc-mode")
(require `cc-mode)
(c-set-offset 'inline-open 0)

(c-set-offset 'friend '-)

(c-set-offset 'substatement-open 0) ;;;;我的C/C++语言编辑策略

(require `init-cc-mode)


;; 导出配置
(provide `init-local)
