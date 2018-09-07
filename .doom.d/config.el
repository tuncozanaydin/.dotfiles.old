;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Source Code Pro" :size 15))
(setq doom-theme 'doom-one)

;;(after! org
;;  (set-face-attribute 'org-level-1 nil :height 1.0))

;;(eval-after-load "org"
;;  (set-face-attribute 'org-level-1 nil :height 1.0))
;;(add-hook 'org-mode-hook (set-face-attribute 'org-level-1 nil :height 1.0))

(map! "C-;" 'comment-line)
(map! "C-s" 'save-buffer)

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

(epa-file-enable)

(load! "+org-agenda")
(load! "+org-drill")
(load! "+ui")
(load! "+keybinds")
