;;; SW-ENVRC --- sw-envrc-mode setup 

(if (package-installed-p 'envrc) (require 'envrc) (package-vc-install 'envrc))
(add-hook 'after-init-hook 'envrc-global-mode)

(provide 'sw-envrc)
