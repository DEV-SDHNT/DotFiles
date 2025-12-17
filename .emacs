;;; package --- Summary
;;; Commentary:
;;; Code:
;;; Author : DEV-SDHNT

(setq inhibit-startup-screen t)
(setq backup-directory-alist '(("."."~/.saves")))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;(setq scroll-conservatively 501)
(setq scroll-margin 10)
(setq scroll-step 1)
;(setq scroll-preserve-screen-position t)

(require 'midnight)
;;;Set line no. to relative------------|
(global-display-line-numbers-mode 1)
(when (boundp 'display-line-numbers-type)
(setq display-line-numbers-type 'relative))

;;;Package settings -------------------|
(require 'package)
(add-to-list 'package-archives '("melpa"."https://melpa.org/packages/") t)
(package-initialize)

(defalias 'list-buffers 'ivy-switch-buffer)

;Doom-modeline
(setq doom-modelines-minor-modes t)
(setq doom-modeline-lsp-icon t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))


;; Ligature
(use-package ligature
  :config
  ;; Enable ligatures in all programming modes
  (ligature-set-ligatures 'prog-mode
    '("==" "!=" "<=" ">=" "=>" "->" "<-" "<->"
      "&&" "||" "++" "--" "::" ";;" "***"))
  (global-ligature-mode t))


;;iedit -mode
(use-package
  iedit
  :ensure t)

;;;Refresh-contents--------------------|
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))
(setq company-mode t)


;;;Windows Divider lines
(window-divider-mode 1)
(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)


;;;Highlighters ------------------------|
(use-package highlight-operators
  :ensure t
  :hook (prog-mode . highlight-operators-mode))


;;;Set theme & view settings------------|
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-safe-themes t)
(load-theme 'jmm t)

(load-file "~/.emacs.d/keybinding/kbd.el")
(global-font-lock-mode t)

(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-style
      '(face spaces tabs  space-mark))

(require 'ido)
(ido-mode 1)
(setq ido-everywhere t)
(setq ligature-mode t)
(set-face-attribute 'whitespace-space nil :foreground "#333")

(set-frame-parameter nil 'alpha-background '90)

(show-paren-mode 1)

(setq-default cursor-type 'hbar)
(setq blink-cursor-interval 0.07)

(set-fringe-mode 1)
(set-face-attribute 'fringe nil :background "black" :foreground "red")

(setq-default truncate-lines t)

(electric-pair-mode 1)
(electric-spacing-mode 1)


(provide '.emacs)
