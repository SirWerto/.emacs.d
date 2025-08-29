;;; SW-EVIL --- sw-evil-mode setup 

(keymap-global-set "C-l" 'evil-force-normal-state)
(evil-mode 1)

(defun evil-global-set-key-states (states key def)
  "Bind KEY to DEF in STATES."
  (mapc (lambda (state) (evil-global-set-key state key def)) states))

(defun evil-all-global-set-key (key def)
  "Bind KEY to DEF in all states but Emacs."
  (evil-global-set-key-states '(normal insert visual replace operator motion) key def))
(provide 'sw-evil)
