;;; ~/.dotfiles/.doom.d/+org-agenda-setup.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/org/")
(setq org-archive-directory (concat org-directory "archive/"))
(setq org-archive-location (concat org-archive-directory "%s::"))
(setq my-inbox-file (concat org-directory "inbox.org"))
(setq my-projects-file (concat org-directory "projects.org.gpg"))
(setq my-backlog-file (concat org-directory "backlog.org.gpg"))
(setq my-orgzly-file (concat org-directory "orgzly.org"))
(setq my-papers-file (concat org-directory "papers.org"))

(setq org-agenda-block-separator 46)
