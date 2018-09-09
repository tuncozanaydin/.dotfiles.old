;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; (setq org-elipsis "⤵")
;; (doom-themes-visual-bell-config)
;; (doom-themes-treemacs-config)
;; (doom-themes-org-config)
;; (after! org
;;   (set-face-attribute 'org-level-1 nil :height 1.0))
;; (defun my/org-mode-hook ()
;;   (set-face-attribute 'org-level-1 nil :height 1.0 :weight 'medium))
;; (add-hook 'org-load-hook #'my/org-mode-hook)

;; (after! doom-themes
;;   (set-face-attribute 'org-level-1 nil :height 1.0 :weight 'medium))

(pixel-scroll-mode t)

(after! org
  (set-face-attribute 'org-level-1 nil :height 0.82 :weight 'normal)
  (set-face-attribute 'org-level-2 nil :weight 'normal)
  (set-face-attribute 'org-level-3 nil :weight 'normal)
  (set-face-attribute 'org-level-4 nil :weight 'normal)
  (set-face-attribute 'org-level-5 nil :weight 'normal)
  )
