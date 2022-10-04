(require 'org-modern)
(require 'init-valign)
(require 'org-html-themify)

(setq org-html-themify-themes
      '((dark . doom-tokyo-night)
	(light . doom-tomorrow-day)))

(autoload '+evan/setup-org-capture "init-org-capture")
(autoload '+evan/setup-org-agenda "init-org-agenda")

(add-hook 'org-mode-hook
	  (lambda ()
	    (global-org-modern-mode +1)
	    (org-html-themify-mode t)
	    (+evan/setup-org-capture)))

(+evan/setup-org-agenda)
(+evan/setup-org-capture)

(provide 'init-org)
