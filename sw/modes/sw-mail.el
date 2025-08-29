;;; SW-MAIL --- sw-mail-mode setup 

(setq gnus-startup-file (expand-file-name "mail/.newsrc" tools-directory))
(setq gnus-select-method '(nnrss ""))

(provide 'sw-mail)
