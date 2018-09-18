;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Source Code Pro" :size 15))
(setq doom-theme 'doom-one)

(setq evil-want-integration nil)
;;(after! org
;;  (set-face-attribute 'org-level-1 nil :height 1.0))

;;(eval-after-load "org"
;;  (set-face-attribute 'org-level-1 nil :height 1.0))
;;(add-hook 'org-mode-hook (set-face-attribute 'org-level-1 nil :height 1.0))

;; (map! "C-;" 'comcent-line)
;; (map! "C-s" 'save-buffer)

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)

(epa-file-enable)

;; (require 'realgud)
(after! realgud
  (setq realgud:pdb-command-name "python -m pdb"))
;; # M-x load-library RET realgud RET
;; # M-x realgud:pdb
;; # python -m venv venv
;; # .gitignore venv
;; # source bin/activate
;; # pip freeze > requirements.txt
;; # project-name
;; # |--> venv/
;; # |--> requirements.txt
;; # |--> src/
;; # |--> latex/
;; # |--> ...
;;
;;TODO
;;keybindings for indent-region
;;write own code for colemak mapping
;;fix keybinding for redo

(load! "+org-agenda")
(load! "+org-drill")
(load! "+ui")
(load! "+keybinds")
