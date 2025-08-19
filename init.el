;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; INITIAL VARIABLES
(defvar is-home-station (if (getenv "HOMESTATION") t nil))
(defvar lsp-folder (getenv "LSP_FOLDER"))

(defconst saposa "Saposa"
  "The name of my beloved virtual companion."
  )

;; Paths & packages

(defvar emacs-root-dir (getenv "EMACS_ROOT_DIR")) ;; .emacs.d
(cl-assert emacs-root-dir nil "Environment variable missing: EMACS_ROOT_DIR")
(setq emacs-tools-dir (file-name-concat emacs-root-dir "tools"))

(defvar tools-directory
  (expand-file-name "tools/" user-emacs-directory)
  "Directory to store output related to external tools like mail."
  )

(add-to-list 'load-path "~/.emacs.d/sw")
(add-to-list 'load-path "~/.emacs.d/sw/modes")
(add-to-list 'load-path "~/.emacs.d/sw/fancy")

(require 'sw-elpaca)



;; (setq you-know '(combobulate
;; 			:url "https://github.com/mickeynp/combobulate.git"
;; 			:branch "59b64d66d66eb84da6a2cedd152b1692378af674"))

;; (package-vc-install you-know)





;; GENERAL PACKAGES

;;;; Libs
(elpaca dash)
(elpaca reformatter)
(require 'sw-settings)
;;;; Modes - Basics

(setq evil-want-keybinding 'nil)
(elpaca evil (require 'sw-evil))
(elpaca evil-collection (require 'sw-evil-collection))
(elpaca evil-easymotion (require 'sw-evil-easymotion))
;; TODO:
;;(add-hook 'elpaca-after-init-hook '(require 'sw-eglot))
;; Eval eglot after elpacka has finished to install all packages. Because eglot comes with the emacs distribution.
(elpaca eglot (require 'sw-eglot))
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
;; (require 'sw-elixir)
;; (require 'sw-c)
;; (require 'sw-scala)
(elpaca python-mode (require 'sw-python))
;; (require 'sw-sql)
;; (require 'sw-hocon)

;; ;;;; Modes - Others
;; (require 'sw-pairing)

;; ;;;; Fancy
(elpaca solo-jazz-theme)
(elpaca badwolf-theme (load-theme 'badwolf t))
(elpaca dashboard (require 'sw-dashboard))


;; ;;;; Tools
;; (require 'sw-mail)

;; ;;;; Vertico
;; (if (package-installed-p 'vertico) (require 'vertico) (package-vc-install 'vertico))
;; (vertico-mode 1)
;;;;;; AUTOCOMPLETION END





(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

