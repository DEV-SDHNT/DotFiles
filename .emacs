;;; package --- Summary
;;; Commentary:
;;; Code:
;; Author : DEV-SDHNT
(setq inhibit-startup-screen t)        
(setq backup-directory-alist '(("."."~/.saves")))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;(setq scroll-conservatively 501)
(setq scroll-step 1)
(setq scroll-margin 10)
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

;;;Refresh-contents---------------------|
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package eldoc
  :ensure t)

(defalias 'list-buffers 'ivy-switch-buffer)

;Doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modelines-minor-modes t)
  (doom-modeline-lsp-icon t)
  (doom-modeline-height 27)
  (doom-modeline-column t))


(setq column-number-mode t)

;; Ligature
(use-package ligature
  :config
  ;; Enable ligatures in all programming modes
  (ligature-set-ligatures 'prog-mode
    '("..=" ".." "__" "!=" "=>" "->" "<-" "<->"
      "&&" "||" "++" "--" ":::" "|=>" "::" ";;" "??" "**"
      "//=" "||-" "-|" "()"))
  (global-ligature-mode t))


;;iedit -mode
(use-package
  iedit
  :ensure t)

;; Company (completion only)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1   ;; start completing after 1 char
        company-idle-delay 0.1             ;; quick popup
        company-show-numbers t             ;; M-1, M-2, etc
        company-tooltip-align-annotations t
        company-selection-wrap-around t))

;; Assembly mode
(use-package nasm-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))

;; (use-package company-lsp
;;   :after (company lsp-mode)
;;   :config
;;   (push 'company-lsp company-backends))

;; LSP core (minimal)
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-enable-symbol-highlighting nil
        lsp-enable-on-type-formatting nil
        lsp-enable-indentation nil
        lsp-headerline-breadcrumb-enable nil
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-signature-auto-activate nil
        lsp-completion-enable t
        lsp-diagnostics-provider :auto
        lsp-rust-analyzer-cargo-watch-command "clippy")
  :config
  (setq lsp-idle-delay 0.5
        lsp-log-io nil))

;; Debugging
(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :config
  (setq dap-auto-configure-features '(sessions locals controls tooltip)))

;; yasnippet
(use-package yasnippet
  :ensure t
  :hook (prog-mode . yas-minor-mode))

;;;Windows Divider lines
(window-divider-mode 1)
(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)


;;;Highlighters ------------------------|
(use-package highlight-operators
  :ensure t
  :hook (prog-mode . highlight-operators-mode))

(set-face-attribute 'default nil :font "JetBrains Mono" :height 130)

;;;Set theme & view settings------------|


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-safe-themes t)
(load-theme 'jmm t)

(set-face-attribute 'line-number nil :inherit 'default)
(set-face-attribute 'line-number-current-line nil :inherit 'default)


(load-file "~/.emacs.d/keybinding/kbd.el")
(load-file "~/.emacs.d/c3-mode.el")
(add-hook 'c3-mode-hook 'company-mode)
(add-hook 'c3-mode-hook 'flycheck-mode)

(global-font-lock-mode t)

(setq tab-width 2)
(setq-default indent-tabs-mode nil)

(set-frame-parameter nil 'alpha-background 90)

(show-paren-mode 1)

(setq-default cursor-type 'hbar)
(setq blink-cursor-interval 0.07)

(set-fringe-mode 1)
(set-face-attribute 'fringe nil :background "black" :foreground "red")

(setq-default truncate-lines t)

(electric-pair-mode 1)
(electric-spacing-mode 1)


(provide '.emacs)
(put 'scroll-left 'disabled nil)
