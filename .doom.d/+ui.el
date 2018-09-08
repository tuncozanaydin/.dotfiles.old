;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

(setq org-elipsis "⤵")
(doom-themes-visual-bell-config)
(doom-themes-treemacs-config)
(doom-themes-org-config)
(after! org
  (set-face-attribute 'org-level-1 nil :height 1.0))
(defun my/org-mode-hook ()
  (set-face-attribute 'org-level-1 nil :height 1.0))
(add-hook 'org-load-hook #'my/org-mode-hook)

(pixel-scroll-mode t)
