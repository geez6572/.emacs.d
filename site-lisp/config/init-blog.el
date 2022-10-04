(require 'simple-httpd)
(require 'ox-html)
(require 'ox-publish)

(setq org-export-in-background t
      ;; Hide html built-in style and script.
      org-html-htmlize-output-type 'inline-css
      org-html-head-include-default-style nil
      org-html-head-include-scripts nil)

(defun +evan/blog-save-and-publish-website()
  "Save all buffers and publish."
  (interactive)
  (when (yes-or-no-p "Really save and publish current project?")
    (save-some-buffers t)
    (org-publish-project "website" t)
    (message "Site published done.")))

(setq org-publish-project-alist
      '(("orgfiles"
         :base-directory "~/Blog/org/" ;; local dir
         :publishing-directory "~/Blog/public/" ;; :publishing-directory "/ssh:jack@192.112.245.112:~/Blog/public/"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4	;; org-export-headline-levels
         :section-numbers nil		;; org-export-with-section-numbers
         :with-author "Evan Meek" ;; org-export-with-author
         :with-priority t ;; org-export-with-priority ;
         :with-toc t ;; org-export-with-toc
         :html-doctype "html5" ;; org-html-doctype
         :table-of-contents t
         )
        ("js"
         :base-directory "~/Blog/js/"
         :base-extension "js"
         :publishing-directory "~/Blog/public/js/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("css"
         :base-directory "~/Blog/css/"
         :base-extension "css"
         :publishing-directory "~/Blog/public/css/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("images"
         :base-directory "~/Blog/images/"
         :base-extension "jpg\\|gif\\|png\\|svg\\|gif"
         :publishing-directory "~/Blog/public/images/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("assets"
         :base-directory "~/Blog/assets/"
         :base-extension "mp3"
         :publishing-directory "~/Blog/public/assets/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("webfonts"
         :base-directory "~/Blog/webfonts/"
         :base-extension "eot\\|svg\\|ttf\\|woff\\|woff2"
         :publishing-directory "~/Blog/public/webfonts/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("website" :components ("orgfiles" "js" "css" "images" "assets" "webfonts"))
        ("statics" :components ("js" "css" "images" "assets" "webfonts"))))

;; 创建博客文章
(defun +evan/blog-create-article (&optional filename)
  (interactive "s文章名: ")
  (if (file-exists-p "~/Blog/org/index.org")
      (cl-block nil
        (let ((title filename)
              (filename (concat "~/Blog/org/" filename ".org")))
          (when (file-exists-p filename)
            (find-file filename)
            (cl-return t))
          (progn
            (message "%s" filename)
            (find-file filename)
            (save-buffer)
            (insert "#+SETUPFILE: ../theme-rose.setup\n")
            ;; #+DATE: <2020-09-19 六>
            (insert (concat "#+DATE: " (format-time-string "<%Y-%m-%d %a>" (current-time)) "\n"))
            (insert (concat "#+TITLE: " (if title
                                            title
                                          (read-string "文章名: "))))
            (insert "\n\n"))))
    (message "文件目录不存在!请手动创建.")))
;; 浏览器中预览当前buffer
(defun +evan/blog-preview-current-buffer-in-browser ()
  "Open current buffer as html."
  (interactive)
  (let ((fileurl (concat "http://127.0.0.1:8080/" (file-name-base (buffer-name)) ".html")))
    (+evan/blog-save-and-publish-file)
    (unless (httpd-running-p) (httpd-start))
    (browse-url fileurl)))

;; 查找blog文件
(defun +evan/blog-find-blog-files ()
  "Find blog files counsel fzf."
  (interactive)
  (let ((blog-dir "/home/evan/Blog/org/"))
    (find-file (concat blog-dir (completing-read "Find blog file: "
						 (directory-files blog-dir))))))
;; 保存并发布当前文件
(defun +evan/blog-save-and-publish-file ()
  "Save current buffer and publish."
  (interactive)
  (save-buffer t)
  (org-publish-current-file t))

;; 删除org和html文件
(defun +evan/blog-delete-org-and-html ()
  "Delete current org and the relative html when it exists."
  (interactive)
  (when (yes-or-no-p "Really delete current org and the relative html?")

    (let ((fileurl (concat "~/Blog/public/" (file-name-base (buffer-name)) ".html")))
      (if (file-exists-p fileurl)
          (delete-file fileurl))
      (delete-file (buffer-file-name))
      (kill-this-buffer)
      (message "Delete org and the relative html done."))))
(provide 'init-blog)
