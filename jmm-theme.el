;;; custom-theme.el --- custom-theme

;;; COPYRIGHT (C) 2024 by dev-sdhnt

;; Author: dev-sdhnt
;; Version: 0.01

;;; Commentary:

;;; Code:
;; THEME NAME :: JungleMeinMangal---------------------------------|

(deftheme jmm
  "jmm")

(custom-theme-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 'jmm
 '(default ((t (:background "#000" :foreground "#0e0" ))))
 '(company-tooltip ((t (:background "#090909" :foreground "#666" ))))
 '(company-tooltip-selection ((t (:background "#000" :foreground "#3d3" :box (:line-width -1 :color "#353")))))
 '(cursor ((t (:background "#f22"))))
 '(font-lock-doc-face ((t (:foreground "#888"))))
 '(font-lock-builtin-face ((t (:foreground "#4f4"))))
 '(font-lock-comment-face ((t (:foreground "#555"))))
 '(font-lock-constant-face ((t (:foreground "#fd4"))))
 '(font-lock-preprocessor-face ((t (:foreground "#e83"))))
 '(font-lock-negation-char-face ((t (:foreground "#ddd"))))
 '(font-lock-function-call-face ((t (:foreground "#ccee22"))))
 '(font-lock-function-name-face ((t (:foreground "#ffff00"))))
 '(font-lock-keyword-face ((t (:foreground "#2b5" :slant italic))))
 '(font-lock-string-face ((t (:foreground "#22aacc" :slant italic))))
 '(font-lock-number-face ((t (:foreground "#fff" :background "#0d0d0d"))))
 '(font-lock-type-face ((t (:foreground "#0a0" :underline t))))
 '(font-lock-variable-name-face ((t (:foreground "#a8ff60"))))
 '(font-lock-warning-face ((t (:background "gray20" :weight bold))))
 '(fringe ((t (:foreground "red" :background "#030303"))))
 '(highlight-operators-face ((t (:foreground "#d23"))))
 '(highlight-indent-guides-odd-face ((t (:foreground "#FFF" :background "#0F0"))))
 '(line-number ((t (:foreground "#252" :align-to "left" :inherit default))))
 '(line-number-current-line ((t (:foreground "#1e1" :background "#000" :inherit default))))
 '(line-number-error ((t (:foreground "red"))))
 '(line-number-warning ((t (:foreground "yellow"))))
 '(mode-line ((t (:background "#000" :foreground "#0c0"  :box (:line-width -1 :color "#0c0")))))
 '(region ((t (:background "#023" :box (:line-width -1 :color "#058") ))))
 '(show-paren-match ((t (:box (:color "#095" :line-width -1)))))
 '(show-paren-mismatch ((t (:box (:color "#F00" :line-width -1) :foreground "#f00" ))))
 '(tooltip ((t (:foreground "green"))))
 '(whitespace-space ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-space-before-tab ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-space-after-tab ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-tab ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-indentation ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-trailing ((t (:foreground "#777" :background "transparent"))))
 '(window-divider ((t (:foreground "#0A0"))))
 '(flymake-error ((t (:background "#600" :box (:line-width -1 :color "#900")))))
 '(flymake-note ((t (:background "#042" :box (:line-width -1 :color "#084")))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#22c55e"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#84cc16"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#eab308"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#f97316"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#ef4444"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#f43f53"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#3b82f6"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#06b6d4"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#10b981")))))

;(((((((((My Color scheme)))))))))
;#00ff00
;#00aa00
;#22aa44
;#33aa66
;#66ee44
;#449944
;#34ee66
;#9Cdd00
;#00ff00

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))



(provide-theme 'jmm)
;;;jmm-theme.el ends he
