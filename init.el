;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(package-install 'use-package)

(eval-when-compile
  (require 'use-package))

(setq is-home-station (if (getenv "HOMESTATION") t nil))

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(setq evil-want-keybinding 'nil)
(use-package evil
	     :bind (
		    :map evil-insert-state-map
		    ("C-l" . 'evil-force-normal-state))
	     :config
	     (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (setq evil-collection-mode-list '(mu4e)))

(use-package magit)


(use-package projectile
  :bind ("C-c p" . projectile-command-map)
  :config
  (projectile-mode 1))

(use-package company
  :demand t
  :config
  (global-company-mode))

(use-package ivy
  :config
  (ivy-mode 1))

(global-auto-revert-mode t)

(global-display-line-numbers-mode t)
(set-face-foreground 'line-number "grey")

(show-paren-mode 1)
(setq show-paren-delay 0)

;; Org :)
(use-package org-roam-ui)
(use-package org-roam
  :init
  (setq org-roam-directory (file-truename "~/hive-mind"))
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-dailies-capture-templates
	'(("d" "default" entry
           "* %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n"))))
  (setq org-roam-capture-templates
	'
	(
	 ("d" "default" plain "%?" :target
	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
")
	  :unnarrowed t)

	 ("f" "table field" plain "%?" :target
	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}


Tables ->
")

	  :unnarrowed t)
	 )
	)
  (org-roam-db-autosync-mode)

  :bind (("C-c o r i" . org-roam-node-insert)
	 ("C-c o r f" . org-roam-node-find)
	 ("C-c o r c" . org-roam-dailies-goto-today)))



(add-hook 'prog-mode-hook 'flymake-mode)


;; Erlang
(use-package erlang)
;; Elixir
(use-package elixir-mode)
;; Scala
(use-package scala-mode)
;; Python
(use-package python-mode)
(use-package pip-requirements)
(use-package py-autopep8
  :hook ((python-mode) . py-autopep8-mode))



;; Emacs LSP
(use-package eglot
  :demand t
  :init (setq lsp-folder (getenv "LSP_FOLDER"))
  :bind (:map evil-normal-state-map
	      ("C-e r" . 'eglot-rename)
	      ("C-e h" . 'eldoc)
	      ("C-e g d" . 'xref-find-definitions))
  :config
  (setq eglot-ignored-server-capabilities `(:documentHighlightProvider))
  (add-to-list 'eglot-server-programs `(erlang-mode  ,(getenv "LSP_ERLANG") "--transport" "stdio"))
  (add-to-list 'eglot-server-programs `(elixir-mode ,(getenv "LSP_ELIXIR")))
  (add-to-list 'eglot-server-programs `(scala-mode , (concat lsp-folder "/" "metals"))))
  ;;(add-to-list 'eglot-server-programs `(python-mode ,(concat lsp-folder "/" "pyright") "--stdio")))

;; Emacs DAP
(use-package dap-mode
  :config
  (dap-ui-mode 1)
  ;; enables mouse hover support
  (dap-tooltip-mode 1)
  ;; use tooltips for mouse hover
  ;; if it is not enabled `dap-mode' will use the minibuffer.
  (tooltip-mode 1)
  ;; displays floating panel with debug buttons
  ;; requies emacs 26+
  (dap-ui-controls-mode 1)

  ;; Lenguages
  ;; Erlang
  (require 'dap-erlang)
  ;; Elixir
  (require 'dap-elixir)
  ;; Python
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  )



;; Emacs COPILOT
(if is-home-station
   (use-package gptel
     :config
     (setq
      gptel-model "codellama:latest"
      gptel-backend (gptel-make-ollama "Ollama"
                      :host "localhost:11434"
                      :stream t
                      :models '("codellama:latest")))
     :bind (("C-c c o s" . 'gptel-send)
	    ("C-c c o m" . 'gptel-menu))
     )
  )


(use-package envrc
  :config
  (envrc-global-mode))

;;;; Fancy
;; Themes

;; (use-package solo-jazz-theme)
(use-package badwolf-theme
  :config
  (load-theme 'badwolf t))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))




(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

