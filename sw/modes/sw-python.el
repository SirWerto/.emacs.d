;;; SW-PYTHON --- sw-python-mode setup 

(if (package-installed-p 'python-mode) (require 'python-mode) (package-vc-install 'python-mode))
(if (package-installed-p 'pip-requirements) (require 'pip-requirements) (package-vc-install 'pip-requirements))
(if (package-installed-p 'ruff-format) (require 'ruff-format) (package-vc-install 'ruff-format))
(if (package-installed-p 'highlight-indentation) (require 'highlight-indentation) (package-vc-install 'highlight-indentation))

;; (defun ruff-lint-format ()
;;   "Run ruff linter an formatter in a shell."
;;   (shell-command "ruff check --fix; ruff format"))


(add-hook 'python-mode-hook 'ruff-format-on-save-mode)
(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

(set-face-background 'highlight-indentation-current-column-face "#45413b")


(provide 'sw-python)
