(require 'eaf)
;; (require 'eaf-video-player)
(require 'eaf-image-viewer)
;; (require 'eaf-file-browser)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-mindmap)
;; (require 'eaf-git)
;; (require 'eaf-file-sender)
;; (require 'eaf-terminal)
;; (require 'eaf-file-manager)

(defun eaf-translate-text (text)
  (interactive)
  (require 'init-crow)
  (crow--gen-translated-text "text")
  (message "%s" crow--translated-text))

(setq
 eaf-proxy-type "socks5"
 eaf-proxy-host "127.0.0.1"
 eaf-proxy-port "1088"
 eaf-browser-dark-mode nil)

(eaf-bind-key meow-keypad "SPC" eaf-browser-keybinding)
(eaf-bind-key eaf-py-proxy-insert_or_scroll_up_page "M-SPC" eaf-browser-keybinding)
(eaf-bind-key nil "u" eaf-browser-keybinding)


(provide 'init-eaf)
