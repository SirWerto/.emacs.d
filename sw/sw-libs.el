;;; SW-LIBS --- sw-libs

(if (package-installed-p 'dash) (require 'dash) (package-vc-install 'dash))

(provide 'sw-libs)
