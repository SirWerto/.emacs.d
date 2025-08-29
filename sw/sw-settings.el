;;; SW-SETTINGS --- sw-settings

(global-auto-revert-mode t)

(global-display-line-numbers-mode t)
(set-face-foreground 'line-number "grey")

(show-paren-mode 1)
(setq show-paren-delay 0)

(add-hook 'prog-mode-hook 'flymake-mode)

(provide 'sw-settings)
