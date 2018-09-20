;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(after! org

 (setq org-agenda-window-setup 'current-window)
 (set-popup-rule! "^\\*Org Agenda"
   :size 1.0)

  (defun foo ()
    (let ((x (org-get-outline-path)))
      (if (> (length x) 0)
          (concat "[ " (subseq (org-format-outline-path x) 0 (min 23 (length (org-format-outline-path x))) ) " ]")
        "")))

  (setq org-agenda-prefix-format '((todo . "%i %?-28(foo)")
                                   (tags . "%i %?-36(foo)")
                                   ))
  (setq org-agenda-todo-keyword-format "%+7s")

  ;; Place tags close to the right-hand side of the window
  (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
  (defun place-agenda-tags ()
    "Put the agenda tags by the right border of the agenda window."
    (setq org-agenda-tags-column (- 6 (window-width)))
    (org-agenda-align-tags))

  (setq org-tags-column -138)

  (setq org-directory "~/Dropbox/org/")
  (setq org-archive-directory (concat org-directory "archive/"))
  (setq org-archive-location (concat org-archive-directory "%s::"))
  (setq my-inbox-file (concat org-directory "inbox.org"))
  (setq my-projects-file (concat org-directory "projects.org"))
  (setq my-notes-file (concat org-directory "notes.org"))
  (setq my-someday-maybe-file (concat org-directory "someday-maybe.org"))
  (setq my-sticky-file (concat org-directory "sticky.org"))
  (setq my-one-off-file (concat org-directory "one-off.org"))
  (setq my-sprints-file (concat org-directory "sprints.org"))
  (setq my-events-file (concat org-directory "events.org"))
  (setq my-orgzly-file (concat org-directory "orgzly.org"))
  (setq my-papers-file (concat org-directory "papers.org"))

  (setq +org-default-todo-file my-inbox-file)
  (setq +org-default-notes-file my-notes-file)

  (setq org-capture-templates
        '(
          ("p" "project" entry (file my-projects-file)
           "* %?\n:PROPERTIES:\n:Created:\t%U\n:END:\n")
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
          (my-projects-file :maxlevel . 1)
          (my-notes-file :maxlevel . 1)
          (my-one-off-file :maxlevel . 1)
          (my-events-file :maxlevel . 1)
          (my-sticky-file :maxlevel . 1)
          (my-sprints-file :maxlevel . 2)
          (my-someday-maybe-file :maxlevel . 1)
          )
        )

  (setq org-todo-keywords
        '((sequence "SCRAP(s)" "TODO(t)" "WAITING(w)" "EVENT(e)" "|" "DONE(d)" "NOTE(n)" "STICKY(z)")))
  (setq org-todo-keyword-faces
        '(("SCRAP" . (:foreground "LightYellow3" :weight semi-bold ))
          ("TODO" (:foreground "OrangeRed" :weight semi-bold))
          ("WAITING" (:foreground "GoldenRod" :weight semi-bold))
          ("DONE" (:foreground "LimeGreen" :weight semi-bold))
          ("NOTE" (:foreground "SkyBlue1" :weight semi-bold))
          ("STICKY" (:foreground "FireBrick3" :weight semi-bold))
          ("EVENT" (:foreground "Orchid1" :weight semi-bold))
          ))

  (setq org-stuck-projects '("+LEVEL=1" ("TODO") nil ""))
  (setq org-agenda-files (list my-projects-file my-one-off-file my-sticky-file my-events-file my-papers-file))
  (setq org-agenda-custom-commands
        '(
          ("d" "Daily View"
           ((agenda ""
                    ((org-agenda-span 'day)
                     (org-agenda-log-mode t)
                     (org-deadline-warning-days 30)))
            (tags "+TODO=\"TODO\"+research"
                  ((org-agenda-overriding-header "Research Next Actions")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-projects-file))))
            (tags "+TODO=\"TODO\"+techTransfer"
                  ((org-agenda-overriding-header "Tech Transfer Next Actions")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-projects-file))))
            (tags "+TODO=\"TODO\"+knowledge"
                  ((org-agenda-overriding-header "Knowledge Next Actions")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-hide-tags-regexp ".*_")
                   (org-agenda-files (list my-projects-file my-papers-file))))
            (tags "+TODO=\"TODO\"-research-techTransfer-knowledge"
                  ((org-agenda-overriding-header "Misc. Next Actions")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-projects-file))
                   (org-agenda-sorting-strategy '(tag-up time-down))))
            (todo "TODO|WAITING"
                  ((org-agenda-overriding-header "One-off Actions")
                   (org-agenda-files (list my-one-off-file))
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-sorting-strategy '(tag-up time-up))))
            (tags "+LEVEL=1"
                  ((org-agenda-overriding-header "Sticky Items")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-sticky-file))))
            (tags "+TODO=\"DONE\"+CLOSED>\"<today>\""
                  ((org-agenda-overriding-header "Actions Closed Today")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-hide-tags-regexp ".*_")
                   (org-agenda-files (list my-projects-file))
                   (org-agenda-sorting-strategy '(time-down tag-up))))
            ))
          ("w" "Weekly Review"
           (
            (agenda "" ((org-agenda-span 'week)
                        (org-deadline-warning-days 120)
                        (org-agenda-log-mode t)
                        ))
            (tags "+LEVEL=1+SCHEDULED>=\"<-2w>\""
                  ((org-agenda-overriding-header "Active Sprints")
                   (org-agenda-files (list my-sprints-file))
                   (org-agenda-sorting-strategy '(tag-up time-up))
                   (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
            (tags "+LEVEL=1/!-SCHEDULED|-DEADLINE"
                  ((org-agenda-overriding-header "Unscheduled Sprints")
                   (org-agenda-files (list my-sprints-file))
                   (org-agenda-sorting-strategy '(tag-up time-up))
                   (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
            (tags "+LEVEL=2"
                  ((org-agenda-overriding-header "Active Sprint Projects")
                   (org-agenda-files (list my-sprints-file))
                   (org-agenda-sorting-strategy '(tag-up time-up))
                   (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
            (tags "+LEVEL=3"
                  ((org-agenda-overriding-header "Sprint Project Actionables")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-sprints-file))
                   (org-agenda-hide-tags-regexp ".*_")
                   (org-agenda-sorting-strategy '(tag-up time-up))
                   ))
            (tags "+LEVEL<=1"
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-files (list my-projects-file my-papers-file))
                   (org-agenda-sorting-strategy '(tag-up time-up))
                   (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo '("TODO")))))
            (todo "TODO"
                  ((org-agenda-overriding-header "Next Actions")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-projects-file my-papers-file))
                   (org-agenda-hide-tags-regexp ".*_")
                   (org-agenda-sorting-strategy '(tag-up time-up))))
            (todo "TODO|WAITING"
                  ((org-agenda-overriding-header "One-off Actions")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-one-off-file))
                   (org-agenda-sorting-strategy '(tag-up time-up))))
            (stuck ""
                   ((org-agenda-overriding-header "Stuck Projects")
                    (org-agenda-files (list my-projects-file my-papers-file))
                    (org-agenda-sorting-strategy '(tag-up time-up))))
            (todo "WAITING"
                  ((org-agenda-overriding-header "Waiting For")
                   (org-agenda-files (list my-projects-file))
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-sorting-strategy '(tag-up time-up))))
            (tags "+LEVEL=1"
                  ((org-agenda-overriding-header "Someday-Maybe")
                   (org-agenda-files (list my-someday-maybe-file))
                   (org-agenda-prefix-format "%i %?-36(foo)")
                   (org-agenda-sorting-strategy '(tag-up time-up))))
            (todo "SCRAP|TODO|WAITING|NOTE|STICKY|EVENT"
                  ((org-agenda-overriding-header "Unprocessed Items")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-inbox-file my-orgzly-file))))
            (todo "SCRAP"
                  ((org-agenda-overriding-header "Unlabeled Items")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files
                    (list my-projects-file my-someday-maybe-file my-notes-file my-sticky-file my-one-off-file my-events-file))))
            (tags "-{.*}"
                  ((org-agenda-overriding-header "Untagged Items")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-projects-file my-someday-maybe-file my-one-off-file my-sticky-file))))
            (tags "+LEVEL=1"
                  ((org-agenda-overriding-header "Sticky Items")
                   (org-agenda-todo-keyword-format "%+7s")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-sticky-file))))
            (tags "+LEVEL=1+TODO=\"EVENT\""
                  ((org-agenda-overriding-header "Important Events")
                   (org-agenda-todo-keyword-format "%+7s")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-sorting-strategy '(time-up))
                   (org-agenda-files (list my-events-file))))
            (tags "+TODO=\"DONE\"+CLOSED>\"<-1w>\""
                  ((org-agenda-overriding-header "Actions Since One Week Ago")
                   (org-agenda-todo-keyword-format "%+7s")
                   (org-agenda-hide-tags-regexp ".*_")
                   (org-agenda-prefix-format "%i %?-28(foo)")
                   (org-agenda-files (list my-projects-file my-inbox-file my-one-off-file my-papers-file))
                   (org-agenda-sorting-strategy '(time-down tag-up))))
            ))
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
                        ("patent" . ?q)
                        ("techTransfer" . ?t)
                        ("academicService" . ?a)
                        ("externalProjects" . ?e)
                        ("studentAdvice" . ?s)
                        ("personal" . ?m)
                        ("myfamily" . ?f)
                        ("@home" . ?h)
                        ))
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
