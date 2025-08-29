;;; SW-LIBS --- sw-libs

(if (package-installed-p 'dash) (require 'dash) (package-vc-install 'dash))
(if (package-installed-p 'reformatter) (require 'reformatter) (package-vc-install 'reformatter))

(provide 'sw-libs)
