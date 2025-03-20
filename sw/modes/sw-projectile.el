;;; SW-PROJECTILE --- sw-projectile-mode setup 

(if (package-installed-p 'projectile) (require 'projectile) (package-vc-install 'projectile))
(evil-all-global-set-key (kbd "C-c p") 'projectile-command-map)
(projectile-mode 1)

(provide 'sw-projectile)
