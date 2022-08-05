;;自定义配置文件  放在init.el文件最后

;;为emacs安装文件管理器neotree
(add-to-list 'load-path "/home/ceilingless/.emacs.d/lisp/leastload/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)



(add-to-list 'load-path "/home/ceilingless/.emacs.d/lisp/preload/configuration")
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




;; 导出配置
(provide `init-local)
