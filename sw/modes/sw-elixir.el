;;; SW-ELIXIR --- sw-elixir-mode setup 

;; (if (package-installed-p 'elixir-mode) (require 'elixir-mode) (package-vc-install 'elixir-mode))

;; (add-hook 'elixir-mode-hook (lambda () (add-hook 'after-save-hook #'mix-format nil t)))

(provide 'sw-elixir)
