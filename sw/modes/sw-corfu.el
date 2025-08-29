;;; SW-CORFU --- sw-corfu-mode setup 

(if (package-installed-p 'corfu) (require 'corfu) (package-vc-install 'corfu))
(setq global-corfu-mode t)

(provide 'sw-corfu)
