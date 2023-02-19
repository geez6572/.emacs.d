;; init-rust.el --- Initialize Rust configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2019-2022 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Rust configurations.
;;

;;; Code:

;;; rust-mode
;;(use-package rustic)
;;(setq rustic-lsp-server 'rls)
;;;(add-hook 'rust-mode-hook 'lsp-deferred)
;;(use-package rust-playground)
;;(add-hook 'rust-mode-hook 'lsp-deferred)
;;(provide 'init-rust)


(use-package rustic
  :ensure t
  :bind (:map rustic-mode-map
         ("M-j" . lsp-ui-imenu)
         ("M-?" . lsp-find-references)
         ("C-c C-c l" . flycheck-list-errors)
         ("C-c C-c a" . lsp-execute-code-action)
         ("C-c C-c r" . lsp-rename)
         ("C-c C-c q" . lsp-wordspace-restart)
         ("C-c C-c Q" . lsp-workspace-shutdown)
         ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; 减少闪动可以取消这里的注释
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)
  (setq rustic-lsp-server 'rust-analyzer)
  ;; 注释下面这行可以禁用保存时 rustfmt 格式化
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'geezer/rustic-mode-hook))

(defun geezer/rustic-mode-hook ()
  ;; 所以运行 C-c C-c C-r 无需确认就可以工作，但不要尝试保存不是文件访问的 rust 缓存。
  ;; 一旦 https://github.com/brotzeit/rustic/issues/253 问题处理了
  ;; 就不需要这个配置了
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

;;;intall cargo-mode
(use-package cargo
  :ensure t)
(add-hook 'rust-mode-hook 'cargo-minor-mode)



(provide 'init-rust)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-rust.el ends here
