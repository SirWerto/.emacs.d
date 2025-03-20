;;; SW-MAGIT --- sw-magit-mode setup 

(if (package-installed-p 'magit) (require 'magit) (package-vc-install 'magit))

(provide 'sw-magit)
