;;; ~/.doom.d/+keybinds.el -*- lexical-binding: t; -*-

(map!
 (:after org-agenda
   :map evil-colemak-basics-keymap
   :m "t" #'org-agenda-todo
   :m "p" #'org-agenda-refile
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
   :n "p" #'org-capture-refile
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



;; org-agenda
;; org-capture buffer
;; org-drill
;; org time tracking
;; latex/bibtex
;; python/pdb
;; website stuff
;; git
