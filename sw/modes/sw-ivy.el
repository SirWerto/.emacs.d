;;; SW-IVY --- sw-ivy-mode setup 

(if (package-installed-p 'ivy) (require 'ivy) (package-vc-install 'ivy))

(setq ivy-re-builders-alist '((t . orderless-ivy-re-builder)))
(add-to-list 'ivy-highlight-functions-alist '(orderless-ivy-re-builder . orderless-ivy-highlight))

(ivy-mode 1)

(provide 'sw-ivy)
