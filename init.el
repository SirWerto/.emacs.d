;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(require 'package)
(package-initialize)


;; INITIAL VARIABLES
(setq is-home-station (if (getenv "HOMESTATION") t nil))
(setq lsp-folder (getenv "LSP_FOLDER"))



;; (setq you-know '(combobulate
;; 			:url "https://github.com/mickeynp/combobulate.git"
;; 			:branch "59b64d66d66eb84da6a2cedd152b1692378af674"))

;; (package-vc-install you-know)



;; Paths & packages

(add-to-list 'load-path "~/.emacs.d/sw")
(add-to-list 'load-path "~/.emacs.d/sw/modes")






;; GENERAL PACKAGES




;;;; Libs
(require 'sw-libs)
;;;; Modes
(require 'sw-evil)
(require 'sw-evil-easymotion)
(require 'sw-org)
(require 'sw-eglot)
(require 'sw-magit)
(require 'sw-projectile)
(require 'sw-company)
(require 'sw-ivy)
(require 'sw-envrc)



;;;; Modes - Lenguages
(require 'sw-emacs-lisp)
(require 'sw-erlang)
(require 'sw-elixir)
(require 'sw-c)
(require 'sw-scala)
(require 'sw-python)
(require 'sw-sql)


;; ;;;; Vertico
;; (if (package-installed-p 'vertico) (require 'vertico) (package-vc-install 'vertico))
;; (vertico-mode 1)
;;;;;; AUTOCOMPLETION END






;;;; Emacs Lisp

;;;; Python

;;;; Python formatter
(if (package-installed-p 'py-autopep8) (require 'py-autopep8) (package-vc-install 'py-autopep8))
(unintern 'py-comment-region)
(unintern 'py-uncomment)
(if (package-installed-p 'ruff-format) (require 'ruff-format) (package-vc-install 'ruff-format))

;; (defun ruff-lint-format ()
;;   "Run ruff linter an formatter in a shell."
;;   (shell-command "ruff check --fix; ruff format"))


(if is-home-station
    (add-hook 'python-mode-hook 'ruff-format-on-save-mode)
  (add-hook 'python-mode-hook 'py-autopep8-mode))







;;;; COPILOT
(if is-home-station
    (progn
     (if (package-installed-p 'gptel) (require 'gptel) (package-vc-install 'gptel))
     (setq
      gptel-model "codellama:latest"
      gptel-backend (gptel-make-ollama "Ollama"
                      :host "localhost:11434"
                      :stream t
                      :models '("codellama:latest")))
 
     (keymap-global-set "C-c c o s" 'gptel-send)
     (keymap-global-set "C-c c o m" 'gptel-menu)))

;;;; DAP
(if (package-installed-p 'dap-mode) (require 'dap-mode) (package-vc-install 'dap-mode))
(dap-ui-mode 1)
(dap-tooltip-mode 1)
(tooltip-mode 1)
(dap-ui-controls-mode 1)

(require 'dap-erlang)
(require 'dap-elixir)
(require 'dap-python)
(setq dap-python-debugger 'debugpy)






;; OOOOOTHER

(global-auto-revert-mode t)

(global-display-line-numbers-mode t)
(set-face-foreground 'line-number "grey")

(show-paren-mode 1)
(setq show-paren-delay 0)

(add-hook 'prog-mode-hook 'flymake-mode)





;; Fancy

(if (package-installed-p 'highlight-indentation) (require 'highlight-indentation) (package-vc-install 'highlight-indentation))
(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
(set-face-background 'highlight-indentation-current-column-face "#45413b")

;;;; Themes

(if (package-installed-p 'solo-jazz-theme) (require 'solo-jazz-theme) (package-vc-install 'solo-jazz-theme))
(if (package-installed-p 'badwolf-theme) (require 'badwolf-theme) (package-vc-install 'badwolf-theme))
(load-theme 'badwolf t)


(if (package-installed-p 'dashboard) (require 'dashboard) (package-vc-install 'dashboard))
(dashboard-setup-startup-hook)



;; Pairing
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



(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

