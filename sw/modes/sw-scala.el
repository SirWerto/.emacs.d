;;; SW-Scala --- sw-scala-mode setup 

(if (package-installed-p 'scala-mode) (require 'scala-mode) (package-vc-install 'scala-mode))


(provide 'sw-scala)
