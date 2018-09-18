;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Source Code Pro" :size 15))
(setq doom-theme 'doom-one)

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

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
