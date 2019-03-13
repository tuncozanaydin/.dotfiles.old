;;; ~/.dotfiles/.doom.d/+org-agenda-capture-refile.el -*- lexical-binding: t; -*-

(setq org-agenda-todo-keyword-format "%+8s")

(setq org-todo-keywords
      '((sequence "SCRAP(a)" "TODO(t)" "WAITING(w)" "PROJECT(p)" "SPRINT(s)"
                  "|" "DONE(d)" )))

(setq org-todo-keyword-faces
      '(("SCRAP" . (:foreground "LightYellow3" :weight semi-bold ))
        ("TODO" (:foreground "OrangeRed" :weight semi-bold))
        ("WAITING" (:foreground "GoldenRod" :weight semi-bold))
        ("PROJECT" (:foreground "DarkOliveGreen3" :weight semi-bold))
        ("SPRINT" (:foreground "SkyBlue1" :weight medium))
        ("DONE" (:foreground "LimeGreen" :weight bold))
        ))

(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets
      '(
        (my-projects-file :todo . "PROJECT")
        (my-projects-file :todo . "SPRINT")
        (my-backlog-file :todo . "")
        (my-backlog-file :todo . "SPRINT")
        (my-backlog-file :todo . "PROJECT")
        )
      )

(setq org-capture-templates
      '(
        ("c" "scrap" entry (file my-inbox-file)
         "* SCRAP %?\n:PROPERTIES:\n:CREATED:\t%U\n:END:\n")
        )
      )
