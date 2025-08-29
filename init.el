
;; INITIAL VARIABLES
(defconst is-home-station
  (if (getenv "HOMESTATION") t nil)
  "Constant to define if I am running on mine or employer's computer."
  )

(defconst saposa
  "Saposa"
  "The name of my beloved virtual companion."
  )

(defconst lsp-folder
  (getenv "LSP_FOLDER")
  "Directory to LSPs if exists."
  )

(defconst tools-directory
  (expand-file-name "tools/" user-emacs-directory)
  "Directory to store output related to external tools like mail."
  )

(defconst elpaca-lock-file-path
  (expand-file-name "lockfile.eld" user-emacs-directory)
  "Elpaca lock file path."
  )

;; Paths & packages


(add-to-list 'load-path "~/.emacs.d/sw")
(add-to-list 'load-path "~/.emacs.d/sw/modes")
(add-to-list 'load-path "~/.emacs.d/sw/fancy")

(require 'sw-elpaca)



;; (setq you-know '(combobulate
;; 			:url "https://github.com/mickeynp/combobulate.git"
;; 			:branch "59b64d66d66eb84da6a2cedd152b1692378af674"))

;; (package-vc-install you-know)




;; GENERAL PACKAGES

;;;; Function after init hooks
(defun init-sw-eglot-after-elpaca () (require 'sw-eglot))
(defun init-sw-hocon-mode-after-elpaca () (require 'sw-hocon))

;; TODO:
;; (add-hook 'elpaca-after-init-hook #'init-sw-eglot-after-elpaca)
;; Eval eglot after elpacka has finished to install all packages. Because eglot comes with the emacs distribution.
;;(elpaca eglot (require 'sw-eglot))

(add-hook 'elpaca-after-init-hook #'init-sw-eglot-after-elpaca)
(add-hook 'elpaca-after-init-hook #'init-sw-hocon-after-elpaca)


;;;; Libs
(elpaca dash)
(elpaca reformatter)
(require 'sw-settings)

;;;; Modes - Basics
(setq evil-want-keybinding 'nil)
(elpaca evil (require 'sw-evil))
(elpaca evil-collection)
(elpaca evil-easymotion (require 'sw-evil-easymotion))
(elpaca gptel (require 'sw-llm))
(elpaca org (require 'sw-org))
(elpaca org-roam (require 'sw-org-roam))
(elpaca org-roam-ui)
(elpaca orderless (require 'sw-orderless))
;;(elpaca dap (require 'sw-dap))
(elpaca transient) ;;just in case magit fails
(elpaca (magit :host github :repo "magit/magit":tag "v4.3.8") (require 'sw-magit))
(elpaca projectile (require 'sw-projectile))
(elpaca company (require 'sw-company))
(elpaca ivy (require 'sw-ivy))
;; ;;(require 'sw-vertico)
;; ;;(require 'sw-corfu)
(elpaca envrc (require 'sw-envrc))
(elpaca highlight-indentation)



;; ;;;; Modes - Lenguages
;; (require 'sw-emacs-lisp)
;; (require 'sw-erlang)
(elpaca elixir-mode (require 'sw-elixir))
;; (require 'sw-c)
(elpaca scala-mode)
(elpaca python-mode (require 'sw-python))
(elpaca sqlformat (require 'sw-sql))
(elpaca nix-mode)

;; ;;;; Modes - Others
;; (require 'sw-pairing)

;; ;;;; Fancy
(elpaca solo-jazz-theme)
(elpaca badwolf-theme (load-theme 'badwolf t))
(elpaca dashboard (require 'sw-dashboard))


;;;; Tools
(require 'sw-mail)

;; ;;;; Vertico
;; (if (package-installed-p 'vertico) (require 'vertico) (package-vc-install 'vertico))
;; (vertico-mode 1)
;;;;;; AUTOCOMPLETION END





(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

