;;; SW-THEMES --- sw-themes setup 

(if (package-installed-p 'solo-jazz-theme) (require 'solo-jazz-theme) (package-vc-install 'solo-jazz-theme))
(if (package-installed-p 'badwolf-theme) (require 'badwolf-theme) (package-vc-install 'badwolf-theme))
(load-theme 'badwolf t)

(provide 'sw-themes)
