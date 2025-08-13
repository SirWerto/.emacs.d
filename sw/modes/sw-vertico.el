;;; SW-VERTICO --- sw-vertico-mode setup 

(if (package-installed-p 'vertico) (require 'vertico) (package-vc-install 'vertico))

(setq vertico-mode 1)
;;(vertico-mode 1)
(setq enable-recursive-minibuffers t)
;;minibuffer-depth-indicate-mode


(provide 'sw-vertico)
