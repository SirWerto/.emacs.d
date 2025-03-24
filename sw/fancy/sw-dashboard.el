;;; SW-DASHBOARD --- sw-dashboard setup 

(if (package-installed-p 'dashboard) (require 'dashboard) (package-vc-install 'dashboard))
(dashboard-setup-startup-hook)

(provide 'sw-dashboard)
