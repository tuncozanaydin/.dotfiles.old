;;; ~/.dotfiles/.doom.d/+deft.el -*- lexical-binding: t; -*-

(after! deft
  (setq def-extensions '("org" "txt"))
  (setq deft-directory "~/Dropbox/org/notes")
  (setq deft-default-extension "org")
  (setq deft-use-filename-as-title t)
  )
