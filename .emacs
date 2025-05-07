;;; package --- Summary
;;; Commentary:
;;; Code:
;;; Author : Siddhant

(setq inhibit-startup-screen t)
(setq backup-directory-alist '(("."."~/.saves")))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;;Set line no. to relative------------|
(global-display-line-numbers-mode 1)
(when (boundp 'display-line-numbers-type)
(setq display-line-numbers-type 'relative))

;;;Package settings -------------------|
(require 'package)
(add-to-list 'package-archives '("melpa"."https://melpa.org/packages/") t)
(package-initialize)

;;;;;----------------------Keybindings-------------

;;;terminal----------------------------|
(global-set-key (kbd "C-`") 'eshell)

;;;Reload config----------
(global-set-key (kbd "C-x C-;") 'eval-buffer)

;;;Multiple-Cursors--------------------|
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-?") 'mc/mark-all-like-this)

;;Emmet-Mode --------------------------|
(emmet-mode 1)

;;Yasnippet -Mode ---------------------|
(yas-global-mode 1)
;(add-hook 'yas-minor-mode-hook (lambda ()
;				(yas-activate-extra-mode 'fundamental-mode)))
;(yasnippet-capf 1)

;;iedit -mode
(use-package
  iedit
  :ensure)
;;;Refresh-contents--------------------|
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;(use-package magit :ensure t)
;(use-package ivy :ensure t :config (ivy-mode 1))
;(setq history-length 25)
;(setq savehist-mode
;(use-package helm :ensure t :init (helm-mode 1)))

;;;Windows Divider lines
(window-divider-mode 1)
(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)
;;Format-all
;(use-package format-all
;  :ensure t
;  :hook (prog-mode . format-all-mode))

;;;Goto-line----------------------------|
(defun goto-relative-line (n)
  "Goto line N."
  (interactive "nLine no:")
  (forward-line n))
(global-set-key (kbd "M-g g") 'goto-relative-line)

;;;Move-Lines---------------------------|
(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

;;;Font size --------------------------|
(global-set-key (kbd "C-=") 'text-scale-increase )
(global-set-key (kbd "C--") 'text-scale-decrease )
(add-hook 'after-setting-font-hook
 (lambda ()
 (set-face-attribute 'line-number nil :height 1.0)
 (set-face-attribute 'line-number-current-line nil :height 1.0)))
;;;Highlighters ------------------------|
(use-package highlight-operators
  :ensure t
  :hook (prog-mode . highlight-operators-mode))
'(highlight-operators-face ((t (:foreground "blue" :box t))))

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'bitmap))

;;;Set theme & view settings------------|
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-safe-themes t)
;(load-theme 'retro-green t)
(global-font-lock-mode t)

;(load-theme 'dark-font-lock)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000" :foreground "#0c0" :font "fira code"))))
 '(company-tooltip ((t (:background "000" :foreground "#0a0" :box (:line-width -1 :color "#070")))))
 '(company-tooltip-selection ((t (:background "#000" :foreground "green"))))
 '(cursor ((t (:background "#f00" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#ddd"))))
 '(font-lock-comment-face ((t (:foreground "#444"))))
 '(font-lock-constant-face ((t (:foreground "#bd0"))))
 '(font-lock-function-name-face ((t (:foreground "#5d5" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#009933"))))
 '(font-lock-preprocessor-face ((t (:foreground "#f00"))))
 '(font-lock-string-face ((t (:foreground "#09d"))))
 '(font-lock-variable-name-face ((t (:foreground "#0f0" :weight normal))))
 '(font-lock-warning-face ((t (:background "gray20" :weight bold))))
 '(highlight-indent-guides-character-face ((t (:foreground "white" :background "white"))))
 '(highlight-operators-face ((t (:foreground "#c22"))))
 '(line-number ((t (:foreground "#070" :background "#000" ))))
 '(line-number-current-line ((t (:foreground "#f50" :background "#000" :weight bold))))
 '(mode-line ((t (:background "#0c100c" :foreground "#0f0"))))
 '(paren-showing-faces ((t (:background "darkred"))))
 '(region ((t (:background "#030" :box (:line-width -1 :color "green")))))
 '(show-paren-match ((t (:box (:color "#0f0" :line-width -1)))))
 '(show-paren-mismatch ((t (:background "red" :foreground "white" :weight bold))))
 '(tooltip ((t (:foreground "green"))))
 '(window-divider ((t (:foreground "black")))))
(setq-default tab-width 6)
(setq-default indent-tabs-mode t)

(show-paren-mode 1)
(setq-default cursor-type 'hbar)
(setq blink-cursor-interval 0.06)
(set-fringe-mode 2 )
(set-face-attribute 'fringe nil :background "black" :foreground "red")
(setq-default truncate-lines t)

;;; parenthesis matcher ::
(electric-pair-mode 1)
;(electric-indent-mode 1)
;(electric-spacing-mode 0)

;(require 'autopair)
;(autopair-global-mode)


(require 'company)
(global-company-mode 1)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)
(global-set-key (kbd "") #'company-complete)


(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'c-mode-hook 'clang-format-buffer)
(add-hook 'c++-mode-hook 'clang-format-buffer)


(provide '.emacs)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(company-web company-box php-mode abyss-theme gruber-darker-theme typescript-mode js-react-redux-yasnippets django-mode django-snippets yasnippet-capf yasnippet-classic-snippets emmet-mode yasnippet-snippets yasnippet format-all electric-operator electric-spacing iedit multiple-cursors parinfer-rust-mode flycheck-rust rust-mode tabbar session pod-mode muttrc-mode mutt-alias markdown-mode initsplit htmlize graphviz-dot-mode folding eproject diminish csv-mode color-theme-modern cmake-mode browse-kill-ring boxquote bm bar-cursor apache-mode vterm use-package treemacs-tab-bar ruby-tools ruby-hash-syntax orgnav nasm-mode modern-cpp-font-lock ivy highlight-parentheses highlight-operators highlight-indent-guides flymake-nasm flutter-l10n-flycheck flex-autopair drag-stuff doom-themes dirtree dart-server dart-mode cpp-auto-include company-inf-ruby company-anaconda avy-flycheck auto-complete)))
;;;ends here

