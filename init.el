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
(setq org-agenda-inhibit-startup t)

(setq agenda-files-at-work `(,(file-truename "~/hive-mind-bbva/daily") ,(file-truename "~/hive-mind-bbva/knowledge")))
(setq org-agenda-files (append `(,(file-truename "~/hive-mind/knowledge")) (unless is-home-station agenda-files-at-work)))

(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "BLOCKED" "BLOCKED TO VERIFY" "|" "DONE")))
;; (setq org-todo-keyword-faces '(
;; 			       ("TODO" . (:background "#CAC9C7" :foreground "#9A9896" :weight bold))
;; 			       ("IN PROGRESS" . "#D3E5EF")
;; 			       ("BLOCKED" . (:background "red" :foreground "black" :weight bold))
;; 			       ("DONE" . (:background "green" :foreground "black" :weight bold))
;; 			       ("BLOCKED TO VERIFY" . (:background "purple" :foreground "black" :weight bold))))


(keymap-global-set "C-c o l" 'org-store-link)
(keymap-global-set "C-c o a" 'org-agenda)
(keymap-global-set "C-c o c" 'org-capture)

;; should be defined once on startup
(add-hook 'org-agenda-mode-hook
	  (lambda ()
	   (keymap-set org-agenda-mode-map "j" 'evil-next-line)
	   (keymap-set org-agenda-mode-map "k" 'evil-previous-line)))

;;;;;; ORG ROAM
(setq org-roam-directory (file-truename "~/hive-mind"))
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
	'(("d" "default" entry
           "* %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n"))
;; 	  ("j" "job template" entry
;;            "%?
;; * Movements %(org-set-tags \"movements\")

;; * Forecasting %(org-set-tags \"forecasting\")

;; * Reuniones 

;; * Other %(org-set-tags \"notes\")
;; "
;;            :target (file+head "%<%Y-%m-%d>.org"
;;                               "#+title: %<%Y-%m-%d>\n"))
	  ))
(setq org-roam-capture-templates
	'
	(
	 ("d" "default" plain "%?" :target
	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
")
	  :unnarrowed t)

;; 	 ("f" "table field" plain "%?" :target
;; 	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}


;; Tables ->
;; ")

;; 	  :unnarrowed t)
	 )
	)


(if (package-installed-p 'org-roam-ui) (require 'org-roam-ui) (package-vc-install 'org-roam-ui))
(if (package-installed-p 'org-roam) (require 'org-roam) (package-vc-install 'org-roam))

(org-roam-db-autosync-mode)

(keymap-global-set "C-c o r i" 'org-roam-node-insert)
(keymap-global-set "C-c o r f" 'org-roam-node-find)
(keymap-global-set "C-c o r c" 'org-roam-dailies-goto-today)



;; DEVELOPMENT

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






;;;; LSP -> EGLOT
(require 'eglot)
(setq eglot-ignored-server-capabilities `(:documentHighlightProvider))

(add-to-list 'eglot-server-programs `(c-mode  , (concat lsp-folder "/" "clangd")))
(add-to-list 'eglot-server-programs `(erlang-mode  , (concat lsp-folder "/" "elp")))
(add-to-list 'eglot-server-programs `(elixir-mode , (file-symlink-p (concat lsp-folder "/" "start_lexical.sh"))))

(keymap-global-set "C-c e r" 'eglot-rename)
(keymap-global-set "C-c e h" 'eldoc)
(keymap-global-set "C-c e f d" 'xref-find-definitions)
(keymap-global-set "C-c e f r" 'xref-find-references)

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

