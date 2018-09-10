;;; ~/.doom.d/+keybinds.el -*- lexical-binding: t; -*-

;; (defvar test (if (boundp 'evil-colemak-basics-keymap) evil-colemak-basics-keymap evil-org-mode-map))
;; (defun select-keymap ()
;;   (if (boundp 'evil-colemak-basics-keymap)
;;       evil-colemak-basics-keymap
;;     evil-org-mode-map))
(global-evil-colemak-basics-mode)
(defun select-keymap ()
  (if (string= system-name "jung")
      evil-org-mode-map
    evil-colemak-basics-keymap))
(defvar agenda-keymap (select-keymap))
(map!
 (:after org-agenda
   ;; :map evil-colemak-basics-keymap
   :map agenda-keymap
   :m "t" #'org-agenda-todo
   :m "w" #'org-agenda-refile
   :m "f" #'org-agenda-set-tags
   :m "a" #'org-agenda-archive-default-with-confirmation
   :m "s" #'org-agenda-schedule
   :m "d" #'org-agenda-deadline
   :m "r" #'org-agenda-redo
   :m "P" #'(lambda () (interactive) (org-capture nil "p"))
   :m "N" #'(lambda () (interactive) (org-capture nil "n"))
   :m "C" #'(lambda () (interactive) (org-capture nil "c"))
   ;; :m "I" #'org-clock-in
   :m "O" #'org-clock-out
   ;;:m "C" #'org-clock-cancel
   :m "R" #'org-clock-in-last
   )
 (:after org-capture
   :map org-capture-mode-map
   :n "k" #'org-capture-kill
   :n "w" #'org-capture-refile
   :n "c" #'org-capture-finalize
   )

 :leader
 (:desc "drill" :prefix "D"
   :desc "test" :nv "t" #'(lambda () (interactive) (progn (find-file "~/org/memory.org") (org-drill)))
   )
 (:desc "agenda" :prefix "a"
   :desc "week agenda" :nv "w" #'(lambda () (interactive) (progn (org-agenda nil "w")) (delete-other-windows))
   :desc "day agenda" :nv "d" #'(lambda () (interactive) (org-agenda nil "d"))
   :desc "capture" :nv "c" #'(lambda () (interactive) (org-capture nil "c"))
   :desc "clock in" :nv "i" #'org-clock-in
   :desc "clock out" :nv "o" #'org-clock-out
   :desc "clock goto" :nv "g" #'org-clock-goto
   ;; :desc "clock resume" :nv "r" #'org-clock-in-last
   :desc "clock cancel" :nv "c" #'org-clock-cancel
   )
 )

;; (lambda nil (global-evil-colemak-basics-mode t))


;; org-agenda
;; org-capture buffer
;; org-drill
;; org time tracking
;; latex/bibtex
;; python/pdb
;; website stuff
;; git
