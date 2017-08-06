
  ;; GUI Configuration
  (menu-bar-mode 1)
  ;; (setq spaceline-org-clock-p t)
  (setq powerline-default-separator 'utf-8)
  (setq word-wrap 1)

  ;; Language
  (setq ispell-local-dictionary "en_US")
  (global-set-key (kbd "C-c C-#") (lambda () (interactive) (insert "⌘")))

  ;; Interaction Config
  ;; (setq default evil-cross-lines t)
  (setq mac-command-modifier 'meta)
  (global-visual-line-mode t)
  (global-set-key [f8] 'neotree-toggle)
  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  ;; Insert Data time into Spacemacs Keyboard shortcut
    (defun insert-current-datetime () (interactive)
         (insert (shell-command-to-string "echo -n $(date '+%A (%B %d) @ %H:%m')")))
    (global-set-key "\C-x\M-d" `insert-current-datetime)
    (global-set-key (kbd "C-<prior>") `previous-buffer)
    (global-set-key (kbd "C-<next>") `next-buffer)
    (spacemacs/set-leader-keys "oit" 'insert-current-datetime)
    

  ;; Shell Config
  (setq explicit-shell-file-name "/bin/bash")

  ;; Pandoc
  ;; (setq org-pandoc-options-for-markdown '((atx-headers . t)))
  (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))

  ;; Quick Open Files
  (spacemacs/set-leader-keys "ocp" (lambda () (interactive) (find-file "~/Dropbox/org/phd-notes.org")))
  (spacemacs/set-leader-keys "ocf" (lambda () (interactive) (find-file "~/Dropbox/org/freelance.org")))
  (spacemacs/set-leader-keys "oct" (lambda () (interactive) (find-file "~/Dropbox/org/TODOs.org")))
  (global-set-key (kbd "C-x M-1") (lambda() (interactive)(find-file "~/Dropbox/org/")))
  ;; Org Directory
  (with-eval-after-load 'org
    org-log-done 'time
    org-startup-truncated
    (setq org-agenda-files '("~/Dropbox/org/" "~/Dropbox/org/teaching/" "~/Dropbox/org/meetings/")
          org-ref-default-biblography '("~/Development/atc-interruptions-paper1/paper1.bib"))

  ;; Open tree item in right frame
  (defun org-tree-open-in-right-frame ()
  (interactive)
  (org-tree-to-indirect-buffer)
  (windmove-right))

  (add-hook 'org-mode-hook
            (lambda ()
              (spacemacs/set-leader-keys "oe" 'org-tree-open-in-right-frame)
              (spacemacs/set-leader-keys "oo" 'org-tree-to-indirect-buffer)
            ))
  ;; Org Mode
  (setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (setq org-bullets-mode nil)
  (setq org-blank-before-new-entry nil)
  (setq org-support-shift-select t)
  (setq reftex-default-biblography '("~/Development/atc-interruptions-paper1/paper1.bib"))
  (define-key org-mode-map (kbd "C-M-<return>") 'org-insert-subheading)

  ;; Capture templates 
  (setq org-capture-templates
  '(("t" "Todo" entry (file+headline "~/org/TODOs.org" "Tasks")
         "* TODO %?\n  %i\n  %a")

    ("j" "Journal" entry (file+datetree "~/org/diary.org")
         "* %?\nEntered on %U\n  %i\n")))
     (setq org-todo-keywords
           '((sequence "TODO" "WAITING" "|" "DONE" "HOLD" "CANCELED")))

;;  (setq org-capture-templates
;;        '(("m" "Medication" plain (file+headline "~/Dropbox/org/BreeMedications.org" "Medication Checklist")
;;           "%<%A (%B %d) @ %H:%m> - %^{Medication} %?\n")
;;          ("f" "Food" plain (file+headline "~/Dropbox/org/BreeMedications.org" "Food")
;;           "%<%A (%B %d) @ %H:%m> - %^{Food} %?\n")
;;          ("T" "Toilet" plain (file+headline "~/Dropbox/org/BreeMedications.org" "Toilet")
;;           "%<%A (%B %d) @ %H:%m> - %^{Toilet} %?\n")))
  )
  ;; Markdown Mode
  (setq markdown-italic-underscore t)
  (setq markdown-asymmetric-header t)
  (setq markdown-list-indent-width 4)

  ;; Deft (nv) config
  (setq deft-extensions '("md" "tex" "org" "txt"))
  (setq deft-directory "~/Dropbox/Notes")
  (setq deft-text-mode 'markdown-mode)
  (global-set-key [f5] 'deft)
  (setq TeX-parse-self t)
  ;; Neotree Quicklook Binds

  (with-eval-after-load 'neotree
       (evil-define-key 'evilified neotree-mode-map (kbd "RET") 'neotree-quick-look)
       (evil-define-key 'evilified neotree-mode-map (kbd "S-<return>") 'neotree-enter) )
