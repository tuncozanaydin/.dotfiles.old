;;; ~/.dotfiles/.doom.d/+org-agenda-views.el -*- lexical-binding: t; -*-

(defun toa/print-org-outline-path (l)
  (org-format-outline-path (org-get-outline-path) l nil "→"))

(setq org-stuck-projects '("+TODO=\"PROJECT\"|TODO=\"SPRINT\"" ("TODO") nil ""))

(setq org-agenda-custom-commands
      '(
        ("f" "focus view"
         (
          (agenda ""
                  ((org-agenda-span 'day)
                   (org-agenda-start-day "<today>")
                   (org-agenda-start-on-weekday nil)
                   (org-deadline-warning-days 7)
                   (org-agenda-files (list my-backlog-file
                                           my-projects-file
                                           my-papers-file
                                           ))
                   (org-agenda-prefix-format " %i %-12t% s")
                   (org-agenda-start-with-log-mode t)))

          (tags "+TODO=\"WAITING\""
                ((org-agenda-overriding-header "Blockers")
                 (org-agenda-prefix-format
                  " %i %?-23(toa/print-org-outline-path 23) % s")
                 (org-agenda-files (list my-projects-file))))

          (tags "+TODO=\"DONE\"+CLOSED>\"<-1d>\""
                ((org-agenda-overriding-header "Closed during the last 24 hours ")
                 (org-agenda-todo-keyword-format "%+4s")
                 (org-agenda-prefix-format
                  " %i %?-30(toa/print-org-outline-path 30) % s")
                 (org-agenda-files (list my-projects-file
                                         my-papers-file))))
          )
         )

        ("p" "plan view"
         (
          (agenda ""
                  ((org-agenda-span 'week)
                   (org-agenda-start-day "<today>")
                   (org-deadline-warning-days 14)
                   (org-agenda-files (list my-backlog-file
                                           my-projects-file
                                           my-papers-file
                                           ))
                   (org-agenda-prefix-format " %i %-12t% s")
                   (org-agenda-start-with-log-mode t)))

          (stuck ""
                 ((org-agenda-overriding-header "Stuck Projects")
                  (org-agenda-sorting-strategy '(ts-down todo-state-down tag-up))
                  (org-agenda-prefix-format
                   " %i %?-25(toa/print-org-outline-path 25) % s")
                  (org-agenda-files (list my-projects-file))
                  ))

          (tags "+TODO=\"TODO\""
                ((org-agenda-overriding-header "Actionables")
                 (org-agenda-todo-keyword-format "%+4s")
                 (org-agenda-prefix-format
                  " %i %?-30(toa/print-org-outline-path 30) % s")
                 (org-agenda-files (list my-projects-file
                                         my-papers-file))))

          (tags "+TODO<>\"SCRAP\"+TODO<>\"DONE\""
                ((org-agenda-overriding-header "Backlog")
                 (org-agenda-sorting-strategy '(todo-state-down tag-up))
                 (org-agenda-prefix-format
                  " %i %?-23(toa/print-org-outline-path 23) % s")
                 (org-agenda-files (list my-backlog-file))))

          (tags "+LEVEL>=1"
                ((org-agenda-overriding-header "Inbox")
                 (org-agenda-sorting-strategy '(ts-down todo-state-down tag-up))
                 (org-agenda-prefix-format
                  " %i %?-23(toa/print-org-outline-path 30) % s")
                 (org-agenda-files (list my-inbox-file))))

          (tags "+TODO=\"WAITING\""
                ((org-agenda-overriding-header "Blockers")
                 (org-agenda-prefix-format
                  " %i %?-23(toa/print-org-outline-path 23) % s")
                 (org-agenda-files (list my-projects-file))))

          (tags "+TODO=\"DONE\"+CLOSED>\"<-1w>\""
                ((org-agenda-overriding-header "Closed during the last 7 days ")
                 (org-agenda-todo-keyword-format "%+4s")
                 (org-agenda-prefix-format
                  " %i %?-30(toa/print-org-outline-path 30) % s")
                 (org-agenda-files (list my-projects-file
                                         my-papers-file))))
          )
         )
        )
      )
