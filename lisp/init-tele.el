;;(add-to-list 'package-pinned-packages '(telega . "melpa-stable"))

;;(require-package 'telega)
(require 'telega)


(setq telega-proxies '((:server "127.0.0.1"
                                :port "1089"
                                :enable t
                                :type (:@type "proxyTypeSocks5")))
      telega-chat-show-avatars nil
      telega-chat-fill-column 65
      telega-emoji-use-images nil)
(set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji") nil 'prepend)

(setq telega-compleleting-read-function 'completing-read)
(setq telega-mode-line-mode nil)
(telega-notifications-mode t)
(defun +evan/toggle-telega ()
  "切換telega"
  (interactive)
  (if (get-buffer "*Telega Root*")
      (progn (telega-kill t)
             (message "杀死Telega"))
    (progn (telega t)
           (message "启动Telega"))))

;; KeyMap
(define-key telega-msg-button-map "k" nil)
(define-key telega-msg-button-map "l" nil)


;; Face
(set-face-background 'telega-msg-inline-reply (face-attribute 'default :background))
(set-face-background 'telega-msg-self-title (face-attribute 'default :background))
(set-face-background 'telega-msg-user-title (face-attribute 'default :background))
(set-face-background 'telega-msg-heading (face-attribute 'default :background))

(autoload 'project-switch-project "magit" nil t)

;; (add-hook 'telega-chat-mode-hook (lambda ()
;;                                 (writeroom-mode t)))

;;(telega-chatbuf-completion-candidates "@")
(provide 'init-tele)
