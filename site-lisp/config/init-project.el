(one-key-create-menu
 "Project"
 '(
   (("f" . "Find file in project") . project-find-file)
   (("a". "Remmeber a proejct") . project-remember-projects-under)
   (("p" . "Switch project") . project-switch-project)
   (("r" . "Remove known project") . project-forget-project)
   (("e" . "Project eshell") . project-eshell)))
(provide 'init-project)
