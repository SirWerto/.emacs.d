;;; SW-PYTHON --- sw-python-mode setup 

;;;###autoload (autoload 'python-autopep8-format-buffer "current-file" nil t)
;;;###autoload (autoload 'python-autopep8-format-region "current-file" nil t)
;;;###autoload (autoload 'python-autopep8-format-on-save-mode "current-file" nil t)
(reformatter-define python-autopep8-format
  :program "autopep8"
  :args (list input-file "--max-line-length=120")
  )


;;;###autoload (autoload 'python-ruff-format-buffer "current-file" nil t)
;;;###autoload (autoload 'python-ruff-format-region "current-file" nil t)
;;;###autoload (autoload 'python-ruff-format-on-save-mode "current-file" nil t)
(reformatter-define python-ruff-format
  :program "ruff"
  :args (list "format" "--stdin-filename" (or (buffer-file-name) input-file))
  )


(if is-home-station
    (add-hook 'python-mode-hook 'python-ruff-format-on-save-mode)
  (add-hook 'python-mode-hook 'python-autopep8-format-on-save-mode))

(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
;;(set-face-background 'highlight-indentation-current-column-face "#45413b")


(provide 'sw-python)
