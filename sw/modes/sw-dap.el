;;; SW-DAP --- sw-dap-mode setup 

(dap-ui-mode 1)
(dap-tooltip-mode 1)
(tooltip-mode 1)
(dap-ui-controls-mode 1)

(require 'dap-erlang)
(require 'dap-elixir)
(require 'dap-python)
(setq dap-python-debugger 'debugpy)

(provide 'sw-dap)
