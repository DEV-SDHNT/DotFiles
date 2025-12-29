;;; custom-theme.el --- custom-theme

;;; COPYRIGHT (C) 2024 by dev-sdhnt

;; Author: dev-sdhnt
;; Version: 0.01

;;; Commentary:

;;; Code:
;; THEME NAME :: Black & White---------------------------------|

(deftheme bw
  "bw")

(custom-theme-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 'bw
 '(default ((t (:background "#080808" :foreground "#ddd" :font "Jetbrains Mono" :height 160))))
 '(company-tooltip ((t (:background "#111" :foreground "#333" ))))
 '(company-tooltip-selection ((t (:background "#111" :foreground "#777" ))))
 '(cursor ((t (:background "#f43"))))
 '(font-lock-builtin-face ((t (:foreground "#cfc"))))
 '(font-lock-comment-face ((t (:foreground "#555"))))
 '(font-lock-constant-face ((t (:foreground "#dcc"))))
 '(font-lock-doc-face ((t (:foreground "#888"))))
 '(font-lock-function-call-face ((t (:foreground "#ede"))))
 '(font-lock-function-name-face ((t (:foreground "#eed"))))
 '(font-lock-keyword-face ((t (:foreground "#aaa" :slant italic))))
 '(font-lock-negation-char-face ((t (:foreground "#ddd"))))
 '(font-lock-number-face ((t (:foreground "#fff" :background "#0d0d0d"))))
 '(font-lock-preprocessor-face ((t (:foreground "#aaa"))))
 '(font-lock-string-face ((t (:foreground "#999" :slant italic))))
 '(font-lock-type-face ((t (:foreground "#aaa" :underline t))))
 '(font-lock-variable-name-face ((t (:foreground "#eee"))))
 '(font-lock-warning-face ((t (:background "gray20" :weight bold))))
 '(fringe ((t (:foreground "red" :background "#111"))))
 '(highlight-operators-face ((t (:foreground "#aaa"))))
 '(highlight-indent-guides-odd-face ((t (:foreground "#FFF" :background "#0F0"))))
 '(line-number ((t (:foreground "#444" :inherit default))))
 '(line-number-current-line ((t (:foreground "#fff" :background "#000" :inherit default))))
 '(line-number-error ((t (:foreground "red"))))
 '(line-number-warning ((t (:foreground "yellow"))))
 '(mode-line ((t (:background "#222" :foreground "#ccc" :height 130))))
 '(region ((t (:background "#023" :height 1.05 ))))
 '(show-paren-match ((t (:box (:color "#aaa" :line-width -1)))))
 '(show-paren-mismatch ((t (:background "red" :foreground "black" :weight bold))))
 '(tooltip ((t (:foreground "white"))))
 '(whitespace-space ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-space-before-tab ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-space-after-tab ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-tab ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-indentation ((t (:foreground "#666" :background "transparent"))))
 '(whitespace-trailing ((t (:foreground "#777" :background "transparent"))))
 '(window-divider ((t (:foreground "#222")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'bw)

;;;bw-theme.el ends here
