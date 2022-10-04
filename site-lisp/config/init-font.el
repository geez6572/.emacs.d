;;;###autoload
(defun +evan/set-cn-fonts ()
  (interactive)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     "fontset-default"
     charset
     (font-spec :name +evan/cn-font
                :weight 'normal
                :slant 'normal
                :size +evan/font-size))))
;;;###autoload
(defun +evan/set-fonts ()
  (interactive)
  (when (window-system)
    (progn
      ;; (if (version< "27.0" emacs-version)
      ;;     (set-fontset-font
      ;;       'unicode "Noto Color Emoji" nil 'prepend)
      ;;   (set-fontset-font
      ;;    t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend))
      ;; (setq face-font-rescale-alist nil)
      (let ((fonts '("Noto Color Emoji")))
        (cl-loop with script = (if (>= emacs-major-version 28)
        'emoji 'unicode)
                 for font in fonts
                 when (member font (font-family-list))
                 return (set-fontset-font t script (font-spec
                 :family font) nil 'prepend)))
      (set-face-attribute
       'default nil
       :font (font-spec :family +evan/en-font
                        :weight 'normal
                        :slant 'normal
                        :size +evan/font-size))
      (set-face-attribute
       'fixed-pitch-serif nil
       :font (font-spec :family +evan/en-font
                        :weight 'normal
                        :slant 'italic
                        :size +evan/font-size))
      (+evan/set-cn-fonts))))

(setq +evan/en-font "Maple Mono NF"
      +evan/cn-font "Maple Mono NF"
      +evan/font-size 14.5)

(require 'ligature)

(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
(global-ligature-mode t)



;; (setq +evan/en-font "Monaco"
;;       +evan/cn-font "Sarasa Mono SC"
;;       +evan/font-size 14.0)

;; (when (boundp 'display-fill-column-indicator)
;;   (setq-default indicate-buffer-boundaries 'left)
;;   (setq-default display-fill-column-indicator-character ?\u254e)
;;   (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))

(provide 'init-font)
