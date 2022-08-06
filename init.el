;; hide menu-bar

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; add MELPA
(when (require 'package nil t)
  (add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/"))
  (package-initialize))

(menu-bar-mode -1)
;; not create backup(foo.txt~)
(setq make-backup-files nil)
;; not create backup("#foo.txt#")
(setq auto-save-default nil)
;; when cursor is at bottom(top), C-n(C-p) move one line
(setq scroll-step 1)
;; turn off beep sound
(setq visible-bell t)
;; display row number
(global-display-line-numbers-mode)

(global-set-key "\C-h" `delete-backward-char)
(global-set-key "\C-x\C-c" `clipboard-copy)
(global-set-key "\C-x\C-x" `clipboard-cut)
(global-set-key "\C-v" `clipboard-paste)
(global-set-key "\C-x\C-f" `isearch-forward)
(global-set-key "\C-s" `save-buffer)
(global-set-key "\C-w" 'delete-window)
(global-set-key "\C-z" 'undo)
(global-set-key "\C-q" 'save-buffers-kill-terminal)
;; set window move
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<right>") 'windmove-right)

;; copy to clipboard
(defun clipboard-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "xsel -i -b")
  (deactivate-mark))
;; cut to clipboard
(defun clipboard-cut (start end)
  (interactive "r")
  (shell-command-on-region start end "xsel -i -b")
  (kill-region start end))
;; paste from clipboard
(defun clipboard-paste ()
  (interactive)
  (insert (shell-command-to-string "xsel -o -b")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (uuidgen markdown-preview-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
