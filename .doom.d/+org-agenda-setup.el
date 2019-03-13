;;; ~/.dotfiles/.doom.d/+org-agenda-setup.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/org/")
(setq org-archive-directory (concat org-directory "agenda/archive/"))
(setq org-archive-location (concat org-archive-directory "%s::"))
(setq my-inbox-file (concat org-directory "agenda/inbox.org"))
(setq my-projects-file (concat org-directory "agenda/projects.org"))
(setq my-backlog-file (concat org-directory "agenda/backlog.org"))
(setq my-papers-file (concat org-directory "papers/papers.org"))

(setq org-agenda-block-separator 46)
