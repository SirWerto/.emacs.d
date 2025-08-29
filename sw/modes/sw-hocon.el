;;; SW-HOCON --- sw-hocon-mode setup 

;;;###autoload (autoload 'hocon-format-buffer "current-file" nil t)
;;;###autoload (autoload 'hocon-format-region "current-file" nil t)
(reformatter-define hocon-format
  :program "pyhocon"
  :args '("--format=hocon" "--indent=4"))

(provide 'sw-hocon)
