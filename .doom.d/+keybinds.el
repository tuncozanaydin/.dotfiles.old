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
(after! evil
  (setq evil-window-map (make-sparse-keymap)))
(map!
 (:after org-agenda
   :map org-agenda-mode-map
   :localleader
   :desc "quit agenda retain buffers" :m "q" #'org-agenda-quit
   :desc "exit agenda close buffers" :m "x" #'org-agenda-exit
   :desc "set todo state" :m "t" #'org-agenda-todo
   :desc "refile item" :m "w" #'org-agenda-refile
   :desc "set tags" :m "f" #'org-agenda-set-tags
   :desc "archive item" :m "b" #'org-agenda-archive-default-with-confirmation
   :desc "schedule item" :m "s" #'org-agenda-schedule
   :desc "set deadline" :m "d" #'org-agenda-deadline
   :desc "refresh" :m "r" #'org-agenda-redo
   :desc "undo" :m "l" #'org-agenda-undo
   :desc "kill item" :m "k" #'org-agenda-kill
   :desc "goto org entry" :m "g" #'org-agenda-goto
   :desc "goto tree" :m "<tab>" #'org-tree-to-indirect-buffer
   :desc "open link" :m "o" #'org-agenda-open-link
   :desc "show entry text" :m "e" #'org-agenda-entry-text-mode
   :desc "save all" :m "S" #'projectile-save-project-buffers
   :desc "capture" :m "a" #'(lambda () (interactive) (org-capture nil "c"))
   :desc "heading project" :m "hp" #'(lambda () (interactive) (org-capture nil "p"))
   :desc "heading note" :m "hn" #'(lambda () (interactive) (org-capture nil "n"))
   :desc "clock in" :m "ci" #'org-agenda-clock-in
   :desc "clock out" :m "co" #'org-agenda-clock-out
   :desc "clock exit" :m "cx" #'org-agenda-clock-cancel
   :desc "clock resume" :m "cr" #'org-agenda-clock-in-last
   :desc "clock goto" :m "cg" #'org-agenda-clock-goto
   :desc "day view" :m "vd" #'org-agenda-day-view
   :desc "week view" :m "vw" #'org-agenda-week-view
   :desc "fortnight view" :m "vf" #'org-agenda-fortnight-view
   :desc "month view" :m "vm" #'org-agenda-month-view
   :desc "later" :m "vn" #'org-agenda-later
   :desc "earlier" :m "ve" #'org-agenda-earlier
   :desc "today" :m "vt" #'org-agenda-goto-today
   )
 (:after org-capture
   :map org-capture-mode-map
   :localleader
   :desc "kill buffer" :n "x" #'org-capture-kill
   :desc "refile" :n "w" #'org-capture-refile
   :desc "save and close" :n "c" #'(lambda () (interactive) (progn (org-capture-finalize) (org-agenda-redo)))
   )

 :leader
 (:prefix "w"
   :desc "up" :mnvo "e" #'evil-window-up
   :desc "down" :mnvo "n" #'evil-window-down
   :desc "left" :mnvo "h" #'evil-window-left
   :desc "move right" :mnvo "i" #'evil-window-right
   :desc "next" :mnvo "w" #'evil-window-next
   :desc "maximize" :mnvo "m" #'delete-other-windows
   :desc "delete" :mnvo "d" #'evil-window-delete
   :desc "undo" :mnvo "l" #'winner-undo
   :desc "redo" :mnvo "L" #'winner-redo
   :desc "horizontal split" :mnvo "-" #'evil-window-split
   :desc "vertical split" :mnvo "'" #'evil-window-vsplit
   :desc "+ height" :mnvo "<up>" #'evil-window-increase-height
   :desc "- height" :mnvo "<down>" #'evil-window-decrease-height
   :desc "+ width" :mnvo "<right>" #'evil-window-increase-width
   :desc "- width" :mnvo "<left>" #'evil-window-decrease-width
   :desc "balance" :mnvo "=" #'balance-windows

   )
 (:desc "drill" :prefix "D"
   :desc "test" :nv "t" #'(lambda () (interactive) (progn (find-file "~/org/memory.org") (org-drill)))
   )
 (:desc "agenda" :prefix "a"
   :desc "strategy view" :nv "s" #'(lambda () (interactive) (progn (org-agenda nil "s")) (delete-other-windows))
   :desc "plan view" :nv "p" #'(lambda () (interactive) (progn (org-agenda nil "p")) (delete-other-windows))
   :desc "focus view" :nv "f" #'(lambda () (interactive) (org-agenda nil "f"))
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
