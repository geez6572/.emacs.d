(setq
   ;; crow开启的翻译信息
   crow-enable-info '(:examples nil
                      :source nil
                      :translit nil
                      :translation t
                      :options nil)
   ;; crow翻译间隔延迟
   crow-translate-delay 0.2
   ;; crow翻译单位类型
   crow-translate-type (list 'sentence 'word)
   ;; 翻译文本ui呈现类型
   crow-ui-type '(posframe eldoc)
   ;; posframe超时隐藏时间
   crow-posframe-hide-timeout 3
   ;; crow posframe放置的位置
   ;; crow-posframe-position 'point
   )

(require 'crow)

(one-key-create-menu
 "Crow"
 '((("u" . "Next crow ui type") . crow-next-ui-type)
   (("t" . "Next crow translate type") . crow-next-translate-type)))

(provide 'init-crow)
