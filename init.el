;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(package-install 'use-package)

(eval-when-compile
  (require 'use-package))

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

(use-package flycheck
  :init (global-flycheck-mode))

(use-package ivy
  :config
  (ivy-mode 1))

(global-linum-mode t)
(set-face-foreground 'linum "grey")

(show-paren-mode 1)
(setq show-paren-delay 0)




;; Erlang
(use-package erlang)
;; Elixir
(use-package elixir-mode)
;; Scala
(use-package scala-mode)



;; Emacs LSP
(use-package eglot
  :hook (
	 (erlang-mode . eglot-ensure)
	 (elixir-mode . eglot-ensure))
  :demand t
  :bind (
	 :map evil-normal-state-map
	      ("C-e r" . 'eglot-rename)
	      ("C-e h" . 'eldoc)
	      ("C-e g d" . 'xref-find-definitions)))

(add-to-list 'eglot-server-programs `(erlang-mode  ,(getenv "LSP_ERLANG") "--transport" "stdio"))
(add-to-list 'eglot-server-programs `(elixir-mode ,(getenv "LSP_ELIXIR")))
(add-to-list 'eglot-server-programs `(scala-mode ,(getenv "LSP_SCALA")))

;;;; Fancy
;; Themes
(use-package badwolf-theme
  :config
  (load-theme 'badwolf t))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))




(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

