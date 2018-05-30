                                        ; Base Emacs bindings
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-<backspace>") 'backward-kill-word)
(global-set-key (kbd "C-x k") 'spacemacs/kill-this-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-Z") 'redo)

(define-key global-map (kbd "s-=") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-n") 'new-frame)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "M-<prior>") `previous-buffer)
(global-set-key (kbd "M-<next>") `next-buffer)
(global-set-key (kbd "s-<prior>") `previous-buffer)
(global-set-key (kbd "s-<next>") `next-buffer)
(global-set-key (kbd "M-D") 'spacemacs/duplicate-line-or-region)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [f5] 'deft)
(global-set-key [f12] 'magit)

;; Insert newline after current line
(defun end-of-line-and-indented-new-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
(global-set-key (kbd "<S-return>") 'end-of-line-and-indented-new-line)


(define-key evil-emacs-state-map (kbd "C-o") (lambda () (interactive)(beginning-of-line)(open-line 1))) ; vi-like line insertion


                                        ; Evil Configuration
;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)
;; Make horizontal movement cross lines
(setq evil-cross-lines t)


;; Neotree Quicklook Binds
(with-eval-after-load 'neotree
  (evil-define-key 'evilified neotree-mode-map (kbd "RET") 'neotree-quick-look)
  (evil-define-key 'evilified neotree-mode-map (kbd "S-<return>") 'neotree-enter))


;; Utility Functionality
(defun michael-timestamp ()
  "Insert a timestamp at the current point.
Note no attempt to go to beginning of line and no added carriage return.
Uses `bjk-timestamp-format' for formatting the date/time."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %a @ %H:%M" (current-time))))
(global-set-key "\C-x\M-d" `michael-timestamp)

(defun michael-filetimestamp ()
  "Insert a timestamp at the current point.
Note no attempt to go to beginning of line and no added carriage return.
Uses `bjk-timestamp-format' for formatting the date/time."
  (interactive)
  (insert (format-time-string "%Y%m%d_%H%M" (current-time))))



;; Spacemacs Related Functions
(spacemacs/declare-prefix "od" "dired-michael")
(spacemacs/declare-prefix "oi" "inserts-michael")
(spacemacs/declare-prefix "oe" "editing-michael")
(spacemacs/declare-prefix "oo" "openpath-michael")
(spacemacs/declare-prefix "ob" "buffer-manipulations")

(spacemacs/set-leader-keys "ode" 'wdired-change-to-wdired-mode)
(spacemacs/set-leader-keys "oid" 'michael-timestamp)
(spacemacs/set-leader-keys "oif" 'michael-filetimestamp)

(defun openpath-dropbox ()
  (interactive) (find-file "~/Dropbox/"))

(defun openpath-phd ()
  (interactive) (find-file "~/Dropbox/PhD-Current"))

(defun openpath-thesis ()
  (interactive) (find-file "~/Dropbox/Thesis/"))

(defun openpath-orgdir ()
  (interactive) (find-file "~/Dropbox/org/"))

(defun openpath-blog ()
  (interactive) (find-file "~/humanfactors/michael-blog/"))

(defun openpath-code ()
  (interactive) (find-file "~/Code/"))

(defun openpath-dotfiles ()
  (interactive) (find-file "~/.spacemacs.d/"))

(defun openpath-atc-derde ()
  (interactive)
  (when-system gnu/linux
    (find-file "~/phd/atc-interruptions-derde"))
  (when-system windows-nt
    (find-file "~/PhD/atc-interruptions-derde")))

(defun openpath-home ()
  (interactive) (find-file "~/"))


(global-set-key (kbd "C-x M-1") 'openpath-dropbox) 
(global-set-key (kbd "C-x M-2") 'openpath-orgdir) 
(global-set-key (kbd "C-x M-3") 'openpath-blog) 
(global-set-key (kbd "C-x M-4") 'openpath-code) 
(global-set-key (kbd "C-x M-5") 'openpath-dotfiles)
(global-set-key (kbd "C-x M-6") 'openpath-atc-derde)
(global-set-key (kbd "C-x M-f") 'open-directory-in-system-viewer)

(spacemacs/set-leader-keys "ood" 'openpath-dropbox)
(spacemacs/set-leader-keys "ooo" 'openpath-orgdir)
(spacemacs/set-leader-keys "oob" 'openpath-blog)
(spacemacs/set-leader-keys "ooc" 'openpath-code)
(spacemacs/set-leader-keys "oos" 'openpath-dotfiles)
(spacemacs/set-leader-keys "oo3" 'openpath-atc-derde)
(spacemacs/set-leader-keys "ooh" 'openpath-home)
(spacemacs/set-leader-keys "oot" 'openpath-thesis)
(spacemacs/set-leader-keys "oop" 'openpath-phd)

(spacemacs/set-leader-keys "o TAB" 'open-directory-in-system-viewer)


