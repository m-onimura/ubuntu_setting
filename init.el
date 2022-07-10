; hide menu-bar
(menu-bar-mode -1)
; not create backup(foo.txt~)
(setq make-backup-files nil)
; not create backup("#foo.txt#")
(setq auto-save-default nil)
; when cursor is at bottom(top), C-n(C-p) move one line
(setq scroll-step 1)
; turn off beep sound
(setq visible-bell t)
; display row number
(global-display-line-numbers-mode)

(global-set-key "\C-h" `delete-backward-char)
(global-set-key "\C-c" `clipboard-copy)
(global-set-key "\C-x\C-x" `clipboard-cut)
(global-set-key "\C-v" `clipboard-paste)
(global-set-key "\C-x\C-f" `isearch-forward)
(global-set-key "\C-s" `save-buffer)
(global-set-key "\C-o" 'delete-window)
; set window move
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<right>") 'windmove-right)

; copy to clipboard
(defun clipboard-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "xsel -i -b")
  (deactivate-mark))
; cut to clipboard
(defun clipboard-cut (start end)
  (interactive "r")
  (shell-command-on-region start end "xsel -i -b")
  (kill-region start end))
; paste from clipboard
(defun clipboard-paste ()
  (interactive)
  (insert (shell-command-to-string "xsel -o -b")))
