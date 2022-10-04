(require 'rime)
(setq default-input-method "rime")
(setq rime-user-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-share-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-posframe-properties
      (list :background-color "#2E3440"
            :foreground-color "#ECEFF4"
            ;; :font evan/en-font-name
            :internal-border-width 0))
(setq default-input-method "rime"
      rime-show-candidate 'posframe)

(set-face-attribute 'rime-highlight-candidate-face nil :width 'normal :inherit 'highlight)
(provide 'init-rime)
