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


;;;; MAGIT
(if (package-installed-p 'magit) (require 'magit) (package-vc-install 'magit))


;;;; PROJECTILE
(if (package-installed-p 'projectile) (require 'projectile) (package-vc-install 'projectile))
(evil-all-global-set-key (kbd "C-c p") 'projectile-command-map)
(projectile-mode 1)



;;;; COMPANY
(if (package-installed-p 'company) (require 'company) (package-vc-install 'company))
(global-company-mode 1)






;;;; ENVRC
(if (package-installed-p 'envrc) (require 'envrc) (package-vc-install 'envrc))
(add-hook 'after-init-hook 'envrc-global-mode)


;;;;;; AUTOCOMPLETION

;;;; IVY
(if (package-installed-p 'ivy) (require 'ivy) (package-vc-install 'ivy))
(ivy-mode 1)


;; ;;;; Vertico
;; (if (package-installed-p 'vertico) (require 'vertico) (package-vc-install 'vertico))
;; (vertico-mode 1)
;;;;;; AUTOCOMPLETION END






;; DEVELOPMENT


;;;; SQL
(if (package-installed-p 'sqlformat) (require 'sqlformat) (package-vc-install 'sqlformat))
(setq sqlformat-command 'sqlfluff)
(setq sqlformat-args '("--dialect=athena" "--verbose"))
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

;;;; Emacs Lisp
(setq pp-max-width 120)


;;;; Erlang
;;(if (package-installed-p 'erlang) (require 'erlang) (package-vc-install 'erlang))
;;;; Elixir
(if (package-installed-p 'elixir-mode) (require 'elixir-mode) (package-vc-install 'elixir-mode))
(add-hook 'elixir-mode-hook (lambda () (add-hook 'after-save-hook #'mix-format nil t)))

;;;; C
(if (package-installed-p 'clang-format) (require 'clang-format) (package-vc-install 'clang-format))
(add-hook 'c-mode-hook (lambda () (add-hook 'after-save-hook #'clang-format-buffer nil t)))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (if c-buffer-is-cc-mode
;;                 (add-hook 'before-save-hook #'clang-format-buffer nil 'local)
;;               (remove-hook 'before-save-hook #'clang-format-buffer 'local))))

;;;; Scala
(if (package-installed-p 'scala-mode) (require 'scala-mode) (package-vc-install 'scala-mode))
;;;; Python
(if (package-installed-p 'python-mode) (require 'python-mode) (package-vc-install 'python-mode))
(if (package-installed-p 'pip-requirements) (require 'pip-requirements) (package-vc-install 'pip-requirements))

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

