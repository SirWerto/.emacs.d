;;; SW-IVY --- sw-ivy-mode setup 

(if (package-installed-p 'ivy) (require 'ivy) (package-vc-install 'ivy))
(ivy-mode 1)

(provide 'sw-ivy)
