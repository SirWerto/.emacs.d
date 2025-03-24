;;; SW-PYTHON --- sw-python-mode setup 

(if (package-installed-p 'python-mode) (require 'python-mode) (package-vc-install 'python-mode))
(if (package-installed-p 'pip-requirements) (require 'pip-requirements) (package-vc-install 'pip-requirements))


(if (package-installed-p 'py-autopep8) (require 'py-autopep8) (package-vc-install 'py-autopep8))
(unintern 'py-comment-region)
(unintern 'py-uncomment)
(if (package-installed-p 'ruff-format) (require 'ruff-format) (package-vc-install 'ruff-format))

;; (defun ruff-lint-format ()
;;   "Run ruff linter an formatter in a shell."
;;   (shell-command "ruff check --fix; ruff format"))


(if is-home-station
    (add-hook 'python-mode-hook 'ruff-format-on-save-mode)
  (add-hook 'python-mode-hook 'py-autopep8-mode))

(provide 'sw-python)
