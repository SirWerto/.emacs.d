;;; SW-ORG --- sw-org-mode setup 

;;(setq org-agenda-inhibit-startup t)

;; TODO -> load only one month in startup and then load the rest if needed
;; TODO -> clean daily files programaticaly
(load-library "find-lisp")
(setq agenda-files-at-home `(,(file-truename "~/hive-mind/knowledge")))
;; ;;(setq agenda-files-at-work (find-lisp-find-files "~/hive-mind-bbva" "\.org$"))
;; ;;(setq agenda-files-at-work (find-lisp-find-files "~/hive-mind-bbva" "\.org$"))

(setq agenda-files-at-work (
				--split-with
				(string-match-p "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\.org" it)
				(if is-home-station '() (find-lisp-find-files "~/hive-mind-bbva" "\.org$"))))
(setq agenda-files-at-work-knowledge (nth 0 agenda-files-at-work))
(setq agenda-files-at-work-dailies (nth 1 agenda-files-at-work))



(setq agenda-files-on-startup (append
			       agenda-files-at-home
			       agenda-files-at-work-knowledge
			       ))

(setq agenda-files-on-demand 1)

(setq org-agenda-files (sort agenda-files-on-startup '<))


;; ;;(setq org-agenda-files (sort `(append `(,(file-truename "~/hive-mind/knowledge")) (unless is-home-station agenda-files-at-work)) '<))
;; (setq org-agenda-files (sort (append agenda-files-base agenda-files-at-work) '<))

(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "BLOCKED" "BLOCKED TO VERIFY" "|" "DONE")))
;; (setq org-todo-keyword-faces '(
;; 			       ("TODO" . (:background "#CAC9C7" :foreground "#9A9896" :weight bold))
;; 			       ("IN PROGRESS" . "#D3E5EF")
;; 			       ("BLOCKED" . (:background "red" :foreground "black" :weight bold))
;; 			       ("DONE" . (:background "green" :foreground "black" :weight bold))
;; 			       ("BLOCKED TO VERIFY" . (:background "purple" :foreground "black" :weight bold))))

(keymap-global-set "C-c o l" 'org-store-link)
(keymap-global-set "C-c o a" 'org-agenda)
(keymap-global-set "C-c o c" 'org-capture)



(add-hook 'org-agenda-mode-hook
	  (lambda ()
	   (evil-local-set-key 'emacs (kbd "j") 'evil-next-line)
	   (evil-local-set-key 'emacs (kbd "k") 'evil-previous-line)))



;; roam

(setq org-roam-directory (file-truename "~/hive-mind"))
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
	'(("d" "default" entry
           "* %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n"))
;; 	  ("j" "job template" entry
;;            "%?
;; * Movements %(org-set-tags \"movements\")

;; * Forecasting %(org-set-tags \"forecasting\")

;; * Reuniones 

;; * Other %(org-set-tags \"notes\")
;; "
;;            :target (file+head "%<%Y-%m-%d>.org"
;;                               "#+title: %<%Y-%m-%d>\n"))
	  ))
(setq org-roam-capture-templates
	'
	(
	 ("d" "default" plain "%?" :target
	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
")
	  :unnarrowed t)

;; 	 ("f" "table field" plain "%?" :target
;; 	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}


;; Tables ->
;; ")

;; 	  :unnarrowed t)
	 )
	)


(if (package-installed-p 'org-roam-ui) (require 'org-roam-ui) (package-vc-install 'org-roam-ui))
(if (package-installed-p 'org-roam) (require 'org-roam) (package-vc-install 'org-roam))

(org-roam-db-autosync-mode)

(keymap-global-set "C-c o r i" 'org-roam-node-insert)
(keymap-global-set "C-c o r f" 'org-roam-node-find)
(keymap-global-set "C-c o r c" 'org-roam-dailies-goto-today)








(provide 'sw-org)
