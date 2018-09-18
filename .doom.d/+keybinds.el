;;; ~/.doom.d/+keybinds.el -*- lexical-binding: t; -*-

(defun set-in-evil-states (key def maps)
  (while maps
    (define-key (pop maps) key def)))

(defun set-evil-mnvo-binding (key def)
  (unless (string= system-name "jung")
    (set-in-evil-states key def (list evil-motion-state-map
                                      evil-normal-state-map
                                      evil-visual-state-map
                                      evil-operator-state-map))))

(defun set-evil-nv-binding (key def)
  (unless (string= system-name "jung")
    (set-in-evil-states key def (list evil-normal-state-map
                                      evil-visual-state-map))))

(after! evil
(set-evil-mnvo-binding "h" 'evil-backward-char)
(set-evil-mnvo-binding "e" 'evil-previous-line)
(set-evil-mnvo-binding "n" 'evil-next-line)
(set-evil-mnvo-binding "i" 'evil-forward-char)
(set-evil-mnvo-binding "k" 'evil-search-next)
(set-evil-mnvo-binding "K" 'evil-search-previous)

(set-evil-nv-binding "u" 'evil-insert)
(set-evil-nv-binding "U" 'evil-insert-line)
(set-evil-nv-binding "l" 'undo-tree-undo)
(set-evil-nv-binding "L" 'undo-tree-redo)
)

(after! org-agenda
  (setq org-agenda-mode-map (make-sparse-keymap)))
(map!
 (:after org-agenda
   :map org-agenda-mode-map
   :localleader
   :m "q" #'org-agenda-quit
   :m "x" #'org-agenda-exit
   :m "t" #'org-agenda-todo
   :m "w" #'org-agenda-refile
   :m "f" #'org-agenda-set-tags
   :m "v" #'org-agenda-archive-default-with-confirmation
   :m "s" #'org-agenda-schedule
   :m "d" #'org-agenda-deadline
   :m "r" #'org-agenda-redo
   :m "l" #'org-agenda-undo
   :desc "agenda scrap" :m "a" #'(lambda () (interactive) (org-capture nil "c"))
   :desc "agenda project heading" :m "hp" #'(lambda () (interactive) (org-capture nil "p"))
   :desc "agenda note heading" :m "hn" #'(lambda () (interactive) (org-capture nil "n"))
   :desc "clock in" :m "ci" #'org-agenda-clock-in
   :desc "clock out" :m "co" #'org-agenda-clock-out
   :desc "clock exit" :m "cx" #'org-agenda-clock-cancel
   :desc "clock resume" :m "cr" #'org-agenda-clock-in-last
   :desc "clock goto" :m "cg" #'org-agenda-clock-goto
   )
 (:after org-capture
   :map org-capture-mode-map
   :n "x" #'org-capture-kill
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
   :desc "capture scrap" :nv "a" #'(lambda () (interactive) (org-capture nil "c"))
   :desc "clock in" :nv "i" #'(lambda () (interactive)
                                (setq current-prefix-arg '(4))
                                (call-interactively 'org-clock-in))
   :desc "clock out" :nv "o" #'org-clock-out
   :desc "clock goto" :nv "g" #'(lambda () (interactive)
                                  (setq current-prefix-arg '(4))
                                  (call-interactively 'org-clock-goto))
   :desc "clock exit" :nv "x" #'org-clock-cancel
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
