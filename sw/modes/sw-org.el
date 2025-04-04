;;; SW-ORG --- sw-org-mode setup 



(if (package-installed-p 'org-roam-ui) (require 'org-roam-ui) (package-vc-install 'org-roam-ui))
(if (package-installed-p 'org-roam) (require 'org-roam) (package-vc-install 'org-roam))


(load-library "find-lisp")
(setq agenda-files-at-home `(,(file-truename "~/hive-mind/knowledge")))
(setq agenda-files-at-work-knowledge (if is-home-station '() (find-lisp-find-files "~/hive-mind-bbva/knowledge" "\.org$")))
(setq agenda-files-at-work-daily (if is-home-station '() `(,(file-truename "~/hive-mind-bbva/daily/daily_notes.org"))))


(setq agenda-files-on-startup (append
			       agenda-files-at-home
			       agenda-files-at-work-knowledge
			       agenda-files-at-work-daily
			       ))


;; (setq org-agenda-files (sort agenda-files-on-startup '<))
(setq org-agenda-files agenda-files-on-startup)


;; ;;(setq org-agenda-files (sort `(append `(,(file-truename "~/hive-mind/knowledge")) (unless is-home-station agenda-files-at-work)) '<))
;; (setq org-agenda-files (sort (append agenda-files-base agenda-files-at-work) '<))

(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "BLOCKED" "BLOCKED TO VERIFY" "|" "DONE")))
;; (setq org-todo-keyword-faces '(
;; 			       ("TODO" . (:background "#CAC9C7" :foreground "#9A9896" :weight bold))
;; 			       ("IN PROGRESS" . "#D3E5EF")
;; 			       ("BLOCKED" . (:background "red" :foreground "black" :weight bold))
;; 			       ("DONE" . (:background "green" :foreground "black" :weight bold))
;; 			       ("BLOCKED TO VERIFY" . (:background "purple" :foreground "black" :weight bold))))

(evil-all-global-set-key (kbd "C-c o l") 'org-store-link)
(evil-all-global-set-key (kbd "C-c o a") 'org-agenda)
(evil-all-global-set-key (kbd "C-c o c") 'org-capture)

(add-hook 'org-agenda-mode-hook
	  (lambda ()
	   (evil-local-set-key 'emacs (kbd "j") 'evil-next-line)
	   (evil-local-set-key 'emacs (kbd "k") 'evil-previous-line)))

(add-hook 'org-mode-hook
	  (lambda ()
	   (evil-local-set-key 'normal (kbd "TAB") 'org-cycle)))



;; roam

(setq org-roam-directory (file-truename "~/hive-mind"))
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
	'(("d" "default" entry
           "* %?"
           :target (file+datetree "daily_notes.org" day))
	  ))



(org-roam-db-autosync-mode)

(keymap-global-set "C-c o r i" 'org-roam-node-insert)
(keymap-global-set "C-c o r f" 'org-roam-node-find)
(keymap-global-set "C-c o r c" 'org-roam-dailies-goto-today)








(provide 'sw-org)
