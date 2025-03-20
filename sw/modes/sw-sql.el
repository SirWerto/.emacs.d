;;; SW-SQL --- sw-sql-mode setup 

(if (package-installed-p 'sqlformat) (require 'sqlformat) (package-vc-install 'sqlformat))
(setq sqlformat-command 'sqlfluff)
(setq sqlformat-args '("--dialect=athena" "--verbose"))
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

(provide 'sw-sql)
