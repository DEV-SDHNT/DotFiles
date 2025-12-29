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
    '("==" "..=" ".." "__" "!=" "===" "!==" "<=" ">=" "=>" "->" "<-" "<->"
      "&&" "||" "++" "--" ":::" "|=>" "::" ";;" "??" "**"
      "//=" "||-" "-|"))
  (global-ligature-mode t))


;;iedit -mode
(use-package
  iedit
  :ensure t)

;(setq completion-styles '(basic substring))

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


;; LSP core (minimal)
;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp
;;   :custom
;;   ;; reduce overhead
;;   (lsp-enable-symbol-highlighting nil)
;;   (lsp-enable-on-type-formatting nil)
;;   (lsp-enable-indentation nil)
;;   (lsp-headerline-breadcrumb-enable nil)
;;   (lsp-modeline-code-actions-enable nil)
;;   (lsp-modeline-diagnostics-enable nil)
;;   (lsp-signature-auto-activate nil)
;;   (lsp-completion-enable t)
;;   (lsp-diagnostics-provider :auto)
;;   (lsp-idle-delay 0.5))

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


;;;Set theme & view settings------------|
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-safe-themes t)
(load-theme 'bw t)

(load-file "~/.emacs.d/keybinding/kbd.el")
(load-file "~/.emacs.d/c3-mode.el")
(add-hook 'c3-mode-hook 'company-mode)
(add-hook 'c3-mode-hook 'flycheck-mode)

(global-font-lock-mode t)

(setq tab-width 2)
(setq-default indent-tabs-mode nil)

(set-frame-parameter nil 'alpha-background '80)

(show-paren-mode 1)

(setq-default cursor-type 'hbar)
(setq blink-cursor-interval 0.07)

(set-fringe-mode 1)
(set-face-attribute 'fringe nil :background "black" :foreground "red")

(setq-default truncate-lines t)

(electric-pair-mode 1)
(electric-spacing-mode 1)


(provide '.emacs)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(racer yasnippet-snippets yasnippet-classic-snippets yasnippet-capf xenops web-mode vterm use-package typescript-mode treesit-auto treemacs-tab-bar tree-sitter-langs transient-extras transient-cycles svg-tag-mode svg-mode-line-themes svelte-mode smex rust-playground rust-auto-use ruby-tools ruby-hash-syntax rjsx-mode restclient regex-tool regex-dsl react-snippets ranger rainbow-delimiters python-black prettier prescient powerline php-mode perl-doc pdf-view-restore orgnav npm-mode nerd-icons-dired nerd-icons-completion neotree nasm-mode multiple-cursors monkeytype modern-cpp-font-lock minimal-theme lua-mode lsp-ui lsp-tailwindcss lsp-python-ms lsp-java lsp-ivy lsp-dart ligature leetcode latex-preview-pane kotlin-mode json-mode js-react-redux-yasnippets js-auto-format-mode indent-guide iedit ido-grid-mode highlight-parentheses highlight-operators highlight-indentation highlight-indent-guides helm-emmet gruber-darker-theme gradle-mode gptel google-c-style go-snippets go-playground go-expr-completion go-errcheck go-complete go-autocomplete gdscript-mode format-all fontify-face fontawesome flymake-nasm flymake-golangci flycheck-rust flycheck-golangci-lint flutter-l10n-flycheck flex-autopair eslint-rc electric-spacing electric-operator drag-stuff doom-modeline django-snippets django-mode dirvish dirtree devdocs dart-server cpputils-cmake cpp-auto-include counsel-edit-mode competitive-programming-snippets company-math company-inf-ruby company-go company-anaconda chatgpt-shell buffer-move avy-flycheck autothemer auctex-latexmk asm-blox all-the-icons-dired all-the-icons-completion ace-jump-buffer ac-html)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
