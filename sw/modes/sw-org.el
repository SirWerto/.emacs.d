;;; SW-ORG --- sw-org-mode setup 
;;(org-edit-src-exit)

;; (define-advice org-edit-src-exit (:before (&rest _args) format-python)
;;   "Run `blacken-buffer' on Python code."
;;   (when (eq major-mode 'python-mode)
;;     (message "Formatting python code...")
;;     (blacken-buffer)))

(define-advice org-edit-src-exit (:before (&rest _args) format-sql-org-code-block)
  "Format sql on sql code block."
  (when (eq major-mode 'sql-mode)
    (message "Formatting sql code...")
    (sqlformat-buffer))
  )

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
(setq org-agenda-inhibit-startup t)


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
	    (evil-local-set-key 'normal (kbd "TAB") 'org-cycle)
	    (evil-local-set-key 'normal (kbd "C-k") 'org-move-subtree-up)
	    (evil-local-set-key 'normal (kbd "C-j") 'org-move-subtree-down)))
(provide 'sw-org)
