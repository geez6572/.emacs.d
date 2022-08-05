;;安装图标
(add-to-list `load-path "~/.emacs.d/lisp/preload/packages/all-the-icons")
(when (display-graphic-p)
  (require 'all-the-icons))


;;为eamcs设置tab栏
(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)
;;配置tcentaur-tabs
(setq centaur-tabs-style  "rounded"
      centaur-tabs-set-icons t
      centaur-tabs-plain-icons t
      centaur-tabs-gray-out-icons `buffer
      centaur-tabs-set-close-button t
      centaur-tabs-set-modified-marker t
      ;;centaur-tabs-show-navigation-buttons t
      centaur-tabs-set-bar 'left
      centaur-tabs-cycle-scope 'tabs
      x-underline-at-descent-line nil)
(centaur-tabs-headline-match)
;; (setq centaur-tabs-gray-out-icons 'buffer)
;; (centaur-tabs-enable-buffer-reordering)
;; (setq centaur-tabs-adjust-buffer-order t)
(centaur-tabs-mode t)




(require `counsel)
(provide `init-preload-local)
