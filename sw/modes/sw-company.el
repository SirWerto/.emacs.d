;;; SW-COMPANY --- sw-company-mode setup 

(if (package-installed-p 'company) (require 'company) (package-vc-install 'company))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'sw-company)
