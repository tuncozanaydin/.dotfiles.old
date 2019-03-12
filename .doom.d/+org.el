;;; ~/.dotfiles/.doom.d/+org.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(add-hook 'org-mode-hook #'turn-off-smartparens-mode)
