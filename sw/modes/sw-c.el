;;; SW-C --- sw-c-mode setup 

(if (package-installed-p 'clang-format) (require 'clang-format) (package-vc-install 'clang-format))
(add-hook 'c-mode-hook (lambda () (add-hook 'after-save-hook #'clang-format-buffer nil t)))

(provide 'sw-c)
