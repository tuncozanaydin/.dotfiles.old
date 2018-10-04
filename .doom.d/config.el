;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Source Code Pro" :size 15))
(setq doom-theme 'doom-one)
;; Global settings (defaults)
(after! doom-themes
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
)
(defun my-theme-customizations ()
  (set-face-italic 'font-lock-comment-face t)) ; will make comments italicized

(add-hook 'doom-load-theme-hook #'my-theme-customizations)

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
;; # M-x pyvenv-acvitate (venv)
;; # pylint --generate-rcfile > .pylintrc
;; # project-name
;; # |--> venv/
;; # |--> requirements.txt
;; # |--> src/
;; # |--> latex/
;; # |--> ...
;; # python -m unittest -v test.py
;; # venv folder can be large > 1GB, should probably put to storage and symlink
;;
;;TODO
;;keybindings for indent-region
;;write own code for colemak mapping
;;fix keybinding for redo

(load! "+org-agenda")
(load! "+org-drill")
(load! "+ui")
(load! "+keybinds")
