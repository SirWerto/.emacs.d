;;; SW-COMPANY --- sw-company-mode setup 

(if (package-installed-p 'company) (require 'company) (package-vc-install 'company))

(provide 'sw-company)
