;;; SW-ORG-ROAM --- sw-org-roam-mode setup 
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

(provide 'sw-org-roam)
