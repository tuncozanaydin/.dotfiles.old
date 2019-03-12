;;; ~/.dotfiles/.doom.d/+org-agenda-tags.el -*- lexical-binding: t; -*-

;; Place tags close to the right-hand side of the window
(add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
(defun place-agenda-tags ()
  "Put the agenda tags by the right border of the agenda window."
  (setq org-agenda-tags-column (- 6 (window-width)))
  (org-agenda-align-tags))

(setq org-agenda-hide-tags-regexp ".*_")

(setq org-tag-alist '(
                      ("overhead" . ?o)
                      ("academic" . ?a)
                      ("support" . ?s)
                      ("outlook" . ?k)
                      ("fundamentals" . ?f)
                      ("literature" . ?l)
                      ("prototype" . ?r)
                      ("techXfer" . ?t)
                      ("publication" . ?p)
                      ("communication" . ?c)
                      ("personal" . ?m)
                      ))

(setq org-tag-faces
      '(
        ("overhead" . (:foreground "seashell4" :weight normal))
        ("academic" . (:foreground "thistle1" :weight normal))
        ("support" . (:foreground "dodgerblue2" :weight normal))

        ("outlook" . (:foreground "purple2" :weight semi-bold))
        ("fundamentals" . (:foreground "maroon2" :weight semi-bold))
        ("literature" . (:foreground "mediumorchid1" :weight semi-bold))

        ("prototype" . (:foreground "goldenrod1" :weight semi-bold))
        ("techXfer" . (:foreground "lightgoldenrod1" :weight semi-bold))

        ("publication" . (:foreground "springgreen3" :weight semi-bold))
        ("communication" . (:foreground "chartreuse1" :weight normal))

        ("personal" . (:foreground "cadetblue2" :weight semi-bold))
        )
      )
