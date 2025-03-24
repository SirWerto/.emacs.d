;;; SW-PAIRING --- sw-pairing-mode setup 

(set 'theme-region-background-color (face-attribute 'region :background))
(set 'theme-region-foreground-color (face-attribute 'region :foreground))
(set 'prog-pairing nil)

(defun toggle-prog-pairing ()
  "Toggle 'prog-pairing' in order to give visual hints to the non Emacs user doing pairing with you."
  (interactive)
  (if prog-pairing
      (progn
	(setq prog-pairing nil)
	(set-face-attribute 'region nil :background theme-region-background-color)
	(set-face-attribute 'region nil :foreground theme-region-foreground-color))
    (setq prog-pairing t)
    (set-face-attribute 'region nil :background "pink")
    (set-face-attribute 'region nil :foreground "black")))

(provide 'sw-pairing)
