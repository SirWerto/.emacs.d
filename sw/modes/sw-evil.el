;;; SW-EVIL --- sw-evil-mode setup 

(setq evil-want-keybinding 'nil)
(if (package-installed-p 'evil) (require 'evil) (package-vc-install 'evil))
(keymap-global-set "C-l" 'evil-force-normal-state)
(evil-mode 1)

(defun evil-global-set-key-states (states key def)
  "Bind KEY to DEF in STATES."
  (mapc (lambda (state) (evil-global-set-key state key def)) states))

(defun evil-all-global-set-key (key def)
  "Bind KEY to DEF in all states but Emacs."
  (evil-global-set-key-states '(normal insert visual replace operator motion) key def))

;; EVIL COLLECTION
(if (package-installed-p 'evil-collection) (require 'evil-collection) (package-vc-install 'evil-collection))
(with-eval-after-load 'magit (evil-collection-magit-setup))

(provide 'sw-evil)
