;;; SW-DAP --- sw-dap-mode setup 

(if (package-installed-p 'dap-mode) (require 'dap-mode) (package-vc-install 'dap-mode))
(dap-ui-mode 1)
(dap-tooltip-mode 1)
(tooltip-mode 1)
(dap-ui-controls-mode 1)

(require 'dap-erlang)
(require 'dap-elixir)
(require 'dap-python)
(setq dap-python-debugger 'debugpy)

(provide 'sw-dap)
