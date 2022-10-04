(require 'lsp-bridge)
(require 'yasnippet)
(require 'orderless)
(require 'init-tempel)
(global-lsp-bridge-mode)

(setq acm-candidate-match-function 'orderless-prefixes
      acm-enable-search-words t
      acm-enable-icon t
      acm-enable-doc nil
      lsp-bridge-complete-manually nil
      acm-enable-tabnine-helper nil
      lsp-bridge-enable-signature-help nil
      lsp-bridge-enable-diagnostics t
      lsp-bridge-multi-lang-server-mode-list nil)


;; (setq lsp-bridge-multi-lang-server-extension-list
;;       (--remove-first (string= "vue" (caar it)) lsp-bridge-multi-lang-server-extension-list)
;;       lsp-bridge-multi-lang-server-extension-list '((("vue") . "volar_emmet")))



(setq lsp-bridge-c-lsp-server "ccls")
(setq lsp-bridge-enable-diagnostics nil)
(setq lsp-bridge-python-lsp-server "pyright")

(with-eval-after-load 'lsp-bridge
  (add-to-list 'lsp-bridge-single-lang-server-extension-list '(("tsx" "jsx" "ts") . "typescript")))


(global-set-key (kbd "C-SPC") 'lsp-bridge-popup-complete)

(one-key-create-menu "Diagnostic"
		     '((("n" . "Next diagnostic") . lsp-bridge-jump-to-next-diagnostic)
		       (("p" . "Previous diagnostic") . lsp-bridge-jump-to-prev-diagnostic)
		       (("l" . "Show all diagnostic") . lsp-bridge-list-diagnostics)))

(add-hook 'lsp-bridge-mode-hook '(lambda ()
				   (electric-pair-mode t)
				   (electric-quote-mode t)
				   (yas/minor-mode t)))

(defun lsp-bridge-jump ()
  (interactive)
  (cond
   ((eq major-mode 'emacs-lisp-mode)
    (let ((symb (function-called-at-point)))
      (when symb
        (find-function symb))))
   (lsp-bridge-mode
    (lsp-bridge-find-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-go))))

(defun lsp-bridge-jump-back ()
  (interactive)
  (cond
   (lsp-bridge-mode
    (lsp-bridge-return-from-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-back))))

(defun lsp-bridge-toggle-debug ()
  (interactive)
  (setq lsp-bridge-enable-debug (not lsp-bridge-enable-debug)
	lsp-bridge-enable-log (not lsp-bridge-enable-log)))

(defun lsp-bridge-toggle-diagnostics ()
  (interactive)
  (setq-local lsp-bridge-enable-diagnostics (not lsp-bridge-enable-diagnostics))
  (message "lsp-bridge-enable-diagnostics: %s" lsp-bridge-enable-diagnostics))
(provide 'init-lsp-bridge)
