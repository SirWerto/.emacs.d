;;; SW-HOCON --- sw-hocon-mode setup 


(reformatter-define hocon-format
  :program "pyhocon"
  :args (list "--format=hocon" "--indent=4" "--verbosity"))

(provide 'sw-hocon)
