;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq package-check-signature nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

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

(use-package selectrum
  :config
  (selectrum-mode 1))


(global-linum-mode t)
(set-face-foreground 'linum "grey")

(show-paren-mode 1)
(setq show-paren-delay 0)




;; Erlang
(use-package erlang)
;; Elixir
(use-package elixir-mode)



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

;; tengo que ver como menterlas en config
;; hacer funcion que haga prepend a una lista
;; como add-to-list pero multiples veces
(add-to-list 'eglot-server-programs '(erlang-mode . ("/home/jorge/.lsps/erlang/bin/erlang_ls" "--transport" "stdio")))
(add-to-list 'eglot-server-programs '(elixir-mode "/home/jorge/.lsps/elixir/elixir-ls-1.12/language_server.sh"))


;; Themes
(use-package badwolf-theme
  :config
  (load-theme 'badwolf t))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit selectrum flycheck badwolf-theme parent-mode erlang projectile elixir-mode evil-collection evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
