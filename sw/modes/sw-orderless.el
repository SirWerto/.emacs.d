;;; SW-ORDERLESS --- sw-orderless-mode setup 

(if (package-installed-p 'orderless) (require 'orderless) (package-vc-install 'orderless))

(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))


(provide 'sw-orderless)
