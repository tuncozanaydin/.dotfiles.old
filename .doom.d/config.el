;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-localleader-key ",")
(setq doom-font (font-spec :family "Source Code Pro" :size 15))
(load! "+keybinds")
(load! "+deft")
(after! org
  (load! "+org")
  (load! "+org-agenda-setup")
  (load! "+org-agenda-views")
  (load! "+org-agenda-capture-refile")
  (load! "+org-agenda-tags")
  )

