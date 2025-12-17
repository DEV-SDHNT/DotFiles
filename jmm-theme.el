;;; custom-theme.el --- custom-theme

;;; COPYRIGHT (C) 2024 by dev-sdhnt

;; Author: dev-sdhnt
;; Version: 0.01

;;; Commentary:

;;; Code:
;; THEME NAME :: JungleMeinMangal---------------------------------|

(deftheme jmm
  "jmm")

(add-hook 'text-scale-mode-hook
          (lambda ()
            (setq-local display-line-numbers-with-start nil)
            (set-face-attribute 'line-number nil :height (truncate (* 140 (expt text-scale-mode-step text-scale-mode-amount))))
            (set-face-attribute 'line-number-current-line nil :height (truncate (* 140 (expt text-scale-mode-step text-scale-mode-amount))))))


(custom-theme-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 'jmm
 '(default ((t (:background "#080808" :foreground "#2d2" :font "Jetbrains Mono" :height 160))))
 '(company-tooltip ((t (:background "#111" :foreground "#666" :box (:line-width -1 :color "#010101")))))
 '(company-tooltip-selection ((t (:background "#111" :foreground "#3d3" :box (:line-width -1 :color "#353")))))
 '(cursor ((t (:background "#f22"))))
 '(font-lock-builtin-face ((t (:foreground "#fa3"))))
 '(font-lock-comment-face ((t (:foreground "#888"))))
 '(font-lock-constant-face ((t (:foreground "#fd4"))))
 '(font-lock-doc-face ((t (:foreground "#888"))))
 '(font-lock-function-call-face ((t (:foreground "#ffff00"))))
 '(font-lock-function-name-face ((t (:foreground "#eedd00"))))
 '(font-lock-keyword-face ((t (:foreground "#2b5" :slant italic))))
 '(font-lock-negation-char-face ((t (:foreground "#ddd"))))
 '(font-lock-number-face ((t (:foreground "#fff" :background "#0d0d0d"))))
 '(font-lock-preprocessor-face ((t (:foreground "#e30"))))
 '(font-lock-string-face ((t (:foreground "#22ccdd" :slant italic))))
 '(font-lock-type-face ((t (:foreground "#0e0" :underline t))))
 '(font-lock-variable-name-face ((t (:foreground "#a8ff60"))))
 '(font-lock-warning-face ((t (:background "gray20" :weight bold))))
 '(fringe ((t (:foreground "red" :background "#111"))))
 '(highlight-operators-face ((t (:foreground "#d23"))))
 '(highlight-indent-guides-odd-face ((t (:foreground "#FFF" :background "#0F0"))))
 '(line-number ((t (:foreground "#252"))))
 '(line-number-current-line ((t (:foreground "#1e1" :background "#000"))))
 '(line-number-error ((t (:foreground "red"))))
 '(line-number-warning ((t (:foreground "yellow"))))
 '(mode-line ((t (:background "#0A0A0A" :foreground "#0c0" :height 130))))
 '(region ((t (:background "#023" :box (:line-width -1 :color "#0cf")))))
 '(show-paren-match ((t (:box (:color "#0f0" :line-width -1)))))
 '(show-paren-mismatch ((t (:background "red" :foreground "black" :weight bold))))
 '(tooltip ((t (:foreground "green"))))
 '(window-divider ((t (:foreground "#0A0")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jmm)

;;;jmm-theme.el ends here
