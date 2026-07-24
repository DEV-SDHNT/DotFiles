;;; package --- Summary
;;; Commentary:
;;; Code:
;;; Author :DEV-SDHNT

;;;;;----------------------Keybindings-------------
(defalias 'list-buffers 'ivy-switch-buffer)

(setq ivy-ignore-buffers '("^\\*.*\\*$"))
(setq ace-jump-buffer--ignore-buffers '("^\\*.*\\*$"))

(defun kill-star-buffers ()
  "Kill the star buffers"
  (interactive)
  (dolist (buf (buffer-list))
    (let ((name (buffer-name buf)))
      (when (and (string-match-p "^\\*.*\\*$" name)
		 (not (string-equal "*scratch*" name))
		      (kill-buffer buf))))))

(global-set-key (kbd "C-c C-k")  'kill-star-buffers)

;;; Enlarge and shrink emacs windows.
(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<up>") 'enlarge-window)
(global-set-key (kbd "M-s-<down>") 'shrink-window)

;;; Move emacs windows.
(global-set-key (kbd "C-s-<right>") 'windmove-right)
(global-set-key (kbd "C-s-<left>") 'windmove-left)
(global-set-key (kbd "C-s-<up>") 'windmove-up)
(global-set-key (kbd "C-s-<down>") 'windmove-down)

;;; Shift buffers.
(global-set-key (kbd "M-C-s-<right>") 'buf-move-right)
(global-set-key (kbd "M-C-s-<left>") 'buf-move-left)
(global-set-key (kbd "M-C-s-<up>") 'buf-move-up)
(global-set-key (kbd "M-C-s-<down>") 'buf-move-down)

;;; Drag words, lines
(global-set-key (kbd "M-<up>") 'drag-stuff-up)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)
(global-set-key (kbd "M-<left>") 'drag-stuff-left)
(global-set-key (kbd "M-<right>") 'drag-stuff-right)

(defun swap-windows () (interactive)
       (let ((buf (current-buffer)))
	 (other-window 1)
	 (switch-to-buffer-other-window (current-buffer))
	 (other-window 1)
	 (switch-to-buffer buf)))

(global-set-key (kbd "M-s-s") 'swap-windows)

;;;terminal----------------------------|
(global-set-key (kbd "C-`") 'eshell)

;;;Reload config----------
(global-set-key (kbd "C-x C-;") 'eval-buffer)

;;;Multiple-Cursors--------------------|
(require 'multiple-cursors)
(with-eval-after-load 'multiple-cursors
  (define-key mc/keymap (kbd "<return>") nil)
  (define-key mc/keymap (kbd "<escape>") 'mc/keyboard-quit))
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-?") 'mc/mark-all-like-this)


;(global-set-key (kbd "C-e") 'kmacro-call-macro)

;;;goto-line----------------------------|
(defun goto-relative-line (n)
  "Goto line N."
  (interactive "nGoto Line no:")
  (forward-line n))
(global-set-key (kbd "M-g g") 'goto-relative-line)
;;;Font size --------------------------|
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Comment & uncomment---------------|
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-'") 'uncomment-region)

(global-set-key (kbd "C-<tab>") 'company-complete)
