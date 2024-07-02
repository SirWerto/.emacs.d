;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)


;; INITIAL VARIABLES
(setq is-home-station (if (getenv "HOMESTATION") t nil))
(setq lsp-folder (getenv "LSP_FOLDER"))


;; GENERAL PACKAGES
;;;; EVIL
(setq evil-want-keybinding 'nil)
(if (package-installed-p 'evil) (require 'evil) (package-vc-install 'evil))
;;(define-key evil-insert-state-map "C-l" 'evil-force-normal-state)
(keymap-global-set "C-l" 'evil-force-normal-state)
(evil-mode 1)

;;;;;; EVIL COLLECTION
(if (package-installed-p 'evil-collection) (require 'evil-collection) (package-vc-install 'evil-collection))
(with-eval-after-load 'magit (evil-collection-magit-setup))


;;;;;; EVIL EASYMOTION
(if (package-installed-p 'evil-easymotion) (require 'evil-easymotion) (package-vc-install 'evil-easymotion))
(evilem-default-keybindings "SPC")




;;;; MAGIT
(if (package-installed-p 'magit) (require 'magit) (package-vc-install 'magit))
(keymap-global-set "C-c m k l" 'magit-smerge-keep-lower)
(keymap-global-set "C-c m k u" 'magit-smerge-keep-upper)


;;;; PROJECTILE
(if (package-installed-p 'projectile) (require 'projectile) (package-vc-install 'projectile))
(keymap-global-set "C-c p" 'projectile-command-map)
(projectile-mode 1)


;;;; COMPANY
(if (package-installed-p 'company) (require 'company) (package-vc-install 'company))
(global-company-mode 1)


;;;; IVY
(if (package-installed-p 'ivy) (require 'ivy) (package-vc-install 'ivy))
(ivy-mode 1)


;;;; ENVRC
(if (package-installed-p 'envrc) (require 'envrc) (package-vc-install 'envrc))
(add-hook 'after-init-hook 'envrc-global-mode)


;;;; ORG
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


(if (package-installed-p 'org-roam-ui) (require 'org-roam-ui) (package-vc-install 'org-roam-ui))
(if (package-installed-p 'org-roam) (require 'org-roam) (package-vc-install 'org-roam))

(keymap-global-set "C-c o r i" 'org-roam-node-insert)
(keymap-global-set "C-c o r f" 'org-roam-node-find)
(keymap-global-set "C-c o r c" 'org-roam-dailies-goto-today)



;; DEVELOPMENT

;;;; Erlang
(if (package-installed-p 'erlang) (require 'erlang) (package-vc-install 'erlang))
;;;; Elixir
(if (package-installed-p 'elixir-mode) (require 'elixir-mode) (package-vc-install 'elixir-mode))
;;;; Scala
(if (package-installed-p 'scala-mode) (require 'scala-mode) (package-vc-install 'scala-mode))
;;;; Python
(if (package-installed-p 'python-mode) (require 'python-mode) (package-vc-install 'python-mode))
(if (package-installed-p 'pip-requirements) (require 'pip-requirements) (package-vc-install 'pip-requirements))
(if (package-installed-p 'py-autopep8) (require 'py-autopep8) (package-vc-install 'py-autopep8))
(add-hook 'python-mode-hook 'py-autopep8-mode)
(unintern 'py-comment-region)
(unintern 'py-uncomment)

;;;; LSP -> EGLOT
(require 'eglot)
(setq eglot-ignored-server-capabilities `(:documentHighlightProvider))

(add-to-list 'eglot-server-programs `(erlang-mode  , (concat lsp-folder "/" "elp")))
(add-to-list 'eglot-server-programs `(elixir-mode , (file-symlink-p (concat lsp-folder "/" "start_lexical.sh"))))
(add-to-list 'eglot-server-programs `(scala-mode , (concat lsp-folder "/" "metals")))

(keymap-global-set "C-c e r" 'eglot-rename)
(keymap-global-set "C-c e h" 'eldoc)
(keymap-global-set "C-c e d" 'xref-find-definitions)

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



(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)
