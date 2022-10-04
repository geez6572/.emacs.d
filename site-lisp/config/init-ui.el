(require 'init-awesome-tray)
(require 'solaire-mode)
(solaire-global-mode +1)

;; 高亮当前行
(global-hl-line-mode nil)

(unless (featurep 'awesome-tray)
  ;; modeline
  (require 'doom-modeline)
  
  (doom-modeline-mode t))


(defun +evan/toggle-big-font ()
  "切换大字体模式"
  (interactive)
  (if (> +evan/font-size 17.5)
      (setq +evan/font-size (- +evan/font-size 5))
    (setq +evan/font-size (+ +evan/font-size 5)))
  (+evan/set-fonts)
  (+evan/set-cn-fonts))

(require 'page-break-lines)
(global-page-break-lines-mode t)
(setq window-divider-default-bottom-width 1)
(setq window-divider-default-right-width 1)

(require 'init-modus-themes)

(provide 'init-ui)
