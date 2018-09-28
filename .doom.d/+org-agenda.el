;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(after! org

 (setq org-agenda-window-setup 'current-window)
 (set-popup-rule! "^\\*Org Agenda"
   :size 1.0)


  (setq org-agenda-hide-tags-regexp ".*_")

  ;; (defun foo ()
  ;;   (let ((x (org-get-outline-path)))
  ;;     (if (> (length x) 0)
  ;;         (concat "[ " (subseq (org-format-outline-path x) 0 (min 23 (length (org-format-outline-path x))) ) " ]")
  ;;       "")))

;; ((agenda . " %i %-12:c%?-12t% s")

  ;; (setq org-agenda-prefix-format '((todo . "%i %?-28(foo)")
  ;;                                  (tags . "%i %?-36(foo)")
  ;;                                  ))
  (setq org-agenda-todo-keyword-format "%+12s")

  ;; Place tags close to the right-hand side of the window
  (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
  (defun place-agenda-tags ()
    "Put the agenda tags by the right border of the agenda window."
    (setq org-agenda-tags-column (- 6 (window-width)))
    (org-agenda-align-tags))

  ;; (setq org-tags-column -138)

  (setq org-directory "~/Dropbox/org/")
  (setq org-archive-directory (concat org-directory "archive/"))
  (setq org-archive-location (concat org-archive-directory "%s::"))
  (setq my-inbox-file (concat org-directory "inbox.org"))
  (setq my-projects-file (concat org-directory "projects.org.gpg"))
  (setq my-someday-maybe-file (concat org-directory "someday.org"))
  ;; (setq my-sticky-file (concat org-directory "sticky.org"))
  (setq my-one-off-file (concat org-directory "one-off.org"))
  ;; (setq my-sprints-file (concat org-directory "sprints.org.gpg"))
  (setq my-backlog-file (concat org-directory "backlog.org.gpg"))
  (setq my-orgzly-file (concat org-directory "orgzly.org"))
  (setq my-events-file (concat org-directory "events.org"))
  (setq my-papers-file (concat org-directory "papers.org"))
  (setq my-notes-file (concat org-directory "notes.org"))

  (setq +org-default-todo-file my-inbox-file)
  (setq +org-default-notes-file my-notes-file)

  (setq org-capture-templates
        '(
          ("u" "purpose" entry (file my-backlog-file)
           "* PURPOSE %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("v" "vision" entry (file my-backlog-file)
           "* VISION %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("t" "target" entry (file my-backlog-file)
           "* TARGET %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("m" "milestone" entry (file my-backlog-file)
           "* MILESTONE %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("r" "requirements" entry (file my-backlog-file)
           "* REQUIREMENT %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("p" "project" entry (file my-projects-file)
           "* PROJECT %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("n" "note-heading" entry (file my-notes-file)
           "* %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          ("c" "scrap" entry (file my-inbox-file)
           "* SCRAP %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
          )
        ) ;; org-capture-templates

  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-targets
        '(
          ;; (my-notes-file :maxlevel . 1)
          (my-one-off-file :todo . "")
          (my-events-file :todo . "")
          (my-projects-file :todo . "PROJECT")
          (my-projects-file :todo . "SPRINT")
          (my-backlog-file :todo . "")
          (my-backlog-file :todo . "SPRINT")
          (my-backlog-file :todo . "PROJECT")
          ;;(my-someday-maybe-file :maxlevel . 1)
          )
        )

  (setq org-todo-keywords
        '((sequence "SCRAP(a)" "TODO(t)" "WAITING(w)" "EVENT(e)" "PROJECT(p)"
                    "SPRINT(s)" "MILESTONE(m)" "REQUIREMENT(r)" "TARGET(g)"
                    "VISION(v)" "PURPOSE(u)" "|" "DONE(d)" "NOTE(n)")))
  (setq org-todo-keyword-faces
        '(("SCRAP" . (:foreground "LightYellow3" :weight semi-bold ))
          ("TODO" (:foreground "OrangeRed" :weight semi-bold))
          ("WAITING" (:foreground "GoldenRod" :weight semi-bold))
          ("SPRINT" (:foreground "SkyBlue1" :weight semi-bold))
          ("MILESTONE" (:foreground "SkyBlue1" :weight semi-bold))
          ("REQUIREMENT" (:foreground "SkyBlue1" :weight semi-bold))
          ("TARGET" (:foreground "SkyBlue1" :weight semi-bold))
          ("VISION" (:foreground "SkyBlue1" :weight semi-bold))
          ("PURPOSE" (:foreground "SkyBlue1" :weight semi-bold))
          ("DONE" (:foreground "LimeGreen" :weight semi-bold))
          ("NOTE" (:foreground "SkyBlue1" :weight semi-bold))
          ("STICKY" (:foreground "FireBrick3" :weight semi-bold))
          ("EVENT" (:foreground "Orchid1" :weight semi-bold))
          ))

  (setq org-agenda-start-with-log-mode t)
  (setq org-stuck-projects '("+TODO=\"PROJECT\"" ("TODO") nil ""))

  ;; How many lines to show
  (setq org-agenda-entry-text-maxlines 20)
  (setq org-agenda-entry-text-leaders "                                       ")
  ;; (setq org-agenda-files (list my-projects-file my-one-off-file my-events-file
  ;;                              my-papers-file my-backlog-file my-sprints-file))
;; ((agenda . " %i %-12:c%?-12t% s")

  ;; (setq org-agenda-prefix-format '((todo . "%i %?-28(foo)")
  ;;                                  (tags . "%i %?-36(foo)")
  ;;                                  ))
  ;;
  ;;
  ;; (defun foo ()
  ;;   (let ((x (org-get-outline-path)))
  ;;     (if (> (length x) 0)
  ;;         (concat "[ " (subseq (org-format-outline-path x) 0 (min 23 (length (org-format-outline-path x))) ) " ]")
  ;;       "")))

  ;; (defun org-which-function-old ()
  ;;   (interactive)
  ;;   (when (eq major-mode 'org-mode)
  ;;     (mapconcat 'identity (org-get-outline-path nil)
  ;;                " > ")
  ;;     ))

  ;; (setq org-agenda-hide-tags-regexp ".*")
  ;; (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  (defun toa/print-org-outline-path (l)
      (org-format-outline-path (org-get-outline-path) l nil "→"))

  (defun toa/print-org-entry (l)
    (org-format-outline-path (list (org-entry-get nil "ITEM")) l nil ""))

  (defun show-startdate-text ()
    (if (org-entry-properties (point) "important") "tsts" "**"))

  (setq org-agenda-timerange-leaders (list "" "<%-2d/%-2d>: "))
  ;; (setq org-agenda-compact-blocks t)
  (setq org-agenda-block-separator 46)
  ;; (setq org-agenda-remove-times-when-in-prefix nil)
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
                                             my-projects-file my-one-off-file
                                             my-events-file))
                     (org-agenda-prefix-format " %i %-12t% s")
                     (org-agenda-start-with-log-mode t)))

            (tags "+TODO=\"WAITING\""
                  ((org-agenda-overriding-header "Blockers")
                   (org-agenda-prefix-format
                    " %i %?-23(toa/print-org-outline-path 23) % s")
                   (org-agenda-files (list my-projects-file))))

            (tags "+TODO=\"DONE\"+CLOSED\"<-1d>\""
                  ((org-agenda-overriding-header "Closed during the last 24 hours ")
                   (org-agenda-todo-keyword-format "%+4s")
                   (org-agenda-prefix-format
                    " %i %?-30(toa/print-org-outline-path 30) % s")
                   (org-agenda-files (list my-projects-file
                                           my-papers-file my-one-off-file))))
            )
           )

          ("p" "plan view"
           (
            (agenda ""
                    ((org-agenda-span 'week)
                     (org-agenda-start-on-weekday 1)
                     (org-deadline-warning-days 14)
                     (org-agenda-files (list my-backlog-file
                                             my-projects-file my-one-off-file
                                             my-events-file))
                     (org-agenda-prefix-format " %i %-12t% s")
                     (org-agenda-start-with-log-mode t)))

            (stuck ""
                   ((org-agenda-overriding-header "Stuck Projects")
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
                                           my-papers-file my-one-off-file))))

            (tags "+TODO=\"WAITING\""
                  ((org-agenda-overriding-header "Blockers")
                   (org-agenda-prefix-format
                    " %i %?-23(toa/print-org-outline-path 23) % s")
                   (org-agenda-files (list my-projects-file))))

            (tags "+LEVEL>=1"
                  ((org-agenda-overriding-header "Inbox")
                   (org-agenda-sorting-strategy '(ts-down todo-state-down tag-up))
                   (org-agenda-prefix-format
                    " %i %?-23(toa/print-org-outline-path 30) % s")
                   (org-agenda-files (list my-inbox-file))))

            (tags "+TODO=\"DONE\"+CLOSED\"<-1w>\""
                  ((org-agenda-overriding-header "Closed during the last 7 days ")
                   (org-agenda-todo-keyword-format "%+4s")
                   (org-agenda-prefix-format
                    " %i %?-30(toa/print-org-outline-path 30) % s")
                   (org-agenda-files (list my-projects-file
                                           my-papers-file my-one-off-file))))
            )
           )

          ("s" "strategy view"
           (
            (agenda ""
                    ((org-agenda-span 'week)
                     (org-agenda-start-on-weekday 1)
                     (org-deadline-warning-days 30)
                     (org-agenda-files (list my-backlog-file
                                             my-projects-file my-one-off-file
                                             my-events-file))
                     (org-agenda-prefix-format " %i %-12t% s")
                     ;; (org-agenda-skip-scheduled-if-deadline-is-shown t)
                     (org-agenda-start-with-log-mode t)))

            (tags "+TODO=\"SPRINT\""
                  ((org-agenda-overriding-header "Planned Sprints")
                   (org-agenda-prefix-format " %i %-30t% s")
                   (org-agenda-files (list my-projects-file))))

            (tags "+TODO=\"TARGET\"|+TODO=\"VISION\""
                  ((org-agenda-overriding-header "Targets and Visions")
                   (org-agenda-prefix-format
                    " %i %?-23(toa/print-org-outline-path 23) % s")
                   (org-agenda-files (list my-projects-file))))

            (tags "+TODO=\"REQUIREMENT\"|+TODO=\"MILESTONE\""
                  ((org-agenda-overriding-header "Requirements and Milestones")
                   (org-agenda-prefix-format
                    " %i %?-30(toa/print-org-outline-path 30)% s")
                   (org-agenda-files (list my-projects-file))))

            (tags "+TODO=\"PROJECT\""
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-todo-keyword-format "%+7s")
                   (org-agenda-prefix-format
                    " %i %?-30(toa/print-org-outline-path 30) % s")
                   (org-agenda-files (list my-projects-file))))

            (stuck ""
                   ((org-agenda-overriding-header "Stuck Projects")
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
                                           my-papers-file my-one-off-file))))

            (tags "+TODO=\"WAITING\""
                  ((org-agenda-overriding-header "Blockers")
                   (org-agenda-prefix-format
                    " %i %?-23(toa/print-org-outline-path 23) % s")
                   (org-agenda-files (list my-projects-file))))

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

            (tags "+TODO=\"DONE\"+CLOSED\"<-1w>\""
                  ((org-agenda-overriding-header "Closed during the last 7 days")
                   (org-agenda-todo-keyword-format "%+4s")
                   (org-agenda-prefix-format
                    " %i %?-30(toa/print-org-outline-path 30) % s")
                   (org-agenda-files (list my-projects-file
                                           my-papers-file my-one-off-file))))
            ;; (tags "+TODO=\"DONE\"+CLOSED>\"<-1w>\""
            ;;       ((org-agenda-overriding-header "Actions Since One Week Ago")
            ;;        (org-agenda-todo-keyword-format "%+7s")
            ;;        (org-agenda-hide-tags-regexp ".*_")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-projects-file my-inbox-file my-one-off-file my-papers-file))
            ;;        (org-agenda-sorting-strategy '(time-down tag-up))))
            )

           )
          ;; ("d" "Daily View"
          ;;  ((agenda ""
          ;;           ((org-agenda-span 'day)
          ;;            (org-agenda-log-mode t)
          ;;            (org-deadline-warning-days 30)))
          ;;   (tags "+TODO=\"TODO\"+research"
          ;;         ((org-agenda-overriding-header "Research Next Actions")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-projects-file))))
          ;;   (tags "+TODO=\"TODO\"+techTransfer"
          ;;         ((org-agenda-overriding-header "Tech Transfer Next Actions")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-projects-file))))
          ;;   (tags "+TODO=\"TODO\"+knowledge"
          ;;         ((org-agenda-overriding-header "Knowledge Next Actions")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-hide-tags-regexp ".*_")
          ;;          (org-agenda-files (list my-projects-file my-papers-file))))
          ;;   (tags "+TODO=\"TODO\"-research-techTransfer-knowledge"
          ;;         ((org-agenda-overriding-header "Misc. Next Actions")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-projects-file))
          ;;          (org-agenda-sorting-strategy '(tag-up time-down))))
          ;;   (todo "TODO|WAITING"
          ;;         ((org-agenda-overriding-header "One-off Actions")
          ;;          (org-agenda-files (list my-one-off-file))
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))))
          ;;   (tags "+LEVEL=1"
          ;;         ((org-agenda-overriding-header "Sticky Items")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-sticky-file))))
          ;;   (tags "+TODO=\"DONE\"+CLOSED>\"<today>\""
          ;;         ((org-agenda-overriding-header "Actions Closed Today")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-hide-tags-regexp ".*_")
          ;;          (org-agenda-files (list my-projects-file))
          ;;          (org-agenda-sorting-strategy '(time-down tag-up))))
          ;;   ))
          ;; ("w" "Weekly Review"
          ;;  (
          ;;   (agenda "" ((org-agenda-span 'week)
          ;;               (org-deadline-warning-days 120)
          ;;               (org-agenda-log-mode t)
          ;;               ))
          ;;   (tags "+LEVEL=1+SCHEDULED>=\"<-2w>\""
          ;;         ((org-agenda-overriding-header "Active Sprints")
          ;;          (org-agenda-files (list my-sprints-file))
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))
          ;;          (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
          ;;   (tags "+LEVEL=1/!-SCHEDULED|-DEADLINE"
          ;;         ((org-agenda-overriding-header "Unscheduled Sprints")
          ;;          (org-agenda-files (list my-sprints-file))
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))
          ;;          (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
          ;;   (tags "+LEVEL=2"
          ;;         ((org-agenda-overriding-header "Active Sprint Projects")
          ;;          (org-agenda-files (list my-sprints-file))
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))
          ;;          (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
          ;;   (tags "+LEVEL=3"
          ;;         ((org-agenda-overriding-header "Sprint Project Actionables")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-sprints-file))
          ;;          (org-agenda-hide-tags-regexp ".*_")
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))
          ;;          ))
          ;;   (todo "REQUIREMENT"
          ;;         ((org-agenda-overriding-header "Backlogs")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-sprints-file))
          ;;          (org-agenda-hide-tags-regexp ".*_")
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))))
          ;;   (todo ""
          ;;         ((org-agenda-overriding-header "Backlogs")
          ;;          (org-agenda-prefix-format "%i %?-28(foo)")
          ;;          (org-agenda-files (list my-sprints-file))
          ;;          (org-agenda-hide-tags-regexp ".*_")
          ;;          (org-agenda-sorting-strategy '(tag-up time-up))))
            ;; (tags "+LEVEL<=1"
            ;;       ((org-agenda-overriding-header "Active Projects")
            ;;        (org-agenda-files (list my-projects-file my-papers-file))
            ;;        (org-agenda-sorting-strategy '(tag-up time-up))
            ;;        (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
            ;; (todo "TODO"
            ;;       ((org-agenda-overriding-header "Next Actions")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-projects-file my-papers-file))
            ;;        (org-agenda-hide-tags-regexp ".*_")
            ;;        (org-agenda-sorting-strategy '(tag-up time-up))))
            ;; (todo "TODO|WAITING"
            ;;       ((org-agenda-overriding-header "One-off Actions")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-one-off-file))
            ;;        (org-agenda-sorting-strategy '(tag-up time-up))))
            ;; (stuck ""
            ;;        ((org-agenda-overriding-header "Stuck Projects")
            ;;         (org-agenda-files (list my-projects-file my-papers-file))
            ;;         (org-agenda-sorting-strategy '(tag-up time-up))))
            ;; (todo "WAITING"
            ;;       ((org-agenda-overriding-header "Waiting For")
            ;;        (org-agenda-files (list my-projects-file))
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-sorting-strategy '(tag-up time-up))))
            ;; (tags "+LEVEL=1"
            ;;       ((org-agenda-overriding-header "Someday-Maybe")
            ;;        (org-agenda-files (list my-someday-maybe-file))
            ;;        (org-agenda-prefix-format "%i %?-36(foo)")
            ;;        (org-agenda-sorting-strategy '(tag-up time-up))))
            ;; (todo "SCRAP|TODO|WAITING|NOTE|STICKY|EVENT"
            ;;       ((org-agenda-overriding-header "Unprocessed Items")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-inbox-file my-orgzly-file))))
            ;; (todo "SCRAP"
            ;;       ((org-agenda-overriding-header "Unlabeled Items")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files
            ;;         (list my-projects-file my-someday-maybe-file my-notes-file my-sticky-file my-one-off-file my-events-file))))
            ;; (tags "-{.*}"
            ;;       ((org-agenda-overriding-header "Untagged Items")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-projects-file my-someday-maybe-file my-one-off-file my-sticky-file))))
            ;; (tags "+LEVEL=1"
            ;;       ((org-agenda-overriding-header "Sticky Items")
            ;;        (org-agenda-todo-keyword-format "%+7s")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-sticky-file))))
            ;; (tags "+LEVEL=1+TODO=\"EVENT\""
            ;;       ((org-agenda-overriding-header "Important Events")
            ;;        (org-agenda-todo-keyword-format "%+7s")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-sorting-strategy '(time-up))
            ;;        (org-agenda-files (list my-events-file))))
            ;; (tags "+TODO=\"DONE\"+CLOSED>\"<-1w>\""
            ;;       ((org-agenda-overriding-header "Actions Since One Week Ago")
            ;;        (org-agenda-todo-keyword-format "%+7s")
            ;;        (org-agenda-hide-tags-regexp ".*_")
            ;;        (org-agenda-prefix-format "%i %?-28(foo)")
            ;;        (org-agenda-files (list my-projects-file my-inbox-file my-one-off-file my-papers-file))
            ;;        (org-agenda-sorting-strategy '(time-down tag-up))))
          ;;   ))
          )
        )

  (setq org-tag-alist '(
                        ("overhead" . ?o)
                        ("support" . ?s)
                        ("outlook" . ?l)
                        ("blueSky" . ?b)
                        ("knowledge" . ?k)
                        ("research" . ?r)
                        ("publication" . ?p)
                        ("publicity" . ?u)
                        ("patent" . ?n)
                        ("techXfer" . ?t)
                        ("academic" . ?a)
                        ("student" . ?s)
                        ("personal" . ?m)
                        ))
  ;; (setq org-tag-alist '(
  ;;                       ("overhead" . ?o)
  ;;                       ("support" . ?s)
  ;;                       ("outlook" . ?l)
  ;;                       ("blueSky" . ?b)
  ;;                       ("knowledge" . ?k)
  ;;                       ("research" . ?r)
  ;;                       ("publication" . ?p)
  ;;                       ("publicity" . ?u)
  ;;                       ("patent" . ?q)
  ;;                       ("techTransfer" . ?t)
  ;;                       ("academicService" . ?a)
  ;;                       ("externalProjects" . ?e)
  ;;                       ("studentAdvice" . ?s)
  ;;                       ("personal" . ?m)
  ;;                       ("myfamily" . ?f)
  ;;                       ("@home" . ?h)
  ;;                       ))
  ;; (setq org-agenda-tag-filter-preset '("-mustRead"))
  ;; (setq org-agenda-hide-tags-regexp "imageProcessing\\|videoProcessing\\|burstImages\\|2017\\|2016\\|2015\\|2014andOlder")
  ;; (setq org-agenda-hide-tags-regexp ".*_")
  (setq org-tag-faces
        '(
          ("research" . (:foreground "greenyellow" :weight semi-bold))
          ("knowledge" . (:foreground "greenyellow" :weight semi-bold))
          ("blueSky" . (:foreground "greenyellow" :weight semi-bold))
          ("publication" . (:foreground "greenyellow" :weight semi-bold))

          ("support" . (:foreground "palegreen" :weight normal))
          ("publicity" . (:foreground "palegreen" :weight normal))

          ("patent" . (:foreground "salmon2" :weight semi-bold))
          ("techTransfer" . (:foreground "salmon2" :weight semi-bold))
          ("blueSky" . (:foreground "salmon2" :weight semi-bold))


          ("outlook" . (:foreground "slateblue2" :weight normal))
          ("personal" . (:foreground "slateblue2" :weight normal))
          ("myfamily" . (:foreground "slateblue2" :weight normal))

          ("overhead" . (:foreground "thistle1" :weight normal))
          ("academicService" . (:foreground "thistle1" :weight normal))
          ("externalProjects" . (:foreground "thistle1" :weight normal))
          ("studentAdvice" . (:foreground "thistle1" :weight normal))

          ("@home" . (:foreground "green3" :weight normal :underline t))
          )

        )
  ;;(set-face-attribute 'org-level-1 nil :height 1.0)
  ) ;; after! org
