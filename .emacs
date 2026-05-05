;;; package --- Summary
;;; Commentary:
;;; Code:
;; Author : DEV-SDHNT

(setq inhibit-startup-screen t)        
(setq backup-directory-alist '(("."."~/.saves")))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(dolist (event '(mouse-1 mouse-2 mouse-3
                         down-mouse-1 down-mouse-2 down-mouse-3
                         drag-mouse-1 drag-mouse-2 drag-mouse-3
                         double-mouse-1 double-mouse-2 double-mouse-3
                         triple-mouse-1 triple-mouse-2 triple-mouse-3
                         wheel-down wheel-up
                         mouse-4 mouse-5))
  (global-unset-key (vector event)))


;(setq scroll-conservatively 501)
(setq scroll-step 1)
(setq scroll-margin 10)
;(setq scroll-preserve-screen-position t)

(require 'midnight)
;;;Set line no. to relative------------|
(global-display-line-numbers-mode t)
(when (boundp 'display-line-numbers-type)
  (setq display-line-numbers-type 'relative))
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-width 1)
(setq display-line-numbers-offset 13)
(setq display-line-numbers-grow-only t)
(setq display-line-numbers-width-start t)

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

;;; projectile mode

(use-package projectile
  :init
  (projectile-mode +1))

;; chatgpt
;(setq gptel-api-key "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")


(defalias 'list-buffers 'ivy-switch-buffer)

;; ;Doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modelines-minor-modes t)
  (doom-modeline-lsp-icon -1)
  (doom-modeline-height 27)
  (doom-modeline-column t))

(setq column-number-mode t)

;; Ligature
(use-package ligature
  :config
  ;; Enable ligatures in all programming modes
  (ligature-set-ligatures 'prog-mode
    '("..=" ".." "__" "!=" "=>" "->" "<-" "<->" ">>" "<<" "##"
      "&&" "||" "++" "--" ":::" "|=>" "::" ";;" "??" "**" "//"
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

;; Org mode

;(setq org-preview-latex-default-process 'dvisvgm)
;(setq org-format-latex-options
 ;     (plist-put org-format-latex-options :scale 2.0))

(use-package org
  :config
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 2.0))
  (setq org-startup-folded t))


;; JSX mode

;(dolist (ext '("\\.js\\'" "\\.jsx\\'" "\\.ts\\'" "\\.tsx\\'"))
;  (add-to-list 'auto-mode-alist `(,ext . js-jsx-mode)))
;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-jsx-mode))

;; (use-package company-lsp
;;   :after (company lsp-mode)
;;   :config
;;   (push 'company-lsp company-backends))

;; ;; LSP core (minimal)
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
        lsp-eldoc-enable-hover nil
        lsp-references-exclude-definition nil
        lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil
        lsp-ui-peek-enable nil
        lsp-enable-snippet t
        lsp-completion-enable t
        )
  :config
  (setq lsp-idle-delay 0.1
        lsp-log-io nil))

(setq lsp-rust-analyzer-cargo-extra-env '(("RUST_BACKTRACE" . "1"))
      lsp-auto-guess-root t)

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


;;;Set theme & view settings------------|
(set-face-attribute 'default nil :font "JetBrains Mono" :height 140)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-safe-themes t)
(load-theme 'jmm t)
(set-face-attribute 'line-number nil :inherit 'default)
(set-face-attribute 'line-number-current-line nil :inherit 'default )
;(set-window-margins nil 1 0)
(setq face-remapping-alist nil)

(load-file "~/.emacs.d/keybinding/kbd.el")
(load-file "~/.emacs.d/c3-mode.el")
(add-hook 'c3-mode-hook 'company-mode)
(add-hook 'c3-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;(add-hook 'prog-mode-hook 'copilot-mode)
(setq tab-width 1)
(setq-default indent-tabs-mode nil)

(set-frame-parameter nil 'alpha-background 85)

(show-paren-mode 1)

(setq-default cursor-type 'hbar)
(setq blink-cursor-interval 0.07)

;(set-fringe-mode 1)
;(set-face-attribute 'fringe nil :background "black" :foreground "red")

(setq-default truncate-lines t)

(electric-pair-mode 1)
(electric-spacing-mode 1)

(setq treesit-font-lock-level 4)
(add-hook 'c-ts-mode-hook
	  (lambda ()
	    (treesit-major-mode-setup)))
(symbol-function 'c-ts-mode)



(provide '.emacs)
(put 'scroll-left 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ac-c-headers ac-capf ac-clang ac-emmet ac-html ac-html-angular
                  ac-html-csswatcher ac-js2 ac-php ace-jump-buffer
                  alect-themes all-the-icons-completion
                  all-the-icons-dired asm-blox auctex-latexmk
                  autothemer avy-flycheck ayu-theme base32 buffer-move
                  cargo catppuccin-theme chatgpt-shell chess cl-libify
                  company-anaconda company-c-headers company-emoji
                  company-go company-inf-ruby company-math company-php
                  company-web competitive-programming-snippets
                  composer copilot counsel-edit-mode cpp-auto-include
                  cpputils-cmake csv-mode dart-server dash-docs
                  devdocs dirtree dirvish django-mode django-snippets
                  doom-modeline doric-themes drag-stuff dream-theme
                  electric-operator electric-spacing eslint-rc evil
                  evil-mc evil-numbers evil-opener evil-rails
                  ewal-doom-themes ewal-spacemacs-themes flex-autopair
                  flutter-l10n-flycheck flycheck-golangci-lint
                  flycheck-rust flymake-golangci flymake-nasm
                  font-lock-studio fontawesome fontify-face format-all
                  fuzzy-finder gdscript-mode go-autocomplete
                  go-complete go-errcheck go-expr-completion
                  go-playground go-snippets google-c-style gptel
                  gradle-mode graphviz-dot-mode gruber-darker-theme
                  helm-emmet highlight-indent-guides
                  highlight-indentation highlight-operators
                  highlight-parentheses i3bar ido-grid-mode iedit
                  indent-guide js-auto-format-mode
                  js-react-redux-yasnippets json-mode kanagawa-themes
                  kotlin-mode latex-preview-pane leetcode ligature
                  linum-relative lsp-dart lsp-ivy lsp-java
                  lsp-python-ms lsp-tailwindcss lsp-ui lua-mode
                  magit-section material-theme mc-extras mini-modeline
                  minimal-theme modern-cpp-font-lock modus-themes
                  monkeytype mood-line morgentau-theme nasm-mode
                  neotree nerd-icons-completion nerd-icons-dired
                  nord-theme npm-mode orderless orgnav
                  pdf-view-restore perl-doc powerline prescient
                  prettier project projectile-codesearch
                  projectile-git-autofetch projectile-rails
                  projectile-ripgrep projectile-sift
                  projectile-speedbar projectile-variable python-black
                  racer rainbow-delimiters ranger react-snippets
                  real-mono-themes regex-dsl regex-tool restclient
                  rjsx-mode ruby-hash-syntax ruby-tools run-command
                  run-command-recipes rust-auto-use rust-playground
                  simple-modeline sixcolors-theme smex snazzy-theme
                  spacegray-theme sublime-themes svelte-mode
                  svg-mode-line-themes svg-tag-mode svgo
                  transient-cycles transient-extras treemacs-tab-bar
                  tron-legacy-theme tsc typescript-mode use-package
                  vterm web-beautify web-mode with-editor xenops
                  xterm-color yasnippet-capf
                  yasnippet-classic-snippets yasnippet-snippets
                  zeal-at-point)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(put 'upcase-region 'disabled nil)
