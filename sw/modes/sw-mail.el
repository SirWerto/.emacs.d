;;; SW-MAIL --- sw-mail-mode setup 


(setq emacs-mail-dir (file-name-concat emacs-tools-dir "mail"))



(setq gnus-startup-file (file-name-concat emacs-tools-dir "mail/" ".newsrc"))
(setq gnus-select-method '(nnrss ""))


(provide 'sw-mail)
