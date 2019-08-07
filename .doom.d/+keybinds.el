;;; ~/.dotfiles/.doom.d/+keybinds.el -*- lexical-binding: t; -*-

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
  (set-evil-mnvo-binding "j" 'evil-next-match)
  (set-evil-mnvo-binding "J" 'evil-previous-match)
  (set-evil-mnvo-binding "k" 'evil-forward-word-end)
  (set-evil-mnvo-binding "K" 'evil-backward-word-end)

  (set-evil-nv-binding "u" 'evil-insert)
  (set-evil-nv-binding "U" 'evil-insert-line)
  (set-evil-nv-binding "l" 'undo-tree-undo)
  (set-evil-nv-binding "L" 'undo-tree-redo)
  )

;; (after! org-agenda
;;   (setq org-agenda-mode-map (make-sparse-keymap)))

(after! evil
  (setq evil-window-map (make-sparse-keymap)))
(map!
   :map org-agenda-localleader-mode-map
   :localleader
   :desc "quit agenda retain buffers" :m "q" #'org-agenda-quit
   :desc "exit agenda close buffers" :m "x" #'org-agenda-exit
   ;; :desc "set todo state" :m "t" #'org-agenda-todo
   :m "t" #'(lambda () "set todo state" (interactive) (progn (org-agenda-todo) (org-agenda-redo)))
   :desc "refile" :m "w" #'org-capture-refile
   :desc "refile item" :m "w" #'org-agenda-refile
   :desc "set tags" :m "f" #'org-agenda-set-tags
   :desc "schedule item" :m "s" #'org-agenda-schedule
   :desc "set deadline" :m "d" #'org-agenda-deadline
   :desc "kill item" :m "k" #'org-agenda-kill
   :desc "save all" :m "S" #'org-save-all-org-buffers
   :desc "capture" :m "a" #'(lambda () "capture" (interactive) (org-capture nil "c"))
   :desc "archive item" :m "A" #'org-agenda-archive-default-with-confirmation
 ;; (:after org-agenda
 ;;   :map org-agenda-mode-map
 ;;   :localleader
 ;;   :desc "quit agenda retain buffers" :m "q" #'org-agenda-quit
 ;;   :desc "exit agenda close buffers" :m "x" #'org-agenda-exit
 ;;   :desc "set todo state" :m "t" #'org-agenda-todo
 ;;   :desc "refile item" :m "w" #'org-agenda-refile
 ;;   :desc "set tags" :m "f" #'org-agenda-set-tags
 ;;   :desc "archive item" :m "b" #'org-agenda-archive-default-with-confirmation
 ;;   :desc "schedule item" :m "s" #'org-agenda-schedule
 ;;   :desc "set deadline" :m "d" #'org-agenda-deadline
 ;;   :desc "refresh" :m "r" #'org-agenda-redo
 ;;   :desc "undo" :m "l" #'org-agenda-undo
 ;;   :desc "kill item" :m "k" #'org-agenda-kill
 ;;   :desc "goto org entry" :m "g" #'org-agenda-goto
 ;;   :desc "open link" :m "o" #'org-agenda-open-link
 ;;   :desc "show entry text" :m "e" #'org-agenda-entry-text-mode
 ;;   :desc "save all" :m "S" #'org-save-all-org-buffers
 ;;   :desc "capture" :m "a" #'(lambda () (interactive) (org-capture nil "c"))
 ;;   :desc "heading project" :m "hp" #'(lambda () (interactive) (org-capture nil "p"))
 ;;   :desc "heading note" :m "hn" #'(lambda () (interactive) (org-capture nil "n"))
 ;;   :desc "clock in" :m "ci" #'org-agenda-clock-in
 ;;   :desc "clock out" :m "co" #'org-agenda-clock-out
 ;;   :desc "clock exit" :m "cx" #'org-agenda-clock-cancel
 ;;   :desc "clock resume" :m "cr" #'org-agenda-clock-in-last
 ;;   :desc "clock goto" :m "cg" #'org-agenda-clock-goto
 ;;   :desc "day view" :m "vd" #'org-agenda-day-view
 ;;   :desc "week view" :m "vw" #'org-agenda-week-view
 ;;   :desc "fortnight view" :m "vf" #'org-agenda-fortnight-view
 ;;   :desc "month view" :m "vm" #'org-agenda-month-view
 ;;   :desc "later" :m "vn" #'org-agenda-later
 ;;   :desc "earlier" :m "ve" #'org-agenda-earlier
 ;;   :desc "today" :m "vt" #'org-agenda-goto-today
 ;;   )

   :map org-capture-mode-map
   :localleader
   :desc "kill buffer" :n "k" #'org-capture-kill
   :desc "refile" :n "w" #'org-capture-refile
   :desc "save and close" :n "c" #'(lambda () (interactive) (progn (org-capture-finalize) (org-agenda-redo)))
   ;; :desc "insert link" :n "l" #'org-insert-link

 (:after deft
   :map deft-mode-map
   :localleader
   :desc "delete file" :n "d" #'deft-delete-file
   :desc "new file" :n "n" #'deft-new-file-named
   :desc "quit" :n "q" #'quit-window
   :desc "rename file" :n "r" #'deft-rename-file
   :desc "archive file" :n "a" #'deft-archive-file
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
   :desc "notes (deft)" :nv "n" #'deft
   :desc "clocktables" :nv "c" #'(lambda () (interactive) (progn (find-file "~/org/clocktables.org") (org-update-all-dblocks)))
   (:desc "links" :prefix "l"
     :desc "store" :nv "s" #'org-store-link
     :desc "insert" :nv "i" #'org-insert-link)
   )
 )
