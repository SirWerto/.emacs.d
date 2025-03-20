;;; SW-EVIL-EASYMOTION --- sw-evil-easymotion setup 

(if (package-installed-p 'evil-easymotion) (require 'evil-easymotion) (package-vc-install 'evil-easymotion))
(evilem-default-keybindings "SPC")

(provide 'sw-evil-easymotion)
