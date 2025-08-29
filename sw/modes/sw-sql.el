;;; SW-SQL --- sw-sql-mode setup 

(setq sqlformat-command 'sqlfluff)
(setq sqlformat-args '("--dialect=athena" "--verbose"))
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

(provide 'sw-sql)
