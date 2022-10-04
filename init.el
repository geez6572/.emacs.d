;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)


;;判断emacs版本是否符合配置
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))


;;将emacs配置文件下的lisp目录加载到load-path变量中
;;其中函数 expand-file-name 中的第一参数为目录名字，第二个参数为第一个参数所在的目录
;;下面函数 expand-file-name 调用意为user-emacs-directory/lisp
;;其中user-emacs-directory 变量的值为emacs配置文件所在的目录
;;即以下函数可理解为：
;;       (add-to-list 'load-path "emaca配置文件所在目录/lisp")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


;;测试emacs启动时间的工具  ？？？
(require 'init-benchmarking) ;; Measure startup time


;;定义两个常量
(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))



;; Adjust garbage collection thresholds during startup, and thereafter
;;垃圾回收
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;; Bootstrap config


;;将custom-file文件生成在 emacs配置目录/custom.el
;;custome-file是emacs自动生成的文件，保存了一些用户自定义的内容
;;比如如果我们使用emacs的package系统安装插件而不是通过elisp代码安装的话
;;就会在custom-file中生成相应的代码
(setq custom-file (locate-user-emacs-file "custom.el"))



;;定义了一些快捷功能
;;比如替换当前buffer的majior-mode
;;删除，重命名当前文件等
(require 'init-utils)



(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el


;; Calls (package-initialize)
;;一些与插件相关的功能
(require 'init-elpa)      ;; Machinery for installing required packages

;;使用meow编辑模式
(require 'init-meow)

;;将本机的环境变量导入到emacs
(require 'init-exec-path) ;; Set up $PATH



;; Allow users to provide an optional "init-preload-local.el"
;;用户配置文件
(require 'init-preload-local nil t)



;; Load configs for specific features and modes
(require-package 'diminish)
(maybe-require-package 'scratch)
(require-package 'command-log-mode)



(require 'init-frame-hooks)
(require 'init-xterm)


;;emacs主题相关的配置
(require 'init-themes)

;;与emacs界面配置有关
(require 'init-gui-frames)


;;配置emacs中的文件系统
;;替换emacs文件管理器
(require 'init-dirvish)

;;增强emacs的查找功能
(require 'init-isearch)



(require 'init-grep)


;;更好命名缓冲区
(require 'init-uniquify)


;;更好的管理buffer,方便切换buffer
(require 'init-ibuffer)


;;
(require 'init-flymake)


;;代码补全相关
(require 'init-eglot)


;;开启最近文件功能
(require 'init-recentf)



(require 'init-minibuffer)


;;
(require 'init-hippie-expand)


;;
(require 'init-company)


;;窗口管理
(require 'init-windows)


;;vim模拟器evil插件


(require 'init-sessions)



(require 'init-mmm)



(require 'init-editing-utils)
(require 'init-whitespace)

(require 'init-vc)
(require 'init-darcs)
(require 'init-git)
(require 'init-github)

(require 'init-projectile)


;;语言相关
(require 'init-haskell)


(require 'init-compile)
(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-javascript)
(require 'init-org)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
(require 'init-haml)
(require 'init-http)
(require 'init-python)
(require 'init-elm)
(require 'init-purescript)
(require 'init-sql)
(require 'init-ocaml)
(require 'init-j)
(require 'init-toml)
(require 'init-yaml)
(require 'init-docker)
(require 'init-terraform)
(require 'init-nix)

;;(require `init-cc-mode)
(maybe-require-package 'nginx-mode)

(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-misc)

(require 'init-folding)
(require 'init-dash)


;;telega
;;(require 'init-tele)



;;(require 'init-twitter)
;; (require 'init-mu)
(require 'init-ledger)
;; Extra packages which don't require any configuration

(require-package 'sudo-edit)
(require-package 'gnuplot)
;;(require-package 'lua-mode)
(require-package 'htmlize)
(when *is-a-mac*
  (require-package 'osx-location))
(maybe-require-package 'dotenv-mode)
(maybe-require-package 'shfmt)

(when (maybe-require-package 'uptimes)
  (setq-default uptimes-keep-count 200)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))

(when (fboundp 'global-eldoc-mode)
  (add-hook 'after-init-hook 'global-eldoc-mode))

(require 'init-direnv)



;; Allow access from emacsclient
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;; Variables configured via the interactive 'customize' interface
(when (file-exists-p custom-file)
  (load custom-file))

;; Locales (setting them earlier in this file doesn't work in X)
(require 'init-locales)

;; Allow users to provide an optional "init-local" containing personal settings
(require 'init-local nil t)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
